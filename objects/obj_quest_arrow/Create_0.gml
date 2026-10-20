// Pastikan objek panah penunjuk quest selalu ada di setiap room
if (!instance_exists(obj_quest_arrow)) {
    // Buat di kedalaman (depth) yang selalu terlihat di depan, misal -8000
    instance_create_depth(x, y, -8000, obj_quest_arrow);
}