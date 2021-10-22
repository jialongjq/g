#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

bool inCercle(vec2 p, vec2 c, float r) {
	return (distance(p, c) <= r);
}

bool inRect(vec2 p, vec2 m, vec2 M) {
	return (p.x >= m.x && p.x <= M.x && p.y >= m.y && p.y <= M.y);
}

void main()
{
    vec2 p = 10*vtexCoord - 5; 
    fragColor = vec4(0);
	if (inCercle(p, vec2(0, -1), 3) && !inCercle(p, vec2(0, -1), 2) && p.y <= -1) fragColor = vec4(1);
	if (inRect(p, vec2(2, -1), vec2(3,4))) fragColor = vec4(1);
}
