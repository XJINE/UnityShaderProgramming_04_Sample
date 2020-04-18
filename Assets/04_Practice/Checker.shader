Shader "Hidden/Checker"
{
    Properties
    {
        [HideInInspector]
        _MainTex ("Texture",           2D) = "white" {}
        _Scale   ("Scale",   Range(0, 10)) = 10
    }
    SubShader
    {
        Cull   Off
        ZWrite Off
        ZTest  Always

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            sampler2D _MainTex;
            float     _Scale;

            float4 frag(v2f_img input) : SV_Target
            {
                input.uv = floor(input.uv * _Scale);

             // return input.uv.x % 2 == 0 ? 0 : 1;

                return (input.uv.y % 2 == 0 ? 1 : 0)
                      - input.uv.x % 2 == 0 ? 0 : 1;
            }

            ENDCG
        }
    }
}