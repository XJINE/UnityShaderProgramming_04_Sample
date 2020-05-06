using UnityEngine;

public class DepthNormals : ImageEffectBase
{
    protected override void Start()
    {
        GetComponent<Camera>().depthTextureMode = DepthTextureMode.DepthNormals;
        base.Start();
    }
}