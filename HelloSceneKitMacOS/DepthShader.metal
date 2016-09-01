////
////  DepthShader.metal
////  HelloSceneKitMacOS
////
////  Created by David Young-chan Kay on 2016-09-01.
////  Copyright © 2016 David Young-chan Kay. All rights reserved.
////
//
//#include <metal_stdlib>
//using namespace metal;
//
//struct Uniforms
//{
//    float4x4 modelViewProjectionMatrix;
//};
//
//uniform sampler2D _CameraDepthTexture; //the depth texture
//struct v2f
//{
//    float4 pos : SV_POSITION;
//    float4 projPos : TEXCOORD1; //Screen position of pos
//};
//
//vertex v2f depthVertex(appdata_base v)
//{
//    v2f o;
//    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
//    o.projPos = ComputeScreenPos(o.pos);
//    return o;
//}
//
//fragment half4 depthFragment(v2f i)
//{
//    //Grab the depth value from the depth texture
//    //Linear01Depth restricts this value to [0, 1]
//    float depth = Linear01Depth (tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)).r);
//    half4 c;
//    c.r = depth;
//    c.g = depth;
//    c.b = depth;
//    c.a = 1;
//    return c;
//}
