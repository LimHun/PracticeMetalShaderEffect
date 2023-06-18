//
//  Shaders.metal
//  PracticeMetalShaderEffect
//
//  Created by 임훈 on 2023/06/18.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] float2 pixellate(float2 position, float size) {
    float2 pixellatedPosition = round(position / size) * size;
    return pixellatedPosition;
}
  
[[ stitchable ]] float2 wave(float2 position, float time, float speed, float frequency, float amplitude) {
    float positionY = position.y + sin((time * speed) + (position.x / frequency)) * amplitude;
    return float2(position.x, positionY);
}
