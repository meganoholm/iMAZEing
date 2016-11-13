using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class titleMenu : MonoBehaviour {

	void Start() {
		SceneManager.UnloadScene ("gameScene");
		SceneManager.UnloadScene ("babySteps");
		Scene scene = SceneManager.GetActiveScene();
		SceneManager.LoadScene (scene.name);
	}

	void OnGUI () {
		if (GUI.Button (new Rect (Screen.width / 2 - 75, Screen.height / 2 - 60, 200, 30), "Play IMPOSSIBLE version?")) {
			print ("immpossible chosen");
			SceneManager.UnloadScene ("babySteps");
			SceneManager.UnloadScene ("titleScreen");
			SceneManager.LoadScene ("gameScene");
		}
		if (GUI.Button (new Rect (Screen.width / 2 - 75, Screen.height / 2 - 20, 200, 30), "Play easy level")) {
			print ("easy chosen");
			SceneManager.UnloadScene ("titleScreen");
			SceneManager.UnloadScene ("gameScreen");
			SceneManager.LoadScene ("babySteps");
		}
		if (GUI.Button (new Rect (Screen.width / 2 - 75, Screen.height / 2 + 20, 200, 30), "Quit game?")) {
			print ("Quit game");
			Application.Quit ();
		}
	}
}
