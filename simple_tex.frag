#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D colorMap0;
uniform sampler2D colorMap1;

float map(float a, float b, float c, float d, float x)
{
    return (x-a)/(b-a)*(d-c)+c;
}

void main()
{
    vec4 color0 = texture(colorMap0, vtexCoord);
    vec4 color1 = texture(colorMap1, vtexCoord);
    fragColor = color0; // frontColor;
    if (vtexCoord.s >= 0.4 && vtexCoord.s <= 0.5
    && vtexCoord.t >= 0.2 && vtexCoord.t <= 0.3) {
	float s = map(0.4, 0.5, 0, 1, vtexCoord.s);
	float t = map(0.2, 0.3, 0, 1, vtexCoord.t);
	fragColor = texture(colorMap1, vec2(s));
    }
}
