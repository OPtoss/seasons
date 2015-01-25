// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:2,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4049,x:32832,y:32594,varname:node_4049,prsc:2|emission-8052-OUT,alpha-5446-OUT;n:type:ShaderForge.SFN_VertexColor,id:3283,x:32255,y:32912,varname:node_3283,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:7579,x:32255,y:32724,varname:node_7579,prsc:2,ntxv:0,isnm:False|UVIN-4397-OUT,TEX-6272-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6272,x:31940,y:32767,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_6272,ntxv:2,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:6089,x:31088,y:32274,varname:node_6089,prsc:2,uv:0;n:type:ShaderForge.SFN_Vector4Property,id:9301,x:31088,y:32710,ptovrint:False,ptlb:MainTexOffsetScale,ptin:_MainTexOffsetScale,varname:node_9301,prsc:2,glob:False,v1:0,v2:0.5,v3:1,v4:0.5;n:type:ShaderForge.SFN_Add,id:3921,x:31703,y:32562,cmnt:Offset,varname:node_3921,prsc:2|A-6089-UVOUT,B-9993-OUT,C-5775-OUT;n:type:ShaderForge.SFN_Append,id:9993,x:31492,y:32631,varname:node_9993,prsc:2|A-9301-X,B-9301-Y;n:type:ShaderForge.SFN_Append,id:619,x:31492,y:32779,varname:node_619,prsc:2|A-9301-Z,B-9301-W;n:type:ShaderForge.SFN_Multiply,id:4397,x:31940,y:32607,cmnt:Scale,varname:node_4397,prsc:2|A-3921-OUT,B-619-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3259,x:31088,y:32440,ptovrint:False,ptlb:SpeedX,ptin:_SpeedX,varname:node_3259,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Time,id:7069,x:31088,y:32571,varname:node_7069,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:5030,x:31088,y:32517,ptovrint:False,ptlb:SpeedY,ptin:_SpeedY,varname:_SpeedX_copy,prsc:2,glob:False,v1:-3;n:type:ShaderForge.SFN_Append,id:67,x:31268,y:32473,varname:node_67,prsc:2|A-3259-OUT,B-5030-OUT;n:type:ShaderForge.SFN_Multiply,id:5775,x:31459,y:32473,varname:node_5775,prsc:2|A-67-OUT,B-7069-T;n:type:ShaderForge.SFN_Multiply,id:5446,x:32458,y:32865,varname:node_5446,prsc:2|A-7579-A,B-3283-R;n:type:ShaderForge.SFN_Color,id:7539,x:32255,y:32576,ptovrint:False,ptlb:ColorMultiply,ptin:_ColorMultiply,varname:node_7539,prsc:2,glob:False,c1:0.6017517,c2:0.7368228,c3:0.7720588,c4:1;n:type:ShaderForge.SFN_Multiply,id:2290,x:32476,y:32714,varname:node_2290,prsc:2|A-7539-RGB,B-7579-RGB;n:type:ShaderForge.SFN_Color,id:9625,x:32255,y:32406,ptovrint:False,ptlb:ColorAdd,ptin:_ColorAdd,varname:_ColorMultiply_copy,prsc:2,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:8052,x:32660,y:32696,varname:node_8052,prsc:2|A-9625-RGB,B-2290-OUT;proporder:6272-9301-3259-5030-7539-9625;pass:END;sub:END;*/

Shader "Custom/EdgeFadeWind" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        _MainTexOffsetScale ("MainTexOffsetScale", Vector) = (0,0.5,1,0.5)
        _SpeedX ("SpeedX", Float ) = 0
        _SpeedY ("SpeedY", Float ) = -3
        _ColorMultiply ("ColorMultiply", Color) = (0.6017517,0.7368228,0.7720588,1)
        _ColorAdd ("ColorAdd", Color) = (0,0,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _MainTexOffsetScale;
            uniform float _SpeedX;
            uniform float _SpeedY;
            uniform float4 _ColorMultiply;
            uniform float4 _ColorAdd;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 node_7069 = _Time + _TimeEditor;
                float2 node_4397 = ((i.uv0+float2(_MainTexOffsetScale.r,_MainTexOffsetScale.g)+(float2(_SpeedX,_SpeedY)*node_7069.g))*float2(_MainTexOffsetScale.b,_MainTexOffsetScale.a)); // Scale
                float4 node_7579 = tex2D(_MainTex,TRANSFORM_TEX(node_4397, _MainTex));
                float3 emissive = (_ColorAdd.rgb+(_ColorMultiply.rgb*node_7579.rgb));
                float3 finalColor = emissive;
                return fixed4(finalColor,(node_7579.a*i.vertexColor.r));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
