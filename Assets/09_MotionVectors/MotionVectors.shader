Shader "Hidden/MotionVectors"
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
            sampler2D _CameraMotionVectorsTexture;

            float4 frag(v2f_img input) : SV_Target
            {
                float2 motion = tex2D(_CameraMotionVectorsTexture, input.uv).xy;

                // return (motion.x || motion.y) ? 1 : 0;

                motion.xy = abs(motion.xy);
                motion.xy *= 100;

                return float4(motion.xy, 0, 1);
            }

            ENDCG
        }
    }
}