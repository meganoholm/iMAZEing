using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class LoseCollision : MonoBehaviour {
	bool collide;

	void OnTriggerEnter(Collider other){
		Debug.Log ("lose");
		collide = true;
	}

	void OnGUI(){
		if (collide) {
			if (GUI.Button (new Rect (Screen.width / 2 - 75, Screen.height / 2 - 20, 150, 30), "Play Again?")) {
				print ("Starting new game");
				Scene scene = SceneManager.GetActiveScene();
				SceneManager.LoadScene (scene.name);
			}
			if (GUI.Button (new Rect (Screen.width / 2 - 75, Screen.height / 2 + 20, 150, 30), "Quit to menu?")) {
				print ("Quit to menu");
				SceneManager.LoadScene ("titleScreen");
			}
		}
	}
}
