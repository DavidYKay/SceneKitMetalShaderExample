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
#include "ShaderCommon.h"


vertex Gargoyle::SimpleVertex myVertex(Gargoyle::MyVertexInput in [[ stage_in ]],
                             constant SCNSceneBuffer& scn_frame [[buffer(0)]],
									   constant Gargoyle::MyNodeBuffer& scn_node [[buffer(1)]])
{
    Gargoyle::SimpleVertex vert;
    vert.position = scn_node.modelViewProjectionTransform * float4(in.position, 1.0);

    return vert;
}

fragment half4 myFragment(Gargoyle::SimpleVertex in [[stage_in]])
{
    return half4(0.0, 1.0, 0.0, 1.0);
}
