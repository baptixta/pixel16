using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Coin : MonoBehaviour
{
    [SerializeField]
    private float rotateSpeed;

    private void FixedUpdate()
    {
        transform.Rotate(0f, rotateSpeed * Time.fixedDeltaTime, 0f, Space.World);
    }
}
