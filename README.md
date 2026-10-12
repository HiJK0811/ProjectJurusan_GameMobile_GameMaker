# Project Jurusan - Binusian Space Lounge

GameMaker Studio 2 mobile game project.

## Project Structure

### Branches
- **main** - Stable release
- **Mario_test** - Current development branch (this branch)
- **Daniel/cobanih** - Daniel's Hanoi minigame work
- **Diatra_Version** - Diatra's version
- **Jason/NPC** - Jason's NPC/cutscene work
- **Reynold_improvement** - Reynold's improvements

### Key Folders
```
Daniel_Hanoi/          - Tower of Hanoi minigame
Diatra_Version/        - Diatra's implementation
Jason_Main NPC Cutscene/ - Main game content
  ├── Objects/
  │   ├── Characters/      - Player & NPCs
  │   ├── Functional/      - Core systems (pause, camera, etc)
  │   ├── Minigame_Hanoi/  - Hanoi minigame objects
  │   └── Minigame_LogicGates/ - Logic gates minigame
  ├── Rooms/               - Game rooms/levels
  ├── Scripts/             - Utility scripts
  ├── Sprites/             - Graphics
  └── Sounds/              - Audio
```

### Core Objects
| Object | Purpose |
|--------|---------|
| `obj_mobile_controller` | **Touch input + virtual joystick** (persistent) |
| `obj_Player` | Player character (persistent) |
| `obj_gameStates` | Game state manager (persistent) |
| `obj_Camera` | Camera follow |
| `obj_dialogBox` | Dialogue system |
| `obj_cutsceneManager` | Cutscene system |
| `obj_musicManager` | Audio manager |

### Mobile Controls (Mario_test branch)
**Joystick Overlay** - Floating virtual joystick:
- Touch left half of screen → joystick base appears at touch point
- Drag within 80px radius → stick follows thumb
- 15px deadzone for neutral
- 8-directional movement with diagonals
- Buttons A (red) & B (blue) on right side

**Global Variables:**
```gml
global.v_up, global.v_down, global.v_left, global.v_right  // Directional
global.v_a, global.v_b                                      // Action buttons
global.v_a_pressed                                          // A button press (single frame)
global.joy_active                                           // Joystick currently touched
global.joy_x, global.joy_y                                  // Joystick offset (-80 to 80)
global.joy_base_x, global.joy_base_y                        // Joystick base position
```

### Rooms (Exploration)
- `room_explore_mainRoom` - Main lounge area
- `room_explore_arcade` - Arcade
- `room_explore_security` - Security room
- `room_explore_control` - Control room
- `room_explore_meeting` - Meeting room
- `room_explore_office` - Office
- `room_explore_storage` - Storage
- `room_explore_checkIn` - Check-in area

### Minigame Rooms
- `room_minigame_hanoi` - Tower of Hanoi
- `room_minigame_logicGates` - Logic Gates puzzle

### Key Scripts
| Script | Purpose |
|--------|---------|
| `scr_macros` | Direction constants (RIGHT=0, UP=1, LEFT=2, DOWN=3) |
| `scr_roomGoToFade` | Room transitions with fade |
| `scr_textboxFunctions` | Dialogue text rendering |
| `scr_cutsceneActions` | Cutscene commands |
| `scr_logicGates` | Logic gates minigame logic |
| `scr_musicFunction` | Music management |

## Recent Changes (Mario_test)

### Mobile Controller Rewrite
- Replaced D-pad with **floating joystick**
- Joystick spawns at touch position (left screen half)
- Visual: base circle, movable stick, deadzone indicator
- Buttons A/B repositioned to bottom-right

### Files Modified
```
objects/obj_mobile_controller/Create_0.gml     - Joystick globals init
objects/obj_mobile_controller/Step_0.gml       - Touch handling + joystick logic
objects/obj_mobile_controller/Draw_75.gml      - Joystick rendering (NEW)
objects/obj_mobile_controller/obj_mobile_controller.yy - Event registration
```

## Building
1. Open `com.gamemaker.yyp` in GameMaker Studio 2 (2023.6+)
2. Target: Android / iOS / HTML5
3. Run from `room_a_initialization`

## Controls
| Platform | Move | Interact (A) | Cancel/Menu (B) |
|----------|------|--------------|-----------------|
| Keyboard | WASD / Arrows | Enter / Space | Shift / Esc |
| Mobile | Virtual Joystick | Button A | Button B |
| Gamepad | Left Stick | A (South) | B (East) |