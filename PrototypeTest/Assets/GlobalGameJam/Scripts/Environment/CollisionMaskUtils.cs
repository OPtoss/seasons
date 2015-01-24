using UnityEngine;
using System.Collections;

public class CollisionMaskUtils : MonoBehaviour {
	public static int S_PlayerLayer;
	// Use this for initialization
	private void Awake () 
	{
		S_PlayerLayer = LayerMask.NameToLayer("Player");
	}
}
