//
//  Shaders.metal
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;
#include <SceneKit/scn_metal>

struct MyNodeBuffer {
    float4x4 modelTransform;
    float4x4 modelViewTransform;
    float4x4 normalTransform;
    float4x4 modelViewProjectionTransform;
};

typedef struct {
    float3 position [[ attribute(SCNVertexSemanticPosition) ]];
} MyVertexInput;

struct Vertex
{
    float4 position [[position]];
    float4 color;
};

struct Uniforms
{
    float4x4 modelViewProjectionMatrix;
};

vertex Vertex vertexProject(device Vertex *vertices [[buffer(0)]],
        constant Uniforms *uniforms [[buffer(1)]],
        uint vid [[vertex_id]])
{
    Vertex vertexOut;
    vertexOut.position = uniforms->modelViewProjectionMatrix *
        vertices[vid].position;
    vertexOut.color = vertices[vid].color;
    return vertexOut;
}

vertex Vertex vertexMain(device Vertex *vertices [[buffer(0)]], uint vid [[vertex_id]])
{
    return vertices[vid];
}

vertex float4 vertexBasic(                           // 1
  const device packed_float3* vertex_array [[ buffer(0) ]], // 2
  unsigned int vid [[ vertex_id ]]) {                 // 3
  return float4(vertex_array[vid], 1.0);              // 4
}

fragment half4 myFragment(Vertex in [[stage_in]])
{
    half4 color;
    color = half4(1.0, 0.0, 0.0, 1.0);

    return color;
}

fragment half4 flatColor(Vertex vertexIn [[stage_in]])
{
    return half4(vertexIn.color);
}
