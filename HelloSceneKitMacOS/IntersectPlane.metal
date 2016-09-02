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

// enum class position_relative_to_plane { inside, behind, in_front_of };

constant int inside = 0;
constant int behind = 1;
constant int in_front_of = 2;
//enum PlanePosition { inside, behind, in_front_of };

struct Rastex {
  float4 cameraCoordinates [[position]];
  float4 worldCoordinates;
  int relative_to_plane;
};

struct ColorInOut {
  float4 position [[position]];
  float3 normal_cameraspace;
  float3 eye_direction_cameraspace;
  float3 light_direction_cameraspace;
  float distance_to_object;
};

float posToColor(float pos);
int inFrontOfPlane(Gargoyle::MyVertexInput vert, constant Gargoyle::PlaneData& planeData);

float posToColor(float pos) {
  float f = pos / 255.0;
  return f;
  //return int(f) % 255;
}

int inFrontOfPlane(Gargoyle::MyVertexInput vert, constant Gargoyle::PlaneData& planeData)
{
  float4 plane = planeData.plane;
  float3 point = vert.position;
	
  float result = (plane.x * point.x) + (plane.y * point.y) + (plane.z * point.z);
  if (result > plane.w) {
	  return behind;
	} else if (result < plane.w) {
	  return in_front_of;
	} else {
	return inside;
  }
}

vertex Rastex vertexPlane(Gargoyle::MyVertexInput in [[ stage_in ]],
							   constant SCNSceneBuffer& scn_frame [[buffer(0)]],
							   constant Gargoyle::MyNodeBuffer& scn_node [[buffer(1)]],
							   constant Gargoyle::PlaneData& planeData [[buffer(2)]])
{
  Rastex vert;
  vert.worldCoordinates = float4(in.position.x, in.position.y, in.position.z, 1.0);
  vert.cameraCoordinates = scn_node.modelViewProjectionTransform * float4(in.position, 1.0);
  vert.relative_to_plane = inFrontOfPlane(in, planeData);

  return vert;
}

fragment half4 fragmentPlane(Rastex in [[stage_in]],
							 constant Gargoyle::PlaneData& planeData [[buffer(2)]]) {
  
  // float4 plane = planeData.plane;
  int p = in.relative_to_plane;
  return half4(p == 0 ? 1.0 : 0.0,
  			   p == 1 ? 1.0 : 0.0,
  			   p == 2 ? 1.0 : 0.0,
  			   1.0);
  // return half4(plane.x, plane.y, plane.z, plane.w);

  // return half4(posToColor(in.worldCoordinates.x), posToColor(in.worldCoordinates.y), posToColor(in.worldCoordinates.z), 1.0);
  
  // return half4((in.position.x / 255.0) % 1,
  // 			   (in.position.y / 255.0) % 1,
  // 			   (in.position.z / 255.0) % 1,
  // 			   1.0);
  
}
