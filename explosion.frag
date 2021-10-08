#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D explosion;

float map(float a, float b, float c, float d, float x)
{
    return (x-a)/(b-a)*(d-c)+c;
}

void main()
{
    float s = map(0, 8, 0.0, 1.0, vtexCoord.s);
    float t = map(0, 6, 0.0, 1.0, vtexCoord.t);
    fragColor = texture(explosion, vec2(s, t));
} 
