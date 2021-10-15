#version 330 core

in vec4 frontColor;
in vec3 P;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float n = 8;

void main()
{
	if (mod(vtexCoord.x, 1/n*2) <= 1/n) {
		if (mod(vtexCoord.y, 1/n*2) <= 1/n)
			fragColor = vec4(0.8);
		else fragColor = vec4(0.0);
	}
	else if (mod(vtexCoord.x, 1/n*2) > 1/n) {
		if (mod(vtexCoord.y, 1/n*2) > 1/n) fragColor = vec4(0.8);
		else fragColor = vec4(0.0);
	}
}

/* 

void main()
{
    float radi = 0.3;
    vec2 C = vec2(0.5);
    float d = distance(C, vtexCoord);
    float w = dFdx(d);
    fragColor = vec4(1, 1-smoothstep(radi - w, radi + w, d), 0, 0);
    if (d < 0.3) fragColor = vec4(1, 0, 0, 0);
    else fragColor = vec4(1, 1, 0, 0);
}

*/
