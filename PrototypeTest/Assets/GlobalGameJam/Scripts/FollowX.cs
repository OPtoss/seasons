using UnityEngine;
using System.Collections;

namespace Seasons
{
    public class FollowX : MonoBehaviour
    {
        public Transform target;
        private float yOffset;

        void Start()
        {
            yOffset = this.transform.position.y - target.position.y;
        }
        void Update()
        {
            Vector3 pos = this.transform.position;
            pos.x = target.position.x;
            pos.y = target.position.y + yOffset;
            this.transform.position = pos;
        }
    }
}