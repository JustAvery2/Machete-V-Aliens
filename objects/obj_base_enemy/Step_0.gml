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