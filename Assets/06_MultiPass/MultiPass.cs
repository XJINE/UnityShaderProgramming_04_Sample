using UnityEngine;

public class MultiPass : ImageEffectBase
{
    protected override void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        RenderTexture brightnessTexture = RenderTexture.GetTemporary(source.descriptor);

        Graphics.Blit(source, brightnessTexture, material, 1);

        // Graphics.Blit(brightnessTexture, destination, material, 0);

        Graphics.Blit(brightnessTexture, brightnessTexture, material, 2);

        // Graphics.Blit(brightnessTexture, destination, material, 0);

        material.SetTexture("_BrightnessTex", brightnessTexture);

        Graphics.Blit(source, destination, material, 3);

        RenderTexture.ReleaseTemporary(brightnessTexture);
    }
}