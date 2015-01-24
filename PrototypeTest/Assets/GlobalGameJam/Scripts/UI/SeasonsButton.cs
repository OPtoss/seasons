using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;

namespace Seasons 
{
	public class SeasonsButton : MonoBehaviour, IPointerClickHandler
	{
		#region IPointerClickHandler implementation
		public void OnPointerClick (PointerEventData eventData)
		{
			SeasonsGame._instance.ChangeSeasons();
		}
		#endregion
	}
}
