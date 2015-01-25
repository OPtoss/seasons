using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class SeasonSwitcher : LevelObject 
	{
		[SerializeField] private int _season;
		[SerializeField] private bool _doesBlockInput;
		protected override void EnteredObject (GameObject targetObject)
		{
			if(IsPlayer(targetObject))
			{
				SeasonsGame.instance.ChangeSeasons(_season);
				SeasonsGame.instance.BlockInput(_doesBlockInput);
			}
		}
	}
}