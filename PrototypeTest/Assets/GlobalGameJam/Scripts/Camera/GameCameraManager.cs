using UnityEngine;
using System.Collections.Generic;

namespace Seasons
{
	public class GameCameraManager : MonoBehaviour 
	{
		[SerializeField] private Transform _target;
		[SerializeField] private float _followDistance = -10f;
        [SerializeField] private GameObject _templateCamera;
        [SerializeField] private Material _fadeMaterial;

        public float fadeTime = 1f;

		private List<Camera> _seasonCameras;

        public int _prevCameraIndex = 0;
        public int _cameraIndex = 0;

        [SerializeField]
        private RenderTexture _intermediateRT;


		private void OnEnable()
		{
			_seasonCameras = new List<Camera>();
			GameObject tempObject;
			Camera cam;
			for(int i = 0; i < 4; i++)
			{
				tempObject = (GameObject)Instantiate(_templateCamera, Vector3.zero, Quaternion.identity );
				cam = tempObject.GetComponent<Camera>();
                cam.enabled = false;
				_seasonCameras.Add(cam);
				tempObject.transform.parent = transform;
				tempObject.transform.position += Vector3.forward * (SeasonsGame.Z_DIST*i);
			}

            //_fadingRT = RenderTexture.GetTemporary(Screen.width, Screen.height);
            _intermediateRT = RenderTexture.GetTemporary(Screen.width, Screen.height);

			ChangeCamera(0); //Default to the 0th Camera.
		}

		public void ChangeCamera(int newIndex)
		{
			if (_cameraIndex == newIndex)
				return;

            var prev = _cameraIndex >= 0 ? _seasonCameras[_cameraIndex] : null;
            var next = _seasonCameras [newIndex];

            var fader = next.GetComponent<CameraFader>();
            fader.FadeIn(fadeTime);

            _prevCameraIndex = _cameraIndex;
            _cameraIndex = newIndex;
            
		}

        private void OnPreCull()
        {
            Camera prev = null;
            if (_prevCameraIndex >= 0)
                prev = _seasonCameras[_prevCameraIndex];
            var next = _seasonCameras[_cameraIndex];

            var fader = next.GetComponent<CameraFader>();
            if (fader.isFading)
            {
                if (prev)
                    prev.Render();
                next.Render();
            }
            else
            {
                //next.targetTexture = null;
                next.Render();
            }
        }

        private void OnRenderImage(RenderTexture source, RenderTexture destination )
        {
            var next = _seasonCameras[_cameraIndex];
            
            var nextFader = next.GetComponent<CameraFader>();

            if (nextFader.isFading && _prevCameraIndex >= 0)
            {
                var prev = _seasonCameras[_prevCameraIndex];
                var prevFader = prev.GetComponent<CameraFader>();

                Graphics.Blit(prevFader.renderTexture, destination);

                _fadeMaterial.SetFloat("_Alpha", nextFader.FadePercent);
                Graphics.Blit(nextFader.renderTexture, destination, _fadeMaterial);

                //Graphics.Blit(_intermediateRT, destination);
            }
            else
            {
                Graphics.Blit(nextFader.renderTexture, destination);
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