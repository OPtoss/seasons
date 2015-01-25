using UnityEngine;
using System.Collections;

public class CollisionMaskUtils : MonoBehaviour {
	private static int s_playerLayer = -1; 
	public static int PlayerLayer
	{
		get
		{
			if(s_playerLayer == -1)
			{
				s_playerLayer = LayerMask.NameToLayer("Player");				
			}
			return s_playerLayer;
		}
	}
}
