// random loop timing
if (image_speed > 0) {
	// last frame
	if (image_index == image_number) {
		image_speed = 0;
		
		alarm[0] = irandom_range(loopRange01, loopRange02);
	}
}

// depth sorting
depth = -y;

