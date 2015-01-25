using UnityEngine;
using System.Collections;
namespace Seasons
{
	public class MessageAnimationController : MonoBehaviour 
	{
		private Animator _animator;

		private void OnEnable()
		{
			_animator = GetComponent<Animator>();
		}

		public void MessageReceived()
		{
			_animator.SetTrigger("MessageReceived");
		}
	}
}
