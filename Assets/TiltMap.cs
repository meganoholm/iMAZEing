using UnityEngine;
using System.Collections;

public class TiltMap : MonoBehaviour {

	private Rigidbody rb;
	public Vector3 rotationAmount;


	// Use this for initialization
	void Start () {
		
		rb = GetComponent<Rigidbody> ();
		//rotationAmount.Set(0, 0, 0);


	}
	
	// Update is called once per frame
	void Update () {
        //		float horizontal = Input.GetAxis ("Horizontal");
        //		float vertical = Input.GetAxis ("Vertical");
        //		//rb.transform.rotation.Set(vertical+100, 0, horizontal+100, 0);
        //		print(rb.transform.rotation);

        if (Mathf.Abs(Input.GetAxis("Horizontal")) <= (float).7 && Mathf.Abs(Input.GetAxis("Vertical")) <= (float).7)
        {
            rb.transform.Rotate((Vector3.forward * Input.GetAxis("Horizontal") * 1) + (Input.GetAxis("Vertical") * Vector3.left * 1));
        }

        Debug.Log(Input.GetAxis("Horizontal") * 1);

	}


}
