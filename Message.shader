Shader "Custom/HelloMessage"
{
    Properties
    {
        _Message ("Message", String) = "Привет! Я просто хочу узнать как ты? Пожалуйста, хватит добавлять меня в черный список. Мне очень жаль, как всё развернулось"
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = v.vertex;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1,1,1,1);
            }

            ENDCG
        }
    }
}
