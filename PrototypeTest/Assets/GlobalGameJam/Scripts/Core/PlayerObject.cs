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
		private Vector2 _velocityModifier;
		private void Start() 
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
			if(_velocityModifier.magnitude > 0)
			{
				if(rigidbody.velocity.magnitude < MaxAirSpeed)
				{
					rigidbody.AddForce(new Vector3(_velocityModifier.x,_velocityModifier.y,0),ForceMode.Impulse);
				}
			}
		}

		public void SetVelocityModifer (Vector2 force)
		{
			_velocityModifier = force;
		}

		public void UpdatePlayerDepth(int depth) 
		{
			transform.position = new Vector3(transform.position.x,
			                                 transform.position.y,
			                                 depth * SeasonsGame.Z_DIST);
		}
	}
}