shader_type canvas_item;

void fragment() {
	float t = TIME * 0.1;

	vec4 tex = texture(TEXTURE, UV);
	float x = texture(TEXTURE, vec2(tex.r + cos(t * 0.5 + SCREEN_UV.x * 20.0) * 0.1, tex.b + sin(t * 0.4214 + SCREEN_UV.x * 10.0) * 0.5 + 0.5)).r;
	float y = texture(TEXTURE, vec2(tex.b + cos(t * 0.124 + SCREEN_UV.x * 15.0) * 0.1, tex.g + sin(t * 0.4214 + SCREEN_UV.x * 5.0) * 0.5 + 0.5)).r;
	COLOR *= texture(TEXTURE, vec2(x, y));
}