Shader "Hidden/MotionBlur"
{
    Properties
    {
        [HideInInspector]
        _MainTex   ("Texture",            2D) = "white" {}
        _BlurPower ("BlurPower", Range(0, 3)) = 1.5
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

            float4 _MainTex_TexelSize;
            float  _BlurPower;

            float4 frag(v2f_img input) : SV_Target
            {
                float4 color  = tex2D(_MainTex, input.uv);
                float2 motion = tex2D(_CameraMotionVectorsTexture, input.uv).xy;
                float2 uv     = input.uv;

                for (int i = 0; i < 5; i++)
                {
                    uv     = input.uv - motion * i * _BlurPower;
                    color += tex2D(_MainTex, uv);
                }

                color /= 6;

                return color;
            }

            ENDCG
        }
    }
}