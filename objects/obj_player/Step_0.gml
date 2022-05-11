/// @description Player movement

// check keys for movement
moveRight = keyboard_check(vk_right);
moveLeft = keyboard_check(vk_left);
moveUp = keyboard_check(vk_up);
moveDown = keyboard_check(vk_down);

// caclulate movement
vx = (moveRight - moveLeft) * walkSpeed;
vy = (moveDown - moveUp) * walkSpeed;

// idle
if (vx == 0 && vy == 0) {
	// change idle sprite based on last direction
	switch dir {
		case 0:
		sprite_index = spr_player_idle_right;
		break;
		
		case 1:
		sprite_index = spr_player_idle_up;
		break;
		
		case 2:
		sprite_index = spr_player_idle_left;
		break;
		
		case 3:
		sprite_index = spr_player_idle_down;
		break;
	}
}

// moving
if (vx != 0 || vy != 0) {
	if (!collision_point(x + vx, y, obj_par_environment, true, true)) {
		x += vx;
	}
	
	if (!collision_point(x, y + vy, obj_par_environment, true, true)) {
		y += vy;
	}
	
	// change walking sprite based on direction
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	}
	
	if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	}
	
	if (vy > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
	}
	
	if (vy < 0) {
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
}

// depth sorting
depth = -y;
