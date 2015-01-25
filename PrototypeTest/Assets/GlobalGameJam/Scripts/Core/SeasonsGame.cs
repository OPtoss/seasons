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
        [SerializeField]
        private int _startSeason = 2;
		private int _currentSeason = 0;

        private bool _isTapDown = false;
		private int _targetYieldSeason = -1;

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

            _currentSeason = _startSeason;
            _cameraManager.ChangeCamera(_currentSeason);
            _player.UpdatePlayerDepth(_currentSeason);
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

		public void YieldSeason(int targetSeason)
		{
			_targetYieldSeason = targetSeason;
		}

        public void Update()
        {
            if (Input.GetAxis("Tap") > 0)
            {
                if (!_isTapDown)
                {
                    _isTapDown = true;

                    ChangeSeasons();
                }
            }
            else
            {
                _isTapDown = false;
            }
        }
	}
}