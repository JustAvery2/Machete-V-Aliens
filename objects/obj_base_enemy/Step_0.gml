if (current_growth < 1)
{
    current_growth = lerp(current_growth, 1, 0.1);
}

var dir = 1;
if (hspeed != 0)
{
    dir = sign(hspeed);
}


image_xscale = dir * (target_scale * current_growth);
image_yscale = target_scale * current_growth;

if (hspeed != 0)
{
    image_xscale = sign(hspeed) * target_scale;
}

/*
if (image_xscale < target_scale - 0.01)
{
    image_xscale = lerp(image_xscale, target_scale, 0.1);
    image_yscale = lerp(image_yscale, target_scale, 0.1);
}
else
{
    image_xscale = target_scale;
    image_yscale = target_scale;
}

if (hspeed != 0)
{
    image_xscale = sign(hspeed) * target_scale;
}
*/