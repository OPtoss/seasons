using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class Wind : MonoBehaviour 
	{	
		[SerializeField] private Vector2 _windForce; 
		public void OnTriggerEnter(Collider col)
		{
			if(col.gameObject.layer == CollisionMaskUtils.S_PlayerLayer)
			{
				col.gameObject.GetComponent<PlayerObject>().SetVelocityModifer(_windForce);
			}
		}

		public void OnTriggerExit(Collider col)
		{
			if(col.gameObject.layer == CollisionMaskUtils.S_PlayerLayer)
			{
				col.gameObject.GetComponent<PlayerObject>().SetVelocityModifer(Vector2.zero);
			}
		}
	}
}
