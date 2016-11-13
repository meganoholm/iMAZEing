// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 5.7KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Skybox/Horizontal Skybox" {
Properties {
 _Color1 ("Top Color", Color) = (1.000000,1.000000,1.000000,0.000000)
 _Color2 ("Horizon Color", Color) = (1.000000,1.000000,1.000000,0.000000)
 _Color3 ("Bottom Color", Color) = (1.000000,1.000000,1.000000,0.000000)
 _Exponent1 ("Exponent Factor for Top Half", Float) = 1.000000
 _Exponent2 ("Exponent Factor for Bottom Half", Float) = 1.000000
 _Intensity ("Intensity Amplifier", Float) = 1.000000
}
SubShader { 
 Tags { "QUEUE"="Background" "RenderType"="Background" }


 // Stats for Vertex shader:
 //       metal : 1 math
 //      opengl : 17 math
 // Stats for Fragment shader:
 //       metal : 17 math
 Pass {
  Tags { "QUEUE"="Background" "RenderType"="Background" }
  ZWrite Off
  Cull Off
  GpuProgramID 13403
Program "vp" {
SubProgram "opengl " {
// Stats: 17 math
"#version 120

#ifdef VERTEX

varying vec3 xlv_TEXCOORD0;
void main ()
{
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xyz;
}


#endif
#ifdef FRAGMENT
uniform vec4 _Color1;
uniform vec4 _Color2;
uniform vec4 _Color3;
uniform float _Intensity;
uniform float _Exponent1;
uniform float _Exponent2;
varying vec3 xlv_TEXCOORD0;
void main ()
{
  vec3 tmpvar_1;
  tmpvar_1 = normalize(xlv_TEXCOORD0);
  float tmpvar_2;
  tmpvar_2 = (1.0 - pow (min (1.0, 
    (1.0 - tmpvar_1.y)
  ), _Exponent1));
  float tmpvar_3;
  tmpvar_3 = (1.0 - pow (min (1.0, 
    (1.0 + tmpvar_1.y)
  ), _Exponent2));
  gl_FragData[0] = (((
    (_Color1 * tmpvar_2)
   + 
    (_Color2 * ((1.0 - tmpvar_2) - tmpvar_3))
  ) + (_Color3 * tmpvar_3)) * _Intensity);
}


#endif
"
}
SubProgram "metal " {
// Stats: 1 math
Bind "vertex" ATTR0
Bind "texcoord" ATTR1
ConstBuffer "$Globals" 64
Matrix 0 [glstate_matrix_mvp]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesVertex [[attribute(0)]];
  float4 _glesMultiTexCoord0 [[attribute(1)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
in  vec4 in_POSITION0;
in  vec3 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	vec4 _Color3;
uniform 	float _Intensity;
uniform 	float _Exponent1;
uniform 	float _Exponent2;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.y = (-vs_TEXCOORD0.y) * u_xlat0.x + 1.0;
    u_xlat0.x = vs_TEXCOORD0.y * u_xlat0.x + 1.0;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Exponent2;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = log2(u_xlat0.y);
    u_xlat2 = u_xlat2 * _Exponent1;
    u_xlat0.y = exp2(u_xlat2);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat4 = (-u_xlat0.y) + 1.0;
    u_xlat4 = (-u_xlat0.x) + u_xlat4;
    u_xlat1 = vec4(u_xlat4) * _Color2;
    u_xlat1 = _Color1 * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = _Color3 * u_xlat0.xxxx + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(_Intensity);
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 17 math
ConstBuffer "$Globals" 30
VectorHalf 0 [_Color1] 4
VectorHalf 8 [_Color2] 4
VectorHalf 16 [_Color3] 4
ScalarHalf 24 [_Intensity]
ScalarHalf 26 [_Exponent1]
ScalarHalf 28 [_Exponent2]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float3 xlv_TEXCOORD0;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  half4 _Color1;
  half4 _Color2;
  half4 _Color3;
  half _Intensity;
  half _Exponent1;
  half _Exponent2;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  half4 tmpvar_1 = 0;
  float3 tmpvar_2 = 0;
  tmpvar_2 = normalize(_mtl_i.xlv_TEXCOORD0);
  float tmpvar_3 = 0;
  tmpvar_3 = (1.0 - pow (min (1.0, 
    (1.0 - tmpvar_2.y)
  ), (float)_mtl_u._Exponent1));
  float tmpvar_4 = 0;
  tmpvar_4 = (1.0 - pow (min (1.0, 
    (1.0 + tmpvar_2.y)
  ), (float)_mtl_u._Exponent2));
  float tmpvar_5 = 0;
  tmpvar_5 = ((1.0 - tmpvar_3) - tmpvar_4);
  tmpvar_1 = half4((((
    ((float4)(_mtl_u._Color1) * tmpvar_3)
   + 
    ((float4)(_mtl_u._Color2) * tmpvar_5)
  ) + ((float4)(_mtl_u._Color3) * tmpvar_4)) * (float)(_mtl_u._Intensity)));
  _mtl_o._glesFragData_0 = tmpvar_1;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
"// shader disassembly not supported on glcore"
}
}
 }
}
}