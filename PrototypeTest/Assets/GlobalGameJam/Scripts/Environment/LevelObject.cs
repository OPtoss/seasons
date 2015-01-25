using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class LevelObject : MonoBehaviour {

		protected virtual void TouchedObject(GameObject targetObject)
		{

		}

		protected virtual void EnteredObject(GameObject targetObject)
		{

		}

		protected virtual void LeftObject(GameObject targetObject)
		{

		}

		protected bool IsPlayer(GameObject targetObject)
		{
			return targetObject.layer == CollisionMaskUtils.PlayerLayer;
		}

		private void OnCollisionEnter(Collision col)
		{
			TouchedObject(col.gameObject);
		}

		private void OnTriggerEnter(Collider col)
		{
			EnteredObject(col.gameObject);
		}

		private void OnTriggerExit(Collider col)
		{
			LeftObject(col.gameObject);
		}
	}
}