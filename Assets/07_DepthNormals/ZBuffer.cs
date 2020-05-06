using UnityEngine;

public class ZBuffer : ImageEffectBase
{
    protected override void Start()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;
        base.Start();
    }
}