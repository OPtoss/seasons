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

		public PlayerObject PlayerInstance
		{
			get
			{
				return _player;
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
			_cameraManager.ChangeCamera(_currentSeason);
			_player.UpdatePlayerDepth(_currentSeason);
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