using UnityEngine;

public class MotionBlur : ImageEffectBase
{
    protected override void Start()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth
                                                | DepthTextureMode.MotionVectors;
        base.Start();
    }
}