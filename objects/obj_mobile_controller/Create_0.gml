// 1. Cegah duplikasi objek controller
if (instance_number(obj_mobile_controller) > 1) {
    instance_destroy();
    exit;
}

// 2. Jadikan abadi lintas room
persistent = true;

// 3. MATIKAN RENDER OTOMATIS GAMEMAKER (Supaya layar tidak ganda di background)
application_surface_draw_enable(false);

// 4. Inisialisasi ukuran awal surface
game_width  = room_width; 
game_height = room_height; 
game_surface = surface_create(game_width, game_height);

// 5. Langsung arahkan ke room initialization asli game-mu
room_goto(room_a_initialization);

// Deklarasi awal variabel global virtual
global.v_up    = false;
global.v_down  = false;
global.v_left  = false;
global.v_right = false;
global.v_a     = false;
global.v_b     = false;