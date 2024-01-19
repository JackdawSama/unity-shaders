Shader"Learning/FlatColour"
{
    Properties
    {
        _Colour("Colour", Color) = (1,1,1,1)
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            
            //pragmas

            //user defined variables
            uniform float4 _Colour;

            //base input structs
            struct vInput
            {
                float4 vertex : POSITION;
            };

            struct vOutput
            {
                float4 pos : SV_POSITION;
            };

            //vertex function

            //fragment function
            ENDCG
        }
    }
}