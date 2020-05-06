using UnityEngine;

[ExecuteAlways, ExecuteInEditMode]
// [ImageEffectAllowedInSceneView]
[RequireComponent(typeof(Camera))]
public class ImageEffectBase : MonoBehaviour
{
    public Material material;

    protected virtual void Start()
    {
        enabled = material && material.shader.isSupported;
    }

    protected virtual void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, material);
    }
}