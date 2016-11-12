using UnityEngine;
using System.Collections;

public class FlyScript : MonoBehaviour {

	private Rigidbody rb;
	public float speed;
	private  Camera mainCam;

	// Use this for initialization
	void Start () {
		rb = GetComponent<Rigidbody> ();
		mainCam = Camera.main;
	}
	
	// Update is called once per frame
	void FixedUpdate () {
		float vertical = Input.GetAxis ("Vertical");
		float horizontal = Input.GetAxis ("Horizontal");
//		Input.GetButton ("Fire1");
//		Input.GetButton ("Fire2");
		rb.AddForce(mainCam.transform.forward * speed * vertical);
		rb.AddForce (mainCam.transform.right * speed * horizontal);
		rb.transform.forward = mainCam.transform.forward;
		//rb.transform.right = mainCam.transform.right;
	}
}
