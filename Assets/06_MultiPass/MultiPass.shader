Shader "Hidden/MultiPass"
{
    Properties
    {
        [HideInInspector] _MainTex    ("Texture",              2D) = "white" {}
        [IntRange]        _FilterSize ("FilterSize", Range(1, 30)) = 1
                          _Threshold  ("Threshold",  Range(1,  0)) = 0.6
                          _Intensity  ("Intensity",  Range(0, 10)) = 3
    }

    SubShader
    {
        Cull   Off
        ZWrite Off
        ZTest  Always

        CGINCLUDE

        #include "UnityCG.cginc"

        sampler2D _MainTex;
        float4    _MainTex_TexelSize;
        int       _FilterSize;

        ENDCG

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert_img
            #pragma fragment frag

            fixed4 frag(v2f_img input) : SV_Target
            {
                return tex2D(_MainTex, input.uv);
            }

            ENDCG
        }

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert_img
            #pragma fragment frag

            float _Threshold;
            float _Intensity;

            fixed4 frag(v2f_img input) : SV_Target
            {
                float4 color = tex2D(_MainTex, input.uv);
                return max(color - _Threshold, 0) * _Intensity;
            }

            ENDCG
        }

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert_img
            #pragma fragment frag

            fixed4 frag(v2f_img input) : SV_Target
            {
                float4 color = float4(0, 0, 0, 1);

                for (int x = -_FilterSize; x <= _FilterSize; x++)
                {
                    for (int y = -_FilterSize; y <= _FilterSize; y++)
                    {
                        float2 temp = float2(input.uv.x + _MainTex_TexelSize.x * x,
                                             input.uv.y + _MainTex_TexelSize.y * y);
                        color.rgb += tex2D(_MainTex, temp).rgb;
                    }
                }

                color.rgb /= pow(_FilterSize * 2 + 1, 2);

                return color;
            }

            ENDCG
        }

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert_img
            #pragma fragment frag

            sampler2D _BrightnessTex;

            fixed4 frag(v2f_img input) : SV_Target
            {
                float4 color      = tex2D(_MainTex, input.uv);
                float4 brightness = tex2D(_BrightnessTex, input.uv);

                return saturate(color + brightness);
            }

            ENDCG
        }
    }
}