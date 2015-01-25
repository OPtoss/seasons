// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3782,x:32826,y:32764,varname:node_3782,prsc:2|emission-4065-OUT,alpha-8392-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:275,x:31753,y:32853,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_275,tex:8993b617f08498f43adcbd90697f1c5d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8440,x:32102,y:32861,varname:node_8440,prsc:2,tex:8993b617f08498f43adcbd90697f1c5d,ntxv:0,isnm:False|UVIN-8590-OUT,TEX-275-TEX;n:type:ShaderForge.SFN_Vector4Property,id:4964,x:31369,y:32278,ptovrint:False,ptlb:UVSpeedScale,ptin:_UVSpeedScale,varname:node_4964,prsc:2,glob:False,v1:1,v2:1,v3:2,v4:2;n:type:ShaderForge.SFN_TexCoord,id:9049,x:31338,y:32470,varname:node_9049,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:466,x:32023,y:32364,varname:node_466,prsc:2|A-4964-X,B-4964-Y;n:type:ShaderForge.SFN_Multiply,id:2731,x:32368,y:32390,varname:node_2731,prsc:2|A-466-OUT,B-6293-T;n:type:ShaderForge.SFN_Time,id:6293,x:32159,y:32400,varname:node_6293,prsc:2;n:type:ShaderForge.SFN_Append,id:3859,x:31727,y:32384,varname:node_3859,prsc:2|A-4964-Z,B-4964-W;n:type:ShaderForge.SFN_Multiply,id:2787,x:31992,y:32573,varname:node_2787,prsc:2|A-3859-OUT,B-9049-UVOUT;n:type:ShaderForge.SFN_Add,id:8590,x:32270,y:32561,varname:node_8590,prsc:2|A-2731-OUT,B-9049-UVOUT,C-2787-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5620,x:31753,y:33055,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:_Diffuse_copy,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5886,x:32115,y:33011,varname:node_5886,prsc:2,ntxv:0,isnm:False|UVIN-5087-OUT,TEX-5620-TEX;n:type:ShaderForge.SFN_Vector4Property,id:6184,x:31085,y:32672,ptovrint:False,ptlb:AlphaMoveScale,ptin:_AlphaMoveScale,varname:_UVSpeedScale_copy,prsc:2,glob:False,v1:0,v2:1,v3:2,v4:0;n:type:ShaderForge.SFN_Append,id:1610,x:31412,y:32710,varname:node_1610,prsc:2|A-6184-Z,B-6184-W;n:type:ShaderForge.SFN_Multiply,id:4311,x:31631,y:32720,varname:node_4311,prsc:2|A-9049-UVOUT,B-1610-OUT;n:type:ShaderForge.SFN_Append,id:608,x:31276,y:32796,varname:node_608,prsc:2|A-6184-X,B-6184-Y;n:type:ShaderForge.SFN_Time,id:8956,x:31372,y:32931,varname:node_8956,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6958,x:31567,y:32855,varname:node_6958,prsc:2|A-608-OUT,B-8956-T;n:type:ShaderForge.SFN_Add,id:5087,x:31831,y:32720,varname:node_5087,prsc:2|A-9049-UVOUT,B-4311-OUT,C-6958-OUT;n:type:ShaderForge.SFN_Fresnel,id:3152,x:32600,y:32599,varname:node_3152,prsc:2|NRM-2765-OUT,EXP-6425-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6425,x:32387,y:32754,ptovrint:False,ptlb:FresnelPower,ptin:_FresnelPower,varname:node_6425,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_Add,id:6273,x:32482,y:32874,varname:node_6273,prsc:2|A-8412-OUT,B-3867-OUT;n:type:ShaderForge.SFN_Multiply,id:3275,x:32847,y:32576,varname:node_3275,prsc:2|A-1019-RGB,B-3152-OUT;n:type:ShaderForge.SFN_Color,id:1019,x:32619,y:32450,ptovrint:False,ptlb:FresnelColor,ptin:_FresnelColor,varname:node_1019,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:2765,x:32444,y:32571,prsc:2,pt:True;n:type:ShaderForge.SFN_Clamp01,id:4065,x:32638,y:32890,varname:node_4065,prsc:2|IN-6273-OUT;n:type:ShaderForge.SFN_Color,id:6265,x:32102,y:32676,ptovrint:False,ptlb:ColorMultiply,ptin:_ColorMultiply,varname:node_6265,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3867,x:32321,y:32897,varname:node_3867,prsc:2|A-6265-RGB,B-8440-RGB;n:type:ShaderForge.SFN_Multiply,id:8412,x:33026,y:32508,varname:node_8412,prsc:2|A-2304-RGB,B-3275-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4935,x:32678,y:32241,ptovrint:False,ptlb:FresnelNoise,ptin:_FresnelNoise,varname:node_4935,tex:e958c6041cfe445e987c73751e8d4082,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2304,x:32910,y:32254,varname:node_2304,prsc:2,tex:e958c6041cfe445e987c73751e8d4082,ntxv:0,isnm:False|UVIN-8590-OUT,TEX-4935-TEX;n:type:ShaderForge.SFN_Add,id:4659,x:32323,y:33027,varname:node_4659,prsc:2|A-8440-A,B-5886-A;n:type:ShaderForge.SFN_Clamp01,id:1491,x:32501,y:33042,varname:node_1491,prsc:2|IN-4659-OUT;n:type:ShaderForge.SFN_TexCoord,id:8650,x:31789,y:33335,varname:node_8650,prsc:2,uv:0;n:type:ShaderForge.SFN_Length,id:6918,x:32172,y:33331,varname:node_6918,prsc:2|IN-2371-OUT;n:type:ShaderForge.SFN_RemapRange,id:2371,x:32009,y:33331,varname:node_2371,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8650-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:7880,x:32336,y:33331,varname:node_7880,prsc:2|IN-6918-OUT;n:type:ShaderForge.SFN_ValueProperty,id:226,x:32212,y:33265,ptovrint:False,ptlb:EdgeSoftening,ptin:_EdgeSoftening,varname:node_226,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8392,x:32644,y:33192,varname:node_8392,prsc:2|A-1491-OUT,B-3420-OUT;n:type:ShaderForge.SFN_Lerp,id:3420,x:32478,y:33202,varname:node_3420,prsc:2|A-4456-OUT,B-7212-OUT,T-226-OUT;n:type:ShaderForge.SFN_Vector1,id:4456,x:32276,y:33182,varname:node_4456,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:106,x:32316,y:33458,varname:node_106,prsc:2|A-7880-OUT,B-6475-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6475,x:32251,y:33607,ptovrint:False,ptlb:EdgeSofteningStrength,ptin:_EdgeSofteningStrength,varname:node_6475,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_Clamp01,id:7212,x:32547,y:33398,varname:node_7212,prsc:2|IN-106-OUT;proporder:275-4964-5620-6184-6265-6425-1019-4935-226-6475;pass:END;sub:END;*/

Shader "Shader Forge/PanningTexture" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _UVSpeedScale ("UVSpeedScale", Vector) = (1,1,2,2)
        _Transparency ("Transparency", 2D) = "white" {}
        _AlphaMoveScale ("AlphaMoveScale", Vector) = (0,1,2,0)
        _ColorMultiply ("ColorMultiply", Color) = (1,1,1,1)
        _FresnelPower ("FresnelPower", Float ) = 3
        _FresnelColor ("FresnelColor", Color) = (1,1,1,1)
        _FresnelNoise ("FresnelNoise", 2D) = "white" {}
        _EdgeSoftening ("EdgeSoftening", Float ) = 1
        _EdgeSofteningStrength ("EdgeSofteningStrength", Float ) = 3
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _UVSpeedScale;
            uniform sampler2D _Transparency; uniform float4 _Transparency_ST;
            uniform float4 _AlphaMoveScale;
            uniform float _FresnelPower;
            uniform float4 _FresnelColor;
            uniform float4 _ColorMultiply;
            uniform sampler2D _FresnelNoise; uniform float4 _FresnelNoise_ST;
            uniform float _EdgeSoftening;
            uniform float _EdgeSofteningStrength;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(_Object2World, float4(v.normal,0)).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_6293 = _Time + _TimeEditor;
                float2 node_8590 = ((float2(_UVSpeedScale.r,_UVSpeedScale.g)*node_6293.g)+i.uv0+(float2(_UVSpeedScale.b,_UVSpeedScale.a)*i.uv0));
                float4 node_2304 = tex2D(_FresnelNoise,TRANSFORM_TEX(node_8590, _FresnelNoise));
                float4 node_8440 = tex2D(_Diffuse,TRANSFORM_TEX(node_8590, _Diffuse));
                float3 emissive = saturate(((node_2304.rgb*(_FresnelColor.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower)))+(_ColorMultiply.rgb*node_8440.rgb)));
                float3 finalColor = emissive;
                float4 node_8956 = _Time + _TimeEditor;
                float2 node_5087 = (i.uv0+(i.uv0*float2(_AlphaMoveScale.b,_AlphaMoveScale.a))+(float2(_AlphaMoveScale.r,_AlphaMoveScale.g)*node_8956.g));
                float4 node_5886 = tex2D(_Transparency,TRANSFORM_TEX(node_5087, _Transparency));
                return fixed4(finalColor,(saturate((node_8440.a+node_5886.a))*lerp(1.0,saturate(((1.0 - length((i.uv0*2.0+-1.0)))*_EdgeSofteningStrength)),_EdgeSoftening)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
