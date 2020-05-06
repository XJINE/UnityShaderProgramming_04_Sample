using UnityEngine;

public class MotionVectors : ImageEffectBase
{
    protected override void Start()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth
                                                | DepthTextureMode.MotionVectors;
        base.Start();
    }
}