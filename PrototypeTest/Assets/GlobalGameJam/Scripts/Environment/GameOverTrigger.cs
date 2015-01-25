using UnityEngine;
using System.Collections;
using DG.Tweening;
namespace Seasons
{
	public class GameOverTrigger : LevelObject 
	{
		[SerializeField] private ParticleSystem _snow;
		private float _initialEmissionRate;
		private float _initialSize;
		protected override void EnteredObject (GameObject targetObject)
		{
			base.EnteredObject (targetObject);
			_initialEmissionRate = _snow.emissionRate;
			_initialSize = _snow.startSize;
			_snow.Play();
			Tweener tween = DOTween.To(()=>_snow.emissionRate, 
			                           x=>_snow.emissionRate = x,
			                           100,
			                           3.7f);
			DOTween.To(()=>_snow.startSize, 
			           x=>_snow.startSize = x,
			           100,
			           3.7f);
			tween.OnComplete(()=>SeasonsGame.instance.GameComplete(Cleanup));
			SeasonsGame.instance.FreezePlayer();
		}

		private void Cleanup()
		{
			_snow.emissionRate = _initialEmissionRate;
			_snow.startSize = _initialSize;
			_snow.Stop();
		}
	}
}