using UnityEngine;
using System.Collections;

namespace Seasons
{
	public class EmitterObject : LevelObject {
		[SerializeField] private ParticleSystem _particleSystem; 

		private GameObject _containerObject;
		// Use this for initialization
		void Enable () {
			//_containerObject = new GameObject("ParticleContainer");
		}
	}
}
