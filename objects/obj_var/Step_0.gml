if (time_left > 0) {
    time_left -= 1; 
}

if (time_left == 0) {
    with (obj_floor) {
        instance_destroy(); 
    }
}

