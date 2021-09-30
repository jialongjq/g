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
uniform float radians = 0.5;

void main()
{
	float d = radians*time;
	mat3 yRotateMatrix = mat3(vec3(cos(d), 0, -sin(d)), vec3(0, 1, 0), vec3(sin(d), 0, cos(d)));
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(yRotateMatrix*vertex, 1.0);
}
