using UnityEngine;
using System.Collections;
namespace Seasons 
{
	[RequireComponent(typeof(BoxCollider))]
	public class KillZ : MonoBehaviour 
	{
		public void OnTriggerEnter(Collider col) 
		{
			if(col.gameObject.layer == CollisionMaskUtils.PlayerLayer)
			{
				SeasonsGame._instance.Restart();
			}
		}
	}
}
