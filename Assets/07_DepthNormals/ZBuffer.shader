Shader "Hidden/ZBuffer"
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

            #pragma vertex   vert_img
            #pragma fragment frag

            sampler2D _MainTex;
            sampler2D _CameraDepthTexture;

            float4 frag(v2f_img input) : SV_Target
            {
                float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, input.uv);
                      depth = Linear01Depth(depth);  // 0 ~ 1 Space
                   // depth = LinearEyeDepth(depth); // World Space

                return float4(depth.rrr, 1);
            }

            ENDCG
        }
    }
}