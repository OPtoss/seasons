using UnityEngine;
using System.Collections;
using System; 

namespace Seasons 
{
	public class SeasonsGame : MonoBehaviour 
	{
		public static float Z_DIST = 10.0f;
		public static SeasonsGame _instance;

		[SerializeField] private Transform _spawnPoint;

		private PlayerObject _player;
		private GameCameraManager _cameraManager;
		private int _currentSeason = 0;

		private void Awake() 
		{
			_instance = this;
			_player = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerObject>();
			_cameraManager = GameObject.FindGameObjectWithTag("CameraManager").GetComponent<GameCameraManager>();
		}

		public void Restart()
		{
			_player.transform.position = _spawnPoint.position;
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
	}
}