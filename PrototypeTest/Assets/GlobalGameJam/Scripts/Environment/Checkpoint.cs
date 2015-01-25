using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class Checkpoint : LevelObject {
		[SerializeField] private Transform _target;
		protected override void EnteredObject (GameObject targetObject)
		{
			base.EnteredObject (targetObject);
			SeasonsGame.instance.SetCheckpoint(_target);
		}
	}
}
