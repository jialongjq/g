#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform sampler2D colorMap;

float map(float a, float b, float c, float d, float x) {
	return ((x-a)/(b-a)*(d-c)+c);
}

void printNumber(float number, float position) {
	float s = map(position*1./6, position*1./6 + 1./6, number*1./10, number*1./10 + 1./10, vtexCoord.s);
	float t = vtexCoord.t;
	if (vtexCoord.s >= position*1./6 && vtexCoord.s <= position*1./6 + 1./6) {
		fragColor = texture(colorMap, vec2(s, t));
		if (fragColor == vec4(0)) discard;
		else fragColor = vec4(0, 0, 1, 0);
	}
}

void main()
{
	printNumber(4, 0.0);
	printNumber(9, 1.0);
	printNumber(2, 2.0);
	printNumber(4, 3.0);
	printNumber(2, 4.0);
	printNumber(6, 5.0);
}
