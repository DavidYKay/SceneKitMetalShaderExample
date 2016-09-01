//
//  ShaderCommon.h
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

#ifndef ShaderCommon_h
#define ShaderCommon_h

#import <simd/simd.h>

#ifdef __cplusplus

using namespace metal;
#include <SceneKit/scn_metal>

namespace Gargoyle
{
  struct SimpleVertex
  {
      simd::float4 position [[position]];
  };

  typedef struct {
      simd::float3 position [[ attribute(SCNVertexSemanticPosition) ]];
  } MyVertexInput;

  struct MyColor {
      simd::float4 color;
  };

  struct PlaneData {
      simd::float4 plane;
  };
  
}

#endif

#endif /* ShaderCommon_h */
