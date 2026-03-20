if (cooldown > 0)
{
    cooldown -= 1;
}

switch (state)
{
    case "idle":
		image_speed = 2
        sprite_index = idle_sprite;
		audio_stop_sound(sfx_hazard);
    break;

    case "grab":
        sprite_index = grab_sprite;
    break;
}