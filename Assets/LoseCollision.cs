using UnityEngine;
using System.Collections;

public class LoseCollision : MonoBehaviour {

	void OnTriggerEnter(Collider other){
		Debug.Log ("lose");
	}
}
