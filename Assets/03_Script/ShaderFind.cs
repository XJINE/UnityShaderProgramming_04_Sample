﻿using UnityEngine;

[ExecuteAlways]
[RequireComponent(typeof(Camera))]
public class ShaderFind : MonoBehaviour
{
    private Material material;

    // public Shader shader;

    void Start()
    {
        material = new Material(Shader.Find("Hidden/ShaderFind"));

        // NOTE:
        // Include into Resoucres folder
        // ProjectSettings > Graphics > Always Included Shaders
        // Shader field.
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, material);
    }

    private void OnDisable()
    {
        Destroy(material);
    }

    void OnGUI()
    {
        GUILayout.Label(material ? "SHADER IS FOUND" : "SHADER IS NOT FOUND");
    }
}