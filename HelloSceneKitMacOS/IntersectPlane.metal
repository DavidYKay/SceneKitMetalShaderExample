//
//  IntersectPlane.metal
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;
#include <SceneKit/scn_metal>
#include "ShaderCommon.h"

// TODO: export data from vertex shader to fragment shader.
//       see the fog example for more info.

enum class position_relative_to_plane { inside, behind, in_front_of };

typedef struct {
    float3 position [[ attribute(SCNVertexSemanticPosition) ]];
} MyVertexInput;

struct VertexInOut {
  float4 position [[position]];
    position_relative_to_plane relative_to_plane;
};

struct ColorInOut {
    float4 position [[position]];
    float3 normal_cameraspace;
    float3 eye_direction_cameraspace;
    float3 light_direction_cameraspace;
    float distance_to_object;
};

// // Fog vertex shader function
// vertex ColorInOut fog_vertex(device packed_float3* vertices [[ buffer(0) ]],
//                              device packed_float3* normals [[ buffer(1) ]],
//                              constant AAPL::uniforms_t& uniforms [[ buffer(2) ]],
//                              unsigned int vid [[ vertex_id ]])
// {
//     ColorInOut out;
//     
//     float4x4 model_matrix = uniforms.model_matrix;
//     float4x4 view_matrix = uniforms.view_matrix;
//     float4x4 projection_matrix = uniforms.projection_matrix;
//     float4x4 mvp_matrix = projection_matrix * view_matrix * model_matrix;
//     float4x4 model_view_matrix = view_matrix * model_matrix;
//     
//     // Calculate the position of the object from the perspective of the camera
//     float4 vertex_position_modelspace = float4(float3(vertices[vid]), 1.0);
//     out.position = mvp_matrix * vertex_position_modelspace;
//     
//     // Calculate the normal from the perspective of the camera
//     float3 normal = normals[vid];
//     out.normal_cameraspace = (normalize(model_view_matrix * float4(normal, 0.0))).xyz;
//     
//     // Calculate the view vector from the perspective of the camera
//     float3 vertex_position_cameraspace = ( view_matrix * model_matrix * vertex_position_modelspace ).xyz;
//     out.eye_direction_cameraspace = float3(0,0,0) - vertex_position_cameraspace;
//     
//     // Calculate the direction of the light from the position of the camera
//     float3 light_position_cameraspace = ( view_matrix * float4(light_position,1)).xyz;
//     out.light_direction_cameraspace = light_position_cameraspace + out.eye_direction_cameraspace;
//     
//     // Calculate the distance to the object which is used for how much fog obsures the object
//     float4 position_modelviewspace = model_view_matrix * float4(float3(vertices[vid]), 1.0);
//     out.distance_to_object = abs(position_modelviewspace.z/position_modelviewspace.w);;
//     
//     return out;
// }

vertex VertexInOut vertexPlane(Gargoyle::MyVertexInput in [[ stage_in ]],
							   constant SCNSceneBuffer& scn_frame [[buffer(0)]],
							   constant Gargoyle::MyNodeBuffer& scn_node [[buffer(1)]]
// device packed_float3* vertices [[ buffer(1) ]],
// device packed_float3* normals [[ buffer(2) ]],
							)
{
  VertexInOut vert;
  vert.position = scn_node.modelViewProjectionTransform * float4(in.position, 1.0);

    vert.relative_to_plane = position_relative_to_plane::behind;

  return vert;
}

fragment half4 fragmentPlane(Gargoyle::SimpleVertex in [[stage_in]],
							  constant Gargoyle::PlaneData& planeData [[buffer(2)]]) {
  // half4 color = half4(0.0, 1.0, 0.0, 1.0);
  float4 plane = planeData.plane;

  return half4(plane.x,
			   plane.y,
			   plane.z,
			   plane.w);
}
