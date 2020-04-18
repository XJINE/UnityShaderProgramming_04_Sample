using UnityEngine;

public class DepthNormal : ImageEffectBase
{
    protected override void Start()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.DepthNormals;
        base.Start();
    }
}