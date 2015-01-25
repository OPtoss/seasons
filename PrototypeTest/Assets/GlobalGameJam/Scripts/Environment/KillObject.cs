using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class KillObject : LevelObject 
	{
		protected override void EnteredObject (GameObject targetObject)
		{
			if(IsPlayer(targetObject))
			{
				SeasonsGame.instance.Die();
			}
		}
		protected override void TouchedObject (GameObject targetObject)
		{
			if(IsPlayer(targetObject))
			{
				SeasonsGame.instance.Die();
			}
		}
	}
}