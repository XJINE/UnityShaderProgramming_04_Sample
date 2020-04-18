using UnityEngine;

public class MotionRotate : MonoBehaviour
{
    public float speed = 500;

    void Update()
    {
        float rotateAngleDegree = speed * Time.deltaTime;

        base.transform.RotateAround(transform.position,
                                    Vector3.forward,
                                    rotateAngleDegree);
    }
}