using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class Wind : LevelObject 
	{	
		[SerializeField] private Vector2 _windForce = new Vector2(0.1f,0.2f); 
		protected override void EnteredObject(GameObject other)
		{
			base.EnteredObject(other);
			if(IsPlayer(other))
			{
				SeasonsGame._instance.PlayerInstance.SetVelocityModifer(_windForce);
			}
		}

		protected override void LeftObject (GameObject other)
		{
			base.LeftObject (other);
			if(IsPlayer(other))
			{
				SeasonsGame._instance.PlayerInstance.SetVelocityModifer(Vector2.zero);
			}
		}
	}
}
