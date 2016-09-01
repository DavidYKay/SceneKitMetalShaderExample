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

fragment half4 fragmentAccent(Gargoyle::SimpleVertex in [[stage_in]],
							  constant Gargoyle::PlaneData& planeData [[buffer(2)]]) {
  // half4 color = half4(0.0, 1.0, 0.0, 1.0);
  float4 plane = planeData.plane;

  return half4(
			   plane.x,
			   plane.y,
			   plane.z,
			   plane.w);

}
