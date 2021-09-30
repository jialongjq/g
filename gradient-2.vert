#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform vec3 red = vec3(1, 0, 0);
uniform vec3 yellow = vec3(1, 1, 0);
uniform vec3 green = vec3(0, 1, 0);
uniform vec3 cian = vec3(0, 1, 1);
uniform vec3 blue = vec3(0, 0, 1);

uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    
    vec4 provisional = modelViewProjectionMatrix * vec4(vertex, 1.0);
    float y_ndc = provisional.y/provisional.w;
    if (y_ndc >= 0.5 && y_ndc <= 1) frontColor = vec4(mix(cian, blue, (y_ndc - 0.5)/0.5), 1.0);
    else if (y_ndc >= 0 && y_ndc <= 0.5) frontColor = vec4(mix(green, cian, (y_ndc - 0)/0.5), 1.0);
    else if (y_ndc >= -0.5 && y_ndc <= 0) frontColor = vec4(mix(yellow, green, (y_ndc + 0.5)/0.5), 1.0);
    else if (y_ndc >= -1 && y_ndc <= -0.5) frontColor = vec4(mix(red, yellow, (y_ndc +1)/0.5), 1.0);
    
    vtexCoord = texCoord;
    gl_Position = provisional;
}
