using UnityEngine;
using UnityEditor;
using System.Collections;
namespace Seasons 
{
	[CustomEditor(typeof(SeasonalObject))]
	public class SeasonalObjectEditor : Editor
	{
		private SeasonalObject _seasonObject;
		public override void OnInspectorGUI ()
		{
			base.OnInspectorGUI ();
			GUILayout.BeginHorizontal(GUILayout.Width(250));
			if(GUILayout.Button("Refresh")) 
			{
				_seasonObject.GenerateAssets();
			}
			if(GUILayout.Button("Reload")) 
			{
				_seasonObject.Reload();
			}
			GUILayout.EndHorizontal();
		}
		private void OnSceneGUI() 
		{
			if(_seasonObject == null) 
			{
				_seasonObject = (target as SeasonalObject);
			}
			//Early out for selection optimization.
			if(!IsSelected(_seasonObject.gameObject)) 
			{
				return;
			}
			_seasonObject.DrawHandles();
			if(GUI.changed) 
			{
				EditorUtility.SetDirty(target);
			}
		}

		public static bool IsSelected(GameObject gameObject)
		{
			for(int i = 0; i < Selection.gameObjects.Length; i++)
			{
				if(Selection.gameObjects[i].GetInstanceID() == gameObject.GetInstanceID()) 
				{
					return true; 
				}
			}
			return false;
		}

	}
}
