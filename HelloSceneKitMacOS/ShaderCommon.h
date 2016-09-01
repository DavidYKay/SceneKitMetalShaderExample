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

namespace Gargoyle
{
  struct SimpleVertex
  {
      simd::float4 position [[position]];
  };

  typedef struct {
	float3 position [[ attribute(SCNVertexSemanticPosition) ]];
  } MyVertexInput;

  struct MyColor {
      simd::float4 color;
  };
  
}

#endif

#endif /* ShaderCommon_h */
