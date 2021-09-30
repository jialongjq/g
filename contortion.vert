#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    float a = 0;
    mat4 translation1 = mat4(vec4(1, 0, 0, 0), vec4(0, 1, 0, 0), vec4(0, 0, 1, 0), vec4(0, 1, 0, 1));
    
    if (vertex.y >= 0.5) a = (vertex.y-0.5)*sin(time*15.5);
    mat4 xRotation = mat4(vec4(1, 0, 0, 0), vec4(0, cos(a), sin(a), 0), vec4(0, -sin(a), cos(a), 0), vec4(0, 0, 0, 1));
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * translation1 * xRotation * vec4(vertex - vec3(0, 1, 0), 1.0);
}
