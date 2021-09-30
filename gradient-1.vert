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
    
    float altura = abs(boundingBoxMax.y) + abs(boundingBoxMin.y);
    if (vertex.y <= boundingBoxMax.y && vertex.y >= boundingBoxMax.y - altura/4) frontColor = vec4(mix(cian, blue, (vertex.y - (boundingBoxMax.y - altura/4))/(boundingBoxMax.y - (boundingBoxMax.y - altura/4))), 1.0);
    else if (vertex.y <= boundingBoxMax.y - altura/4 && vertex.y >= boundingBoxMax.y - 2*altura/4) frontColor = vec4(mix(green, cian, (vertex.y - (boundingBoxMax.y - 2*altura/4))/((boundingBoxMax.y -altura/4) - (boundingBoxMax.y - 2*altura/4))), 1.0);
    else if (vertex.y <= boundingBoxMax.y - 2*altura/4 && vertex.y >= boundingBoxMax.y - 3*altura/4) frontColor = vec4(mix(yellow, green, (vertex.y - (boundingBoxMax.y - 3*altura/4))/((boundingBoxMax.y -2*altura/4) - (boundingBoxMax.y - 3*altura/4))), 1.0);
    else if (vertex.y <= boundingBoxMax.y - 3*altura/4 && vertex.y >= boundingBoxMax.y - 4*altura/4)
    frontColor = vec4(mix(red, yellow, (vertex.y - (boundingBoxMax.y - 4*altura/4))/((boundingBoxMax.y -3*altura/4) - (boundingBoxMax.y - 4*altura/4))), 1.0);
    
    
    
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
