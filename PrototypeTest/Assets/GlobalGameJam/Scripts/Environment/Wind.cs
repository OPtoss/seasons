using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class Wind : MonoBehaviour 
	{	
		[SerializeField] private float _windForce = 3f; 
		public void OnTriggerEnter(Collider col)
		{
			if(col.gameObject.layer == CollisionMaskUtils.S_PlayerLayer)
			{
				col.gameObject.GetComponent<PlayerObject>().SetWindForce(_windForce);
			}
		}

		public void OnTriggerExit(Collider col)
		{
			if(col.gameObject.layer == CollisionMaskUtils.S_PlayerLayer)
			{
				col.gameObject.GetComponent<PlayerObject>().SetWindForce(0);
			}
		}
	}
}
