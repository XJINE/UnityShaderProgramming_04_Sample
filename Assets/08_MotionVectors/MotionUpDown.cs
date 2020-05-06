using UnityEngine;

public class MotionUpDown : MonoBehaviour
{
    public  float   scale = 3;
    public  float   speed = 1;
    private Vector3 basePosition;

    private void Start()
    {
        basePosition = transform.position;
    }

    void Update()
    {
        transform.position = basePosition
                           + Vector3.up
                           * Mathf.Sin(Time.time * speed)
                           * scale;
    }
}