//mendisplay titik tengah UI monitor
ui_x = 640/2;
ui_y = 360/2;


//kasih tombol back
back_x = 570;
back_y = 80;
back_scale = 0.17;
back_size = 0.17;
back_distance = 32;

//variabel Utama
total_bobot_jalan = 0; //Nilai dari kumpulan perjalanan roket
//node_awal = 0; //Awal Roket
node_target = -1; //Akhir Jalan roket
roket_berjalan = false; //Pemicu Animasi Roket Terbang
stage_cleared = false;

//Struktur data graph
nodes = [] //Array Koordinat & nama planet;
edges_possible = []; //Array menampung jalur cirkuit laser & bobot angka.
indeks_start = 0; //planet awal
indeks_target = 0; //planet tujuan
target_bobot_maksimum = 0;

//integrasi filter berbasis angka ID
var _diff = global.current_difficulty;
var _sub = global.current_sub_stage;


audio_stop_sound(snd_bgm_hanoi);
if (!audio_is_playing(snd_bgm_graph)) {
    audio_play_sound(snd_bgm_graph, 1, true);
}

switch (_diff) {
    case 0:
        switch (_sub) {
            case 0:
                nodes = [
                    {xx: 80, yy: 180, nama: "Alpha"}, 
                    {xx: 280, yy: 90, nama: "Initial Planet"},
                    {xx: 280, yy: 270, nama: "Metal Planet"},
                    {xx: 540, yy: 180, nama: "Death Challenger"}, 
                    {xx: 500, yy: 300, nama: "Neon Flow"}
                ];
                edges_possible = [
                    {n1: 0, n2: 1, bobot: 12, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 25, terpilih: false}, 
                    {n1: 1, n2: 3, bobot: 10, terpilih: false}, 
                    {n1: 1, n2: 4, bobot: 11, terpilih: false},
                    {n1: 2, n2: 4, bobot: 20, terpilih: false},
                    {n1: 2, n2: 3, bobot: 12, terpilih: false},
                    {n1: 3, n2: 4, bobot: 8, terpilih: false},
                    {n1: 4, n2: 3, bobot: 8, terpilih: false}
                ];
                indeks_start = 0;
                indeks_target = 3; 
                target_bobot_maksimum = 22; 
                break;
                
            case 1:
                nodes = [
                    {xx: 80,  yy: 180, nama: "Beta Station"},       
                    {xx: 230, yy: 100, nama: "Oceanic Node"},       
                    {xx: 250, yy: 260, nama: "Desert Outpost"},      
                    {xx: 420, yy: 130, nama: "Cyber Nexus"},         
                    {xx: 540, yy: 220, nama: "Omega Core"}           
                ];
                edges_possible = [
                    {n1: 0, n2: 1, bobot: 15, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 10, terpilih: false}, 
                    {n1: 1, n2: 3, bobot: 20, terpilih: false}, 
                    {n1: 2, n2: 3, bobot: 15, terpilih: false}, 
                    {n1: 2, n2: 4, bobot: 35, terpilih: false}, 
                    {n1: 3, n2: 4, bobot: 10, terpilih: false}  
                ];
                indeks_start = 0;          
                indeks_target = 4;         
                target_bobot_maksimum = 35; 
                break;
                
            case 2:
                nodes = [
                    {xx: 80,  yy: 180, nama: "Gamma Sector"},
                    {xx: 540, yy: 180, nama: "Alpha Centauri"}
                ];
                edges_possible = [
                    {n1: 0, n2: 1, bobot: 50, terpilih: false}
                ];
                indeks_start = 0;
                indeks_target = 1;
                target_bobot_maksimum = 50;
                break;
        }
        break;
		
	case 1:
		switch(_sub){ //Stage 2-1
			case 0:
				nodes = [
					{xx: 70, yy: 180, nama: "F@BE6"},
					{xx: 320, yy: 255, nama: "CHRONOS-07"},
					{xx: 130, yy: 310, nama: "AG0l"},
					{xx: 400, yy: 90, nama: "MKR-09"},
					{xx: 190, yy: 120, nama: "CC-21"},
					{xx: 540, yy: 180, nama: "INIT-01"}
				];
				
				edges_possible = [
                    {n1: 0, n2: 1, bobot: 10, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 20, terpilih: false}, 
                    {n1: 1, n2: 3, bobot: 15, terpilih: false}, 
                    {n1: 1, n2: 2, bobot: 5,  terpilih: false}, 
                    {n1: 2, n2: 4, bobot: 25, terpilih: false}, 
                    {n1: 3, n2: 5, bobot: 15, terpilih: false}, 
                    {n1: 4, n2: 5, bobot: 10, terpilih: false}, 
                    {n1: 3, n2: 4, bobot: 30, terpilih: false}  
                ];
				indeks_start = 0;
				indeks_target = 5;
				target_bobot_maksimum = 40;
				break;
				
			case 1:
				nodes = [
					{xx: 70,  yy: 180, nama: "INIT-01"},   
                    {xx: 210, yy: 80,  nama: "D34TH-02"},      
                    {xx: 210, yy: 280, nama: "NEON-04"},    
                    {xx: 310, yy: 180, nama: "IRON-05"},     
                    {xx: 410, yy: 80,  nama: "CHAL-03"},  
                    {xx: 410, yy: 280, nama: "AG0L"},    
                    {xx: 550, yy: 180, nama: "CHRONOS-07"}
				];
				
				edges_possible = [
					{n1: 0, n2: 1, bobot: 12, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 15, terpilih: false}, 
                    {n1: 1, n2: 3, bobot: 8,  terpilih: false}, 
                    {n1: 1, n2: 4, bobot: 28, terpilih: false}, // Laser 5: Prism -> Vortex (Jebakan Lurus Berat)
                    {n1: 2, n2: 3, bobot: 7 , terpilih: false},
					{n1: 2, n2: 5, bobot: 18, terpilih: false}, 
                    {n1: 3, n2: 4, bobot: 14, terpilih: false}, 
                    {n1: 3, n2: 5, bobot: 9,  terpilih: false}, 
                    {n1: 4, n2: 6, bobot: 16, terpilih: false}, 
                    {n1: 5, n2: 6, bobot: 12, terpilih: false}  
                ];
				indeks_start = 0;
				indeks_target = 6;
				target_bobot_maksimum = 41;
				break;
				
				case 2:
				nodes = [
					{xx: 70,  yy: 180, nama: "CHRONOS-07"},   
                    {xx: 210, yy: 80,  nama: "D34TH-02"},      
                    {xx: 210, yy: 280, nama: "NEON-04"},    
                    {xx: 310, yy: 180, nama: "IRON-05"},     
                    {xx: 410, yy: 80,  nama: "CHAL-03"},  
                    {xx: 410, yy: 280, nama: "AG0L"},    
                    {xx: 550, yy: 180, nama: "902SA"}
				];
				
				edges_possible = [
					{n1: 0, n2: 1, bobot: 23, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 14, terpilih: false}, 
                    {n1: 1, n2: 3, bobot: 9,  terpilih: false}, 
                    {n1: 1, n2: 4, bobot: 17, terpilih: false}, // Laser 5: Prism -> Vortex (Jebakan Lurus Berat)
                    {n1: 2, n2: 3, bobot: 16, terpilih: false},
					{n1: 2, n2: 5, bobot: 31, terpilih: false}, 
                    {n1: 3, n2: 4, bobot: 21, terpilih: false}, 
                    {n1: 3, n2: 5, bobot: 12,  terpilih: false}, 
					{n1: 4, n2: 5, bobot: 8, terpilih: false},
                    {n1: 4, n2: 6, bobot: 18, terpilih: false}, 
                    {n1: 5, n2: 6, bobot: 13, terpilih: false}  
                ];
				indeks_start = 0;
				indeks_target = 6;
				target_bobot_maksimum = 55;
				break;
		}
		break;
		
	case 2:
        switch (_sub) {
            case 0:
                nodes = [
                    {xx: 50,  yy: 180, nama: "902SA"},    // Index 0 (Start)
                    {xx: 160, yy: 80,  nama: "Astraea Lab"},     // Index 1 (Atas 1)
                    {xx: 160, yy: 280, nama: "Krypton Outpost"}, // Index 2 (Bawah 1)
                    {xx: 290, yy: 120, nama: "Nexus Prime"},     // Index 3 (Tengah Atas)
                    {xx: 290, yy: 240, nama: "Umbra Node"},      // Index 4 (Tengah Bawah)
                    {xx: 420, yy: 80,  nama: "Hyperion Core"},   // Index 5 (Atas 2)
                    {xx: 420, yy: 280, nama: "Void Station"},    // Index 6 (Bawah 2)
                    {xx: 570, yy: 180, nama: "Omega Point"}      // Index 7 (Target Finish)
                ];
               edges_possible = [
                    {n1: 0, n2: 1, bobot: 22, terpilih: false}, 
                    {n1: 0, n2: 2, bobot: 18, terpilih: false},
                    {n1: 1, n2: 3, bobot: 15, terpilih: false},
                    {n1: 2, n2: 4, bobot: 21, terpilih: false}, 
                    {n1: 3, n2: 4, bobot: 12, terpilih: false}, // Laser 5: Nexus -> Umbra (Vertikal Tengah)
                    {n1: 3, n2: 5, bobot: 26, terpilih: false},
                    {n1: 4, n2: 6, bobot: 19, terpilih: false},
                    {n1: 5, n2: 6, bobot: 14, terpilih: false}, // Laser 8: Hyperion -> Void (Vertikal Kanan)
                    {n1: 5, n2: 7, bobot: 24, terpilih: false}, 
                    {n1: 6, n2: 7, bobot: 17, terpilih: false}, 
                    {n1: 1, n2: 5, bobot: 45, terpilih: false}  
                ];
                indeks_start = 0;
                indeks_target = 7; 
                target_bobot_maksimum = 75; 
                break;
				
			case 1:
                nodes = [
                    {xx: 50,  yy: 180, nama: "Alpha Core"},      // Index 0 (Start)
                    {xx: 150, yy: 80,  nama: "Orion Node"},      // Index 1 (Baris 1 Atas)
                    {xx: 150, yy: 280, nama: "Titan Relic"},     // Index 2 (Baris 1 Bawah)
                    {xx: 270, yy: 180, nama: "Central Hub"},     // Index 3 (Pusat Kiri)
                    {xx: 390, yy: 80,  nama: "Pulsar Lab"},      // Index 4 (Baris 2 Atas)
                    {xx: 390, yy: 280, nama: "Dark Outpost"},    // Index 5 (Baris 2 Bawah)
                    {xx: 480, yy: 130, nama: "Nebula Core"},     // Index 6 (Baris 3 Atas)
                    {xx: 480, yy: 230, nama: "Starlight Hub"},   // Index 7 (Baris 3 Bawah)
                    {xx: 580, yy: 180, nama: "Apex Gateway"}     // Index 8 (Target Finish)
                ];
               edges_possible = [
                    {n1: 0, n2: 1, bobot: 26, terpilih: false}, // Laser 1: Alpha -> Orion
                    {n1: 0, n2: 2, bobot: 18, terpilih: false}, // Laser 2: Alpha -> Titan
                    {n1: 1, n2: 3, bobot: 24, terpilih: false}, // Laser 3: Orion -> Central
                    {n1: 2, n2: 3, bobot: 17, terpilih: false}, // Laser 4: Titan -> Central
                    {n1: 3, n2: 4, bobot: 28, terpilih: false}, // Laser 5: Central -> Pulsar
                    {n1: 3, n2: 5, bobot: 20, terpilih: false}, // Laser 6: Central -> Dark Outpost
                    {n1: 4, n2: 6, bobot: 16, terpilih: false}, // Laser 7: Pulsar -> Nebula
                    {n1: 5, n2: 7, bobot: 21, terpilih: false}, // Laser 8: Dark -> Starlight
                    {n1: 6, n2: 8, bobot: 15, terpilih: false}, // Laser 9: Nebula -> Apex
                    {n1: 7, n2: 8, bobot: 14, terpilih: false}, // Laser 10: Starlight -> Apex
                    {n1: 4, n2: 7, bobot: 22, terpilih: false}, // Laser 11: Pulsar -> Starlight (Penyeberangan)
                    {n1: 5, n2: 6, bobot: 30, terpilih: false}  // Laser 12: Dark -> Nebula (Penyeberangan Berat)
                ];
                indeks_start = 0;
                indeks_target = 8; 
                target_bobot_maksimum = 90; 
                break;
				
			case 2:
                nodes = [
                    {xx: 45,  yy: 180, nama: "Zero Station"},    // Index 0 (Start)
                    {xx: 140, yy: 80,  nama: "Vortex Node"},     // Index 1
                    {xx: 140, yy: 280, nama: "Magma Outpost"},   // Index 2
                    {xx: 250, yy: 130, nama: "Aether Lab"},      // Index 3
                    {xx: 250, yy: 230, nama: "Chrono Core"},     // Index 4
                    {xx: 370, yy: 80,  nama: "Zenith Hub"},      // Index 5
                    {xx: 370, yy: 280, nama: "Eclipse Relic"},   // Index 6
                    {xx: 480, yy: 180, nama: "Nova Terminal"},   // Index 7
                    {xx: 585, yy: 180, nama: "Singularity"}      // Index 8 (Target Finish)
                ];
               edges_possible = [
					{n1: 0, n2: 1, bobot: 25, terpilih: false}, // Laser 1: Zero -> Vortex
                    {n1: 0, n2: 2, bobot: 20, terpilih: false}, // Laser 2: Zero -> Magma
                    {n1: 1, n2: 3, bobot: 18, terpilih: false}, // Laser 3: Vortex -> Aether
                    {n1: 2, n2: 4, bobot: 22, terpilih: false}, // Laser 4: Magma -> Chrono
                    {n1: 1, n2: 2, bobot: 12, terpilih: false}, // Laser 5: Vortex -> Magma (Vertikal 1)
                    {n1: 3, n2: 4, bobot: 15, terpilih: false}, // Laser 6: Aether -> Chrono (Vertikal 2)
                    {n1: 3, n2: 5, bobot: 28, terpilih: false}, // Laser 7: Aether -> Zenith
                    {n1: 4, n2: 6, bobot: 24, terpilih: false}, // Laser 8: Chrono -> Eclipse
                    {n1: 5, n2: 7, bobot: 19, terpilih: false}, // Laser 9: Zenith -> Nova
                    {n1: 6, n2: 7, bobot: 16, terpilih: false}, // Laser 10: Eclipse -> Nova
                    {n1: 7, n2: 8, bobot: 18, terpilih: false}, // Laser 11: Nova -> Singularity
                    {n1: 5, n2: 6, bobot: 10, terpilih: false}, // Laser 12: Zenith -> Eclipse (Vertikal 3)
                    {n1: 3, n2: 6, bobot: 35, terpilih: false}, // Laser 13: Aether -> Eclipse (Jebakan Silang)
                    {n1: 4, n2: 5, bobot: 30, terpilih: false}  // Laser 14: Chrono -> Zenith (Jebakan Silang)
                ];
                indeks_start = 0;
                indeks_target = 8; 
                target_bobot_maksimum = 100; 
                break;
				
		}
}


//inisial awal roket.
if(array_length(nodes) > 0){
	roket_node_sekarang = indeks_start;
	roket_x = nodes[roket_node_sekarang].xx;
	roket_y = nodes[roket_node_sekarang].yy;
}	

banner_scale = 0;

