using UnityEngine;

[ExecuteAlways]
[RequireComponent(typeof(Camera))]
public class ShaderFind : MonoBehaviour
{
    private Material material;

    public Shader shader;

    void Start()
    {
        material = new Material(Shader.Find("Hidden/ShaderFind"));
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, material);
    }

    private void OnDisable()
    {
        #if UNITY_EDITOR
        DestroyImmediate(material);
        #else
        Destroy(material);
        #endif
    }

    void OnGUI()
    {
        GUILayout.Label(material ? "SHADER IS FOUND" : "SHADER IS NOT FOUND");
    }
}