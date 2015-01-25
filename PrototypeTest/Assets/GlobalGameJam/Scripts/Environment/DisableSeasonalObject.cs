using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace Seasons
{
    public class DisableSeasonalObject : MonoBehaviour
    {
        void Start()
        {
            SeasonsGame.OnRestart += SeasonsGame_OnRestart;
        }

        void SeasonsGame_OnRestart()
        {
            //reset colliders
            var colliders = this.transform.parent.GetComponentsInChildren<Collider>();
            foreach (var col in colliders)
                col.enabled = true;
        }

        private void OnTriggerEnter(Collider col)
        {
            //reset colliders
            var colliders = this.transform.parent.GetComponentsInChildren<Collider>();
            foreach (var c in colliders)
                c.enabled = false;
        }
    }
}
