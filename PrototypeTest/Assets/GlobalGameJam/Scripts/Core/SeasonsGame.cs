using UnityEngine;
using System.Collections;
using System; 

namespace Seasons 
{
	public class SeasonsGame : MonoBehaviour 
	{
		public static event Action OnRestart;
		
		public static float Z_DIST = 50f;
		public static SeasonsGame instance;
		
		[SerializeField] private Transform _spawnPoint;
		private int _seasonCheckpoint;
		private Transform _baseSpawn;
		
		private PlayerObject _player;
		private GameCameraManager _cameraManager;
		private FadeController _fadeController;
		
		[SerializeField]
		private int _startSeason = 2;
		private int _currentSeason = 0;
		
		private bool _isTapDown = false;
		private int _targetYieldSeason = -1;
		private bool _gameComplete = false;
		private bool _blockInput = false;
		
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
			_player.transform.position = _spawnPoint.position;

			_fadeController.FadeFromWhite();
			_currentSeason = _startSeason;
			_cameraManager.ChangeCamera(_currentSeason);
			_player.UpdatePlayerDepth(_currentSeason);
			_baseSpawn = _spawnPoint;
			_seasonCheckpoint = _currentSeason;			
		}

		public void SetCheckpoint (Transform _target)
		{
			_spawnPoint = _target;
			_seasonCheckpoint = _currentSeason;
		}
		
		public void BlockInput(bool isBlocking)
		{
			_blockInput = isBlocking;
		}
		
		public void Restart()
		{
			if (OnRestart != null)
				OnRestart();
			_blockInput = false;
			_currentSeason = _seasonCheckpoint;
			_player.transform.position = _spawnPoint.position;
			_targetYieldSeason = -1;
			_gameComplete = false;
			_cameraManager.ChangeCamera(_currentSeason);
			_player.UpdatePlayerDepth(_currentSeason);
		}
		
		public void Die ()
		{
			_fadeController.FadeBlack(Restart);
		}
		
		public void ChangeSeasons(int season)
		{
			//Release yield.
			if(_currentSeason == _targetYieldSeason)
			{
				_targetYieldSeason = -1;	
			}
			_currentSeason = season;
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
		
		public void FreezePlayer()
		{
			_targetYieldSeason = -2;
			PlayerInstance.Kill(); 
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
			_spawnPoint = _baseSpawn;
			_currentSeason = _startSeason;
			_gameComplete = true;
		}
		
		public void Update()
		{
			if (Input.GetAxis("Tap") > 0)
			{
				if (!_isTapDown)
				{
					_isTapDown = true;
					if(!_gameComplete && !_blockInput)
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
							_player.Revive();
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