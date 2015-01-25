using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using System.Collections;
namespace Seasons
{
	public class FadeController : MonoBehaviour 
	{
		[SerializeField] private Image _blackImage;
		[SerializeField] private Text _credits;
		[SerializeField] private Text _pressAnyKeyToContinue;
		private bool _canRestart = false;
		public void FadeUIIn(System.Action onComplete)
		{
			Tweener tween = DOTween.To(()=>_blackImage.color,
							           x=>_blackImage.color = x,
							           new Color(1,1,1,1),
							           1.5f);
			tween.OnComplete(()=>HangWhite(onComplete));
		}

		public void FadeFromWhite ()
		{
			_blackImage.color = new Color(1,1,1,1);
			Tweener tween = DOTween.To(()=>_blackImage.color,
			                           x=>_blackImage.color = x,
			                           new Color(1,1,1,0),
			                           1.5f);
		}

		private void HangWhite(System.Action action)
		{
			float f = 0.0f;
			Tweener tween = DOTween.To(()=>f,
			                           x => f = x,
			                           10.0f,
			                           1.5f);
			tween.OnComplete(()=>ShowCredits(action));

		}

		public void FadeBlack(System.Action resetFunction)
		{
			Tweener tween = DOTween.To(()=>_blackImage.color,
							           x=>_blackImage.color = x,
							           new Color(0,0,0,1),
							           1.5f);

			tween.OnComplete(()=>FadeReset(resetFunction));
		}

		public void FadeReset(System.Action func)
		{
			func();
			Tweener tween = DOTween.To(()=>_blackImage.color,
			                           x=>_blackImage.color = x,
			                           new Color(1,1,1,0),
			                           1.5f);
		}

		public void FadeUIOut ()
		{
			//To ensure this isn't spammed.
			_canRestart = false;
			DOTween.To(()=>_blackImage.color,
			                           x=>_blackImage.color = x,
			                           new Color(1,1,1,0),
			                           1.5f);
			DOTween.To(()=>_credits.color,
			                           x=>_credits.color = x,
			                           new Color(0,0,0,0),
			                           1.5f);
			Tweener tween = DOTween.To(()=>_pressAnyKeyToContinue.color,
			                           x=>_pressAnyKeyToContinue.color = x,
			                           new Color(0,0,0,0),
			                           1.5f);
		}

		private void ShowCredits(System.Action onComplete)
		{
			onComplete();
			Tweener tween = DOTween.To(()=>_credits.color,
			                           x=>_credits.color = x,
			                           new Color(0,0,0,1),
			                           1.5f);
			tween.OnComplete(()=>PressAnyKeyToContinue());
		}

		private void PressAnyKeyToContinue()
		{
			Tweener tween = DOTween.To(()=>_pressAnyKeyToContinue.color,
			                           x=>_pressAnyKeyToContinue.color = x,
			                           new Color(0,0,0,1),
			                           1.5f);
			tween.OnComplete(()=>_canRestart = true);
		}
			

		public bool CanRestart()
		{
			return _canRestart;
		}
	}
}
