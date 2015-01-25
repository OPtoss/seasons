using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using DG.Tweening;
namespace Seasons
{
	public class TextUIController : MonoBehaviour 
	{
		private Text _textLayout;
		private RectTransform _transfrom;
		private bool _transitioning = false;
		private void OnEnable() 
		{
			_textLayout = GetComponentInChildren<Text>();
			_transfrom = GetComponent<RectTransform>();
			_transitioning = false;
			if(_textLayout == null)
			{
				Debug.LogError("Missing Text Element.");
			}
			else
			{
				//Set Default Text Alpha (Clear)
				_textLayout.color = new Color(1,1,1,0);
			}
		}
		
		public void RenderText(string text)
		{
			_textLayout.text = text;
			Tweener tween = DOTween.To(()=>_textLayout.color,
			                           x => _textLayout.color = x,
			                           new Color(1,1,1,1),0.5f);
		}
		
		private void Update()
		{
			if(_transfrom == null || _transitioning)
			{
				return;
			}
			//When off screen...
			if(_transfrom.anchoredPosition.x < Camera.main.ViewportToWorldPoint(new Vector3(0.2f,0,0)).x)
			{
				_transitioning = true;
				//Begin Fade when off screen.
				Tweener tween = DOTween.To(()=>_textLayout.color,
				                           x => _textLayout.color = x,
				                           new Color(1,1,1,0),0.5f);
				tween.OnComplete(()=>{GameObject.Destroy(gameObject);});
			}
		}
	}
}