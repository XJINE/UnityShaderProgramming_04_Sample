﻿Shader "Hidden/DetphEffects"
{
    Properties
    {
        [HideInInspector]
        _MainTex("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Cull   Off
        ZWrite Off
        ZTest  Always

        Pass
        {
            CGPROGRAM

            #include "UnityCG.cginc"
            #pragma vertex vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            sampler2D _CameraDepthNormalsTexture;

            float4 frag(v2f_img input) : SV_Target
            {
                float  depth;
                float3 normal;

                // https://docs.unity3d.com/jp/540/Manual/SL-CameraDepthTexture.html
                // RG : Depth 16 bit (0 ~ 1)
                // BA : Normal 16 bit
                // To Fog or Lighting

                DecodeDepthNormal(tex2D(_CameraDepthNormalsTexture, input.uv), depth, normal);

                return float4(normal, 1);
                return float4(depth.rrr, 1);
            }

            ENDCG
        }
    }
}