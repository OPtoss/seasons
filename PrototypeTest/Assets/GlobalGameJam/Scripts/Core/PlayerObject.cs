using UnityEngine;
using System.Collections;
namespace Seasons 
{
	//[RequireComponent(typeof(CharacterController))]
	public class PlayerObject : MonoBehaviour 
	{
		//private CharacterController m_controller;
		public float MovementSpeed = 10f;
		public float MaxGroundSpeed = 2f;
		public float MaxAirSpeed = 4f;
		private float _windForce;
		private void OnEnable() 
		{
			//m_controller = GetComponent<CharacterController>();
			gameObject.layer = CollisionMaskUtils.S_PlayerLayer;

		}

		public void Update() 
		{
			//m_controller.SimpleMove(((Vector3.right*MovementSpeed)+(Vector3.up*_windForce))*Time.
			if(rigidbody.velocity.magnitude < MaxGroundSpeed)
			{
				rigidbody.AddForce(Vector3.right*MovementSpeed,ForceMode.Acceleration);
			}
			if(_windForce > 0)
			{
				if(rigidbody.velocity.magnitude < MaxAirSpeed)
				{
					rigidbody.AddForce(Vector3.up * _windForce,ForceMode.Impulse);
				}
			}
		}

		public void SetWindForce (float windForce)
		{
			_windForce = windForce;
		}

		public void UpdatePlayerDepth(int depth) 
		{
			transform.position = new Vector3(transform.position.x,
			                                 transform.position.y,
			                                 depth * SeasonsGame.Z_DIST);
		}
	}
}