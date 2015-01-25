using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class DialogueVolume : LevelObject 
	{
		[SerializeField] private string _text; 
		[SerializeField] private Color _textColor;
		[SerializeField] private float _textDistance = 15f;
		protected override void EnteredObject (GameObject targetObject)
		{
			base.EnteredObject (targetObject);
			GameObject obj = Instantiate(Resources.Load<GameObject>("UI/WorldSpaceText"),
			                             collider.bounds.center + (Vector3.right * _textDistance),
			                             transform.rotation) as GameObject;
			obj.GetComponent<TextUIController>().RenderText(_text, _textColor);
		}
	}
}
