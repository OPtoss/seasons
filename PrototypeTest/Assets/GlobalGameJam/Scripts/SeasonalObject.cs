using UnityEngine;
using System.Collections.Generic;
namespace Seasons
{
	[SelectionBase]
	public class SeasonalObject : MonoBehaviour 
	{
		[SerializeField] private List<LevelObject> _seasonObjects;
		private List<LevelObject> _objectReferences;

		private void OnEnable() 
		{
		}

		private void ValidateLists() 
		{
			if(_seasonObjects == null) 
			{
				_seasonObjects = new List<LevelObject>();
			}
			if(_objectReferences == null) 
			{
				_objectReferences = new List<LevelObject>();	
			}
		}

		public void Reload() 
		{
			_objectReferences.Clear();
			for(int i = 0; i < transform.childCount; i++) 
			{
				_objectReferences.Add(transform.GetChild(i).gameObject.GetComponent<LevelObject>());
			}
		}

#if UNITY_EDITOR

		public void DrawHandles() 
		{
			ValidateLists();
			Vector3 tempPosition;
			for(int i = 0; i < _objectReferences.Count; i++)
			{
				tempPosition = _objectReferences[i].transform.position;
				UnityEditor.Handles.color = new Color(0.5f,0.5f,0.5f,0.5f);
				_objectReferences[i].transform.position = UnityEditor.Handles.FreeMoveHandle(_objectReferences[i].transform.position,
				                                                                             Quaternion.identity,
				                                                                             UnityEditor.HandleUtility.GetHandleSize(tempPosition)*0.2f,
				                                                                             Vector3.zero,
				                                                                             UnityEditor.Handles.DotCap);
				tempPosition.Set(_objectReferences[i].transform.position.x,_objectReferences[i].transform.position.y,tempPosition.z);
				_objectReferences[i].transform.position = tempPosition;
			}
		}

		public void GenerateAssets() 
		{
			ValidateLists();
			while(_objectReferences.Count > 0) 
			{
				GameObject.DestroyImmediate(_objectReferences[0]);
				_objectReferences.RemoveAt(0);
			}
			
			LevelObject tempObject;
			for(int i = 0; i < _seasonObjects.Count; i++) 
			{
				if(_seasonObjects[i] == null) 
				{
					continue;
				}
				tempObject = LevelObject.Instantiate(_seasonObjects[i],
				                                    transform.position+Vector3.forward*(i*SeasonsGame.Z_DIST),
				                                    Quaternion.identity) as LevelObject;
				tempObject.transform.parent = transform;
				_objectReferences.Add(tempObject);
			} 
		}
#endif
	}
}