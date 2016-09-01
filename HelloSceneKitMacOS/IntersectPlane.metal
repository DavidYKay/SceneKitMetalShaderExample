//
//  IntersectPlane.metal
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

#include <metal_stdlib>
#include "ShaderCommon.h"
using namespace metal;

fragment half4 fragmentAccent(Gargoyle::SimpleVertex in [[stage_in]],
                                constant Gargoyle::MyColor& colors [[buffer(2)]]) {
    // half4 color = half4(0.0, 1.0, 0.0, 1.0);

    return half4(
            colors.color.x,
            colors.color.y,
            colors.color.z,
            colors.color.w);

}
