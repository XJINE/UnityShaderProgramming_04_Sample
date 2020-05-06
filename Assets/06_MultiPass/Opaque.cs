using UnityEngine;

public class Opaque : ImageEffectBase
{
    [ImageEffectOpaque]
    protected override void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        RenderTexture brightnessTex = RenderTexture.GetTemporary(source.descriptor);

        Graphics.Blit(source, brightnessTex, material, 1);

        Graphics.Blit(brightnessTex, brightnessTex, material, 2);

        material.SetTexture("_BrightnessTex", brightnessTex);

        Graphics.Blit(source, destination, material, 3);

        RenderTexture.ReleaseTemporary(brightnessTex);
    }
}