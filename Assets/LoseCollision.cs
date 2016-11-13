using UnityEngine;
using System.Collections;

public class LoseCollision : MonoBehaviour {

	void OnTriggerEnter(Collider other){
		Debug.Log ("lose");
		//other.transform.position = new Vector3(0, 0, 0);
	}
}
