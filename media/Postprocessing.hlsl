// https://www.shadertoy.com/view/4dfGzn
// ..\media\photo_4.jpg

float4 main( float4 pos : SV_POSITION ) : SV_Target
{
    float2 q = pos.xy / resolution;
    float2 uv = 0.5 + (q-0.5)*(0.9 + 0.1*sin(0.5*time));

    float3 oricol = textures[0].Sample(smooth, float2(q.x, q.y) ).xyz;
    float3 col;

    col.r = textures[0].Sample(smooth, float2(uv.x+0.003, uv.y)).x;
    col.g = textures[0].Sample(smooth, float2(uv.x+0.000, uv.y)).y;
    col.b = textures[0].Sample(smooth, float2(uv.x-0.003, uv.y)).z;

    col = clamp(col*0.5+0.5*col*col*1.2,0.0,1.0);

    col *= 0.5 + 0.5*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y);

    col *= float3(0.95,1.05,0.95);

    col *= 0.9+0.1*sin(10.0*time+uv.y*1000.0);

    col *= 0.99+0.01*sin(110.0*time);

    float comp = smoothstep( 0.2, 0.7, sin(time) );
    col = lerp( col, oricol, clamp(-2.0+2.0*q.x+3.0*comp,0.0,1.0) );

    return float4(col,1.0);
}