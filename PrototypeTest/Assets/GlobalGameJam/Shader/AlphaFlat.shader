// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3990,x:33118,y:32719,varname:node_3990,prsc:2|emission-1920-RGB,alpha-9474-A;n:type:ShaderForge.SFN_Tex2d,id:9474,x:32569,y:32745,varname:node_9474,prsc:2,tex:66321cc856b03e245ac41ed8a53e0ecc,ntxv:0,isnm:False|UVIN-798-UVOUT,TEX-4196-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:4196,x:32322,y:32756,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4196,tex:66321cc856b03e245ac41ed8a53e0ecc,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:798,x:32325,y:32567,varname:node_798,prsc:2,uv:0;n:type:ShaderForge.SFN_Color,id:1920,x:32536,y:33020,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1920,prsc:2,glob:False,c1:1,c2:0.6827586,c3:0,c4:1;proporder:1920-4196;pass:END;sub:END;*/

Shader "Shader Forge/AlphaFlat" {
    Properties {
        _Color ("Color", Color) = (1,0.6827586,0,1)
        _MainTex ("MainTex", 2D) = "white" {}
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
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
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                float4 node_9474 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                return fixed4(finalColor,node_9474.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
