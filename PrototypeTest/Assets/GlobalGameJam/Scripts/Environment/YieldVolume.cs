using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class YieldVolume : LevelObject 
	{
		[SerializeField] private int _desiredSeason;
		protected override void EnteredObject (GameObject targetObject)
		{
			if(SeasonsGame.instance.CurrentSeason != _desiredSeason)
			{
				SeasonsGame.instance.YieldSeason(_desiredSeason);
			}
		}
	}
}