// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:5546,x:32719,y:32712,varname:node_5546,prsc:2|emission-2935-RGB,alpha-6330-OUT,voffset-633-OUT;n:type:ShaderForge.SFN_Color,id:2935,x:32199,y:32806,ptovrint:False,ptlb:WaterColor,ptin:_WaterColor,varname:node_2935,prsc:2,glob:False,c1:0.6838235,c2:0.7383367,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:6330,x:32458,y:33002,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:node_6330,prsc:2,glob:False,v1:0.3;n:type:ShaderForge.SFN_Time,id:6644,x:31411,y:32979,varname:node_6644,prsc:2;n:type:ShaderForge.SFN_Sin,id:1050,x:32214,y:33075,varname:node_1050,prsc:2|IN-5695-OUT;n:type:ShaderForge.SFN_ValueProperty,id:630,x:31411,y:33128,ptovrint:False,ptlb:Frequency,ptin:_Frequency,varname:node_630,prsc:2,glob:False,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:633,x:32458,y:33075,varname:node_633,prsc:2|A-7586-OUT,B-1050-OUT,C-2752-R;n:type:ShaderForge.SFN_ValueProperty,id:7586,x:32214,y:33020,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_7586,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_FragmentPosition,id:1022,x:31411,y:33190,varname:node_1022,prsc:2;n:type:ShaderForge.SFN_Add,id:819,x:31845,y:33042,varname:node_819,prsc:2|A-2302-OUT,B-1022-X;n:type:ShaderForge.SFN_Multiply,id:5695,x:32021,y:33042,varname:node_5695,prsc:2|A-819-OUT,B-630-OUT;n:type:ShaderForge.SFN_Multiply,id:2302,x:31629,y:32979,varname:node_2302,prsc:2|A-3132-OUT,B-6644-T;n:type:ShaderForge.SFN_ValueProperty,id:3132,x:31411,y:32923,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_3132,prsc:2,glob:False,v1:7;n:type:ShaderForge.SFN_VertexColor,id:2752,x:32214,y:33208,varname:node_2752,prsc:2;proporder:2935-6330-630-7586-3132;pass:END;sub:END;*/

Shader "Custom/WaterVolume" {
    Properties {
        _WaterColor ("WaterColor", Color) = (0.6838235,0.7383367,1,1)
        _Alpha ("Alpha", Float ) = 0.3
        _Frequency ("Frequency", Float ) = 0.3
        _Amplitude ("Amplitude", Float ) = 1
        _Speed ("Speed", Float ) = 7
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
            uniform float4 _TimeEditor;
            uniform float4 _WaterColor;
            uniform float _Alpha;
            uniform float _Frequency;
            uniform float _Amplitude;
            uniform float _Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                float4 node_6644 = _Time + _TimeEditor;
                float node_633 = (_Amplitude*sin((((_Speed*node_6644.g)+mul(_Object2World, v.vertex).r)*_Frequency))*o.vertexColor.r);
                v.vertex.xyz += float3(node_633,node_633,node_633);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float3 emissive = _WaterColor.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,_Alpha);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Frequency;
            uniform float _Amplitude;
            uniform float _Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float4 posWorld : TEXCOORD5;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                float4 node_6644 = _Time + _TimeEditor;
                float node_633 = (_Amplitude*sin((((_Speed*node_6644.g)+mul(_Object2World, v.vertex).r)*_Frequency))*o.vertexColor.r);
                v.vertex.xyz += float3(node_633,node_633,node_633);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Frequency;
            uniform float _Amplitude;
            uniform float _Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                float4 node_6644 = _Time + _TimeEditor;
                float node_633 = (_Amplitude*sin((((_Speed*node_6644.g)+mul(_Object2World, v.vertex).r)*_Frequency))*o.vertexColor.r);
                v.vertex.xyz += float3(node_633,node_633,node_633);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
