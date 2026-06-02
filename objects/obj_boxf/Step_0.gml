if (variable_instance_exists(id, "sliding_to_conveyor")) {
    if (sliding_to_conveyor) {
        x += 5; // Kecepatan meluncur di conveyor
        image_angle += 1; // Opsional: sedikit efek goyang/rotasi
    }
}