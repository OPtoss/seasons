using UnityEngine;
using System.Collections;
using System; 

namespace Seasons 
{
	public class SeasonsGame : MonoBehaviour 
	{
		public static float Z_DIST = 50f;
		public static SeasonsGame instance;

		[SerializeField] private Transform _spawnPoint;

		private PlayerObject _player;
		private GameCameraManager _cameraManager;
		private FadeController _fadeController;

        [SerializeField]
        private int _startSeason = 2;
		private int _currentSeason = 0;

        private bool _isTapDown = false;
		private int _targetYieldSeason = -1;
		private bool _gameComplete = false;

		public PlayerObject PlayerInstance
		{
			get
			{
				return _player;
			}
		}

		public int CurrentSeason {
			get
			{
				return _currentSeason;
			}
		}

		public bool IsWaitingForUser
		{
			get
			{
				return _targetYieldSeason != -1;
			}
		}

		private void Awake() 
		{
			instance = this;
			_player = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerObject>();
			_cameraManager = GameObject.FindGameObjectWithTag("CameraManager").GetComponent<GameCameraManager>();
			_fadeController = GameObject.FindGameObjectWithTag ("FadeController").GetComponent<FadeController>();
			DG.Tweening.DOTween.Init();
		}

		private void Start()
		{
            _currentSeason = _startSeason;
			_cameraManager.ChangeCamera(_currentSeason);
			_player.UpdatePlayerDepth(_currentSeason);
		}

		public void Restart()
		{
			_player.transform.position = _spawnPoint.position;
			_targetYieldSeason = -1;
			_gameComplete = false;
            _currentSeason = _startSeason;
            _cameraManager.ChangeCamera(_currentSeason);
            _player.UpdatePlayerDepth(_currentSeason);
		}

		public void Die ()
		{
			_fadeController.FadeBlack(Restart);
		}

		public void ChangeSeasons()
		{
			if(_currentSeason == 3) 
			{
				_currentSeason = 0;
			} 
			else 
			{
				_currentSeason++;
			}

			//Release yield.
			if(_currentSeason == _targetYieldSeason)
			{
				_targetYieldSeason = -1;	
			}
			_cameraManager.ChangeCamera(_currentSeason);
			_player.UpdatePlayerDepth(_currentSeason);
		}

		public void FreezePlayer()
		{
			_targetYieldSeason = -2;
		}

		public void YieldSeason(int targetSeason)
		{
			_targetYieldSeason = targetSeason;
		}

		public void GameComplete (System.Action action)
		{
			if(_fadeController != null)
			{
				_fadeController.FadeUIIn(action);
			}

			_gameComplete = true;
		}

        public void Update()
        {
            if (Input.GetAxis("Tap") > 0)
            {
                if (!_isTapDown)
                {
                    _isTapDown = true;
					if(!_gameComplete)
					{
						ChangeSeasons();
					}
					else if(_fadeController == null && _gameComplete)
					{
						Restart();
					}
					else if(_gameComplete)
					{
						if(_fadeController.CanRestart())
						{
							Restart();
							_fadeController.FadeUIOut();
						}
					}
                }
            }
            else
            {
                _isTapDown = false;
            }
        }
	}
}