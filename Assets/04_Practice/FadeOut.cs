using UnityEngine;

public class FadeOut : ImageEffectBase
{
    [Range(1, 0)]
    public float fadeOut = 1;

    protected override void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        material.SetFloat("_FadeOut", fadeOut);
        base.OnRenderImage(source, destination);
    }
}