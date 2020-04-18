Shader "Hidden/FadeOut"
{
    Properties
    {
        [HideInInspector]
        _MainTex ("Texture",          2D) = "white" {}
        _FadeOut ("FadeOut", Range(1, 0)) = 1
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
            float     _FadeOut;

            float4 frag(v2f_img input) : SV_Target
            {
                return tex2D(_MainTex, input.uv) * _FadeOut;
            }

            ENDCG
        }
    }
}