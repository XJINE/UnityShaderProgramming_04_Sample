using UnityEngine;

public class MotionBlur : ImageEffectBase
{
    protected override void Start()
    {
        // NOTE:
        // Needs DepthTextureMode.Depth
        // Check Object.Renderer.AditionalSettings.MotionVectors.

        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth
                                                | DepthTextureMode.MotionVectors;
        base.Start();
    }
}