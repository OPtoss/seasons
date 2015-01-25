using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class DialogueVolume : LevelObject 
	{
		[SerializeField] private string _text; 
		[SerializeField] private Color _textColor;
		protected override void EnteredObject (GameObject targetObject)
		{
			base.EnteredObject (targetObject);
			GameObject obj = Instantiate(Resources.Load<GameObject>("UI/WorldSpaceText"),collider.bounds.center,transform.rotation) as GameObject;
			obj.GetComponent<TextUIController>().RenderText(_text, _textColor);
		}
	}
}
