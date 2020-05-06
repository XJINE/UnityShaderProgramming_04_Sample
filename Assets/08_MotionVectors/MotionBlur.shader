Shader "Hidden/MotionBlur"
{
    Properties
    {
        [HideInInspector]
        _MainTex   ("Texture",            2D) = "white" {}
        _BlurPower ("BlurPower", Range(0, 5)) = 1.5
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
            sampler2D _CameraMotionVectorsTexture;

            float _BlurPower;

            float4 frag(v2f_img input) : SV_Target
            {
                // float4 color  = tex2D(_MainTex,                    input.uv);
                // float2 motion = tex2D(_CameraMotionVectorsTexture, input.uv).xy;
                // return (!length(motion) && color.a) ? 1 : 0;

                float4 color  = 0;
                float2 motion = tex2D(_CameraMotionVectorsTexture, input.uv).xy;

                for (int i = 0; i < 10; i++)
                {
                    color += tex2D(_MainTex, input.uv - motion * i / 10 *_BlurPower);
                }

                return color / 10;
            }

            ENDCG
        }
    }
}