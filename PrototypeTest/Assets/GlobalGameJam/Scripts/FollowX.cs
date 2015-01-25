using UnityEngine;
using System.Collections;

namespace Seasons
{
    public class FollowX : MonoBehaviour
    {
        public Transform target;
        void Update()
        {
            Vector3 pos = this.transform.position;
            pos.x = target.position.x;
            this.transform.position = pos;
        }
    }
}