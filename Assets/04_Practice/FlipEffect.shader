Shader "Hidden/FlipEffect"
{
    Properties
    {

        [HideInInspector] _MainTex ("Texture", 2D) = "white" {}
        [Toggle]          _FlipX   ("FlipX",  Int) = 0
        [Toggle]          _FlipY   ("FlipY",  Int) = 0
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
            int       _FlipX;
            int       _FlipY;

            float4 frag(v2f_img input) : SV_Target
            {
                input.uv.x = _FlipX ? 1 - input.uv.x : input.uv.x;
                input.uv.y = _FlipY ? 1 - input.uv.y : input.uv.y;

                return tex2D(_MainTex, input.uv);
            }

            ENDCG
        }
    }
}