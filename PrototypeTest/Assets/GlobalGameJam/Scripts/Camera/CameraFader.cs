using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class CameraFader : MonoBehaviour 
	{
		public RenderTexture renderTexture;

		public bool isFading = false;

		private float _fadeTime = 1;
		private float _fadePercent = 1;
		private bool _isIn = true;

        private void Start()
        {
            renderTexture = RenderTexture.GetTemporary(Screen.width, Screen.height);

            GetComponent<Camera>().targetTexture = renderTexture;
        }

		public float FadePercent 
		{
			get 
			{ 
				return _fadePercent; 
			}
			private set
			{
				_fadePercent = value;
			}
		}

		public void FadeIn( float time )
		{
			_fadeTime = time;
			_isIn = true;
            FadePercent = 0;

			StartCoroutine (FadeRoutine ());
		}

		public void FadeOut( float time )
		{
			_fadeTime = time;
			_isIn = false;
            FadePercent = 1;
			
			StartCoroutine (FadeRoutine ());
		}

		private IEnumerator FadeRoutine()
		{
			if (isFading) 
            {
				isFading = false;
				yield return null;
			}

			isFading = true;

			float startTime = Time.time;
			while (isFading) 
			{
                _fadePercent = ((Time.time - startTime) / _fadeTime);
				if (!_isIn)
                    _fadePercent = 1 - _fadePercent;

				// did we finish?
                if (_fadePercent >= 1 && _isIn)
				{
                    _fadePercent = 1;
					break;
				}
                else if (_fadePercent <= 0 && !_isIn)
				{
                    _fadePercent = 0;
					break;
				}

                yield return null;
			}
		}
	}
}