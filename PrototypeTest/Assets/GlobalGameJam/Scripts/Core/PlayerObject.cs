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
			gameObject.layer = CollisionMaskUtils.PlayerLayer;
			Debug.Log(gameObject.layer);
		}

        public Vector3 GetGroundNormal()
        {
            RaycastHit hit;
            LayerMask groundMask = 1 << CollisionMaskUtils.GroundLayer;
            if (Physics.Raycast(this.transform.position, Vector3.down + Vector3.right*0.5f, out hit, 100, groundMask))
            {
                return hit.normal;
            }
            return Vector3.up;
        }

		public void FixedUpdate() 
		{
			//m_controller.SimpleMove(((Vector3.right*MovementSpeed)+(Vector3.up*_windForce))*Time.
			if(rigidbody.velocity.magnitude < MaxGroundSpeed)
			{
                Vector3 playerForward = Vector3.right;
                Vector3 groundUp = GetGroundNormal();
                Vector3 cross = Vector3.Cross(groundUp, Vector3.up);
                float sign = cross.z < 0 ? -1 : 1;
                playerForward = Quaternion.AngleAxis(Vector3.Angle(groundUp, Vector3.up) * sign, Vector3.back) * playerForward;

                Debug.DrawLine(this.transform.position, this.transform.position + playerForward * 2f, Color.green);

                rigidbody.AddForce(playerForward * MovementSpeed, ForceMode.Impulse);
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