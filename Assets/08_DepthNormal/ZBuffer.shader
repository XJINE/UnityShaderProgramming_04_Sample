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
                float depth = UNITY_SAMPLE_DEPTH(tex2D(_CameraDepthTexture, input.uv));
                      depth = Linear01Depth(depth);  // 01 space
                   // depth = LinearEyeDepth(depth); // world space

                // HLSLSupport.cginc
                // Deprecated; use SAMPLE_DEPTH_TEXTURE & SAMPLE_DEPTH_TEXTURE_PROJ instead
                // #define UNITY_SAMPLE_DEPTH(value) (value).r

                // Z buffer to linear 0..1 depth
                //inline float Linear01Depth(float z)
                //{
                //    return 1.0 / (_ZBufferParams.x * z + _ZBufferParams.y);
                //}
                //// Z buffer to linear depth
                //inline float LinearEyeDepth(float z)
                //{
                //    return 1.0 / (_ZBufferParams.z * z + _ZBufferParams.w);
                //}

                // _ZBufferParams.x (1-far/near), y (far/near), z (x/far), w (y/far)

                if (depth == 1) { return float4(0, 0, 0, 1); }

                return float4(depth.rrr, 1);
            }

            ENDCG
        }
    }
}