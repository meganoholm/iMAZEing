using UnityEngine;
using System.Collections;

public class WinCollision : MonoBehaviour {

	void OnTriggerEnter(Collider other){
		Debug.Log ("win");
	}
}
