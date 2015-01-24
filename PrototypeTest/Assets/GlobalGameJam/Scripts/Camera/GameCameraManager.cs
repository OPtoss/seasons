using UnityEngine;
using System.Collections.Generic;

namespace Seasons
{
	public class GameCameraManager : MonoBehaviour 
	{
		[SerializeField] private Transform _target;
		[SerializeField] private float _followDistance = -10f;

		private List<Camera> _seasonCameras;

		private void OnEnable()
		{
			_seasonCameras = new List<Camera>();
			GameObject tempObject;
			Camera cam;
			for(int i = 0; i < 4; i++)
			{
				tempObject = new GameObject("Camera"+(i+1));
				cam = tempObject.AddComponent<Camera>();
				cam.farClipPlane = 15f;
				cam.orthographic = true;
				_seasonCameras.Add(cam);
				tempObject.transform.parent = transform;
				tempObject.transform.position += Vector3.forward * (SeasonsGame.Z_DIST*i);
			}
			UpdateCamera(0); //Default to the 0th Camera.
		}

		public void UpdateCamera(int newIndex)
		{
			//Do fancy fades and shit here.
			for(int i = 0; i < _seasonCameras.Count; i++) 
			{
				if(i == newIndex) 
				{
					//Pull camera index to the front.
					_seasonCameras[i].depth = 10;
				}
				else 
				{
					_seasonCameras[i].depth = _seasonCameras.Count-i;
				}
			}
		}

		// Update is called once per frame
		private void Update () 
		{
			Vector3 targetPos = new Vector3(_target.position.x, _target.position.y, 0);
			transform.localPosition = targetPos + (Vector3.forward*_followDistance);
		}
	}
}