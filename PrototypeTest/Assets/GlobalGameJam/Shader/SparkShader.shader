// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7251,x:32719,y:32712,varname:node_7251,prsc:2|emission-1775-OUT,alpha-3365-OUT;n:type:ShaderForge.SFN_TexCoord,id:3320,x:30838,y:32487,varname:node_3320,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:3871,x:31048,y:32487,varname:node_3871,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-3320-UVOUT;n:type:ShaderForge.SFN_Length,id:4380,x:31231,y:32487,varname:node_4380,prsc:2|IN-3871-OUT;n:type:ShaderForge.SFN_OneMinus,id:5985,x:31401,y:32487,varname:node_5985,prsc:2|IN-4380-OUT;n:type:ShaderForge.SFN_Color,id:478,x:31275,y:32880,ptovrint:False,ptlb:InnerColor,ptin:_InnerColor,varname:node_478,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:2793,x:31277,y:33045,ptovrint:False,ptlb:OuterColor,ptin:_OuterColor,varname:_InnerColor_copy,prsc:2,glob:False,c1:1,c2:0.9882353,c3:0.5735294,c4:1;n:type:ShaderForge.SFN_Color,id:927,x:31277,y:33214,ptovrint:False,ptlb:EdgeColor2,ptin:_EdgeColor2,varname:node_927,prsc:2,glob:False,c1:1,c2:0.6413792,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:1823,x:31277,y:33381,ptovrint:False,ptlb:EdgeColor1,ptin:_EdgeColor1,varname:_EdgeColor_copy,prsc:2,glob:False,c1:1,c2:0.3529412,c3:0.3529412,c4:1;n:type:ShaderForge.SFN_Multiply,id:4876,x:31597,y:32502,varname:node_4876,prsc:2|A-4099-OUT,B-5985-OUT;n:type:ShaderForge.SFN_Clamp01,id:5840,x:31604,y:32770,varname:node_5840,prsc:2|IN-4876-OUT;n:type:ShaderForge.SFN_Lerp,id:3080,x:31822,y:32727,varname:node_3080,prsc:2|A-2793-RGB,B-478-RGB,T-5840-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4099,x:31354,y:32665,ptovrint:False,ptlb:InnerHeat,ptin:_InnerHeat,varname:node_4099,prsc:2,glob:False,v1:1.7;n:type:ShaderForge.SFN_Lerp,id:887,x:31907,y:32867,varname:node_887,prsc:2|A-927-RGB,B-3080-OUT,T-5730-OUT;n:type:ShaderForge.SFN_Lerp,id:6423,x:31994,y:33017,varname:node_6423,prsc:2|A-1823-RGB,B-887-OUT,T-1263-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2410,x:31525,y:32941,ptovrint:False,ptlb:Heat1,ptin:_Heat1,varname:_InnerHeat_copy,prsc:2,glob:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:370,x:31572,y:33075,ptovrint:False,ptlb:Heat2,ptin:_Heat2,varname:_InnerHeat_copy_copy,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:5730,x:31720,y:32907,varname:node_5730,prsc:2|A-5985-OUT,B-2410-OUT;n:type:ShaderForge.SFN_Multiply,id:1263,x:31764,y:33124,varname:node_1263,prsc:2|A-5985-OUT,B-370-OUT;n:type:ShaderForge.SFN_Clamp01,id:1775,x:32150,y:33017,varname:node_1775,prsc:2|IN-6423-OUT;n:type:ShaderForge.SFN_Multiply,id:9769,x:32262,y:33128,varname:node_9769,prsc:2|A-1263-OUT,B-4815-A;n:type:ShaderForge.SFN_Clamp01,id:3365,x:32418,y:33128,varname:node_3365,prsc:2|IN-9769-OUT;n:type:ShaderForge.SFN_Color,id:4815,x:31933,y:33270,ptovrint:False,ptlb:TintColor,ptin:_TintColor,varname:node_4815,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:478-2793-927-1823-4099-2410-370-4815;pass:END;sub:END;*/

Shader "Custom/SparkShader" {
    Properties {
        _InnerColor ("InnerColor", Color) = (1,1,1,1)
        _OuterColor ("OuterColor", Color) = (1,0.9882353,0.5735294,1)
        _EdgeColor2 ("EdgeColor2", Color) = (1,0.6413792,0,1)
        _EdgeColor1 ("EdgeColor1", Color) = (1,0.3529412,0.3529412,1)
        _InnerHeat ("InnerHeat", Float ) = 1.7
        _Heat1 ("Heat1", Float ) = 2
        _Heat2 ("Heat2", Float ) = 4
        _TintColor ("TintColor", Color) = (0.5,0.5,0.5,1)
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _InnerColor;
            uniform float4 _OuterColor;
            uniform float4 _EdgeColor2;
            uniform float4 _EdgeColor1;
            uniform float _InnerHeat;
            uniform float _Heat1;
            uniform float _Heat2;
            uniform float4 _TintColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float node_5985 = (1.0 - length((i.uv0*2.0+-1.0)));
                float node_1263 = (node_5985*_Heat2);
                float3 emissive = saturate(lerp(_EdgeColor1.rgb,lerp(_EdgeColor2.rgb,lerp(_OuterColor.rgb,_InnerColor.rgb,saturate((_InnerHeat*node_5985))),(node_5985*_Heat1)),node_1263));
                float3 finalColor = emissive;
                return fixed4(finalColor,saturate((node_1263*_TintColor.a)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
