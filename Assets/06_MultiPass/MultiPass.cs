using UnityEngine;

public class MultiPass : ImageEffectBase
{
    protected override void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        RenderTexture brightnessTex = RenderTexture.GetTemporary(source.descriptor);

        Graphics.Blit(source, brightnessTex, material, 1);

        // Graphics.Blit(brightnessTex, destination, material, 0);
        // RenderTexture.ReleaseTemporary(brightnessTex);
        // return;

        Graphics.Blit(brightnessTex, brightnessTex, material, 2);

        // Graphics.Blit(brightnessTex, destination, material, 0);
        // RenderTexture.ReleaseTemporary(brightnessTex);
        // return;

        material.SetTexture("_BrightnessTex", brightnessTex);

        Graphics.Blit(source, destination, material, 3);

        RenderTexture.ReleaseTemporary(brightnessTex);
    }
}