//
//  IntersectPlane.metal
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct SimpleVertex
{
    float4 position [[position]];
};

struct MyColor {
    float4 color;
};

struct MyAccentColors {
    float4 primaryColor;
    float4 secondaryColor;
};

fragment half4 fragmentAccent(SimpleVertex in [[stage_in]],
                                constant MyColor& colors [[buffer(2)]]) {
    // half4 color = half4(0.0, 1.0, 0.0, 1.0);

    return half4(
            colors.color.x,
            colors.color.y,
            colors.color.z,
            colors.color.w);

}
