Shader "Learning/SimpleShader"
{
    Properties
    {

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            
            //Mesh Data : vertex position, vertex normal, UVs, tangents, vertex colours 
            struct VertexInput
            {
                float4 vertex : POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct VertexOutput
            {
                float4 clipSpacePos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float3 normal : NORMAL;
            };

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.uv0 = v.uv0;
                o.normal = v.normal;
                o.clipSpacePos = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (VertexOutput o) : SV_Target
            {
                float2 uv = o.uv0;

                float3 lightDir = normalize(float3(1,1,1));
                float3 lightColour = float3(0.5,0.3,0.76);

                float simpleLight = dot(lightDir, o.normal);

                float3 normal = o.normal * 0.5 + 0.5;



                return float4 (simpleLight * lightColour,0);
            }
            ENDCG
        }
    }
}
