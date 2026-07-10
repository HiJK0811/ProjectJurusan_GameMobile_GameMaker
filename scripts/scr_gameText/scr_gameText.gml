// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	switch(_text_id){
		
	// == LYLIA ==
		case "Lylia_default":
			scr_text("Halo Player!", "Lylia", 1);
			scr_text("Senang bertemu denganmu!", "Lylia", 1);
			break;
			
		// Lylia Intro Cutscene
		case "Lylia_intro":
			scr_text("Halo, Selamat datang di Binusian Space Lounge", "Lylia", 1);
			scr_text("Perkenalkan nama saya Lylia, saya adalah pengurus tempat ini!", "Lylia", 1);
			scr_text("Kamu adalah Player bukan?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya Player", "intro_1");
			scr_option("Siapa?", "intro_2");
			break;
	
				case "intro_1":
					scr_text("Baik, senang bertemu denganmu, Player!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
		
				case "intro_2":
					scr_text("Iya, itu kamu Player! hahaha", "Lylia", 1);
					scr_text("Senang bertemu denganmu!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
			
			case "Lylia_intro_cont":
				scr_text("Ok Player, kamu pasti bingung dengan tempat ini! Saya jelaskan!", "Lylia", 1)
				scr_text("Ini adalah Binusian Space Lounge!", "Lylia", 1);
				scr_text("Tempat berkumpul mahasiswa dan karyawan BINUS di luar angkasa!", "Lylia", 1);
				scr_text("Iya, tempat ini beneran di luar angkasa", "Lylia", 1);
			
				scr_text("Tempat ini sudah berjalan mulus selama beberapa bulan...", "Lylia", 1);
				scr_text("Tetapi belakangan ini, mulai muncul beberapa masalah!", "Lylia", 1);
				scr_text("Seperti jukebox yang rusak, sistem navigasi yang kurang optimal, dan lain-lain...", "Lylia", 1);
			
				scr_text("Intinya, saya ingin kamu untuk membantu saya menyelesaikan masalah-masalah tersebut!", "Lylia", 1);
				// Input Player
				scr_text("?", "Player", -1);
				scr_option("Kenapa saya?", "intro_3");
				scr_option("Kenapa tidak orang lain yang membantu?", "intro_4")
				break;
						
					case "intro_3":
						scr_text("Saya yakin kamu adalah orang yang paling sesuai untuk melaksanakan tugas ini!.", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
					case "intro_4":
						scr_text("Karena berdasarkan permasalahan yang ada sekarang...", "Lylia", 1);
						scr_text("Saya yakin kamu akan menyelesaikan masalah tersebut lebih baik daripada orang lain!", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
			
			case "Lylia_intro_last":
				scr_text("~ Sepertinya saya ditugaskan untuk menyelesaikan permasalahan lounge! ~");
				scr_text("Jadi, kamu akan menyelesaikan masalah-masalah di beberapa ruagan di lounge!", "Lylia", 1);
				scr_text("Tidak apa-apa, kamu tidak harus menyelesaikan masalah tersebut secepatnya!", "Lylia", 1);
				scr_text("Kamu bisa keliling lounge terelebih dahulu untuk memperkenalkan diri!", "Lylia", 1);
				
				scr_text("Untuk masalah pertama, saya anjurkan kamu untuk memperbaiki jukebox di Cafe!", "Lylia", 1);
				scr_text("Jukeboxnya mengalami masalah kelistrikan yang menyebabkannya tidak berjalan!", "Lylia", 1);
				
				scr_text("Ok Player, semoga sukses dalam tugasnya!", "Lylia", 1);
				scr_text("Jika kamu ingin bantuan, kamu bisa bicara ke saya!", "Lylia", 1);
				
				obj_cutscene.introCompleted = true;
				//with (obj_cutsceneController) {
				//	introCompleted = true;
				//}
				break;
			
		
		// Lylia Logic Gate Intro
		case "Lylia_post_intro":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Apakah kamu ada masalah dalam memperbaiki jukeboxnya?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Saya butuh bantuan!", "jb_1");
			scr_option("Tidak ada, terima kasih", "jb_2")
			break;
			
				case "jb_1":
					scr_text("Ah, sepertinya kamu kurang tahu tentang Logic Gate! Saya jelaskan!", "Lylia", 1);
					scr_text("Jadi, tugasmu adalah menyalakan lampu dengan menekan sakelar yang disesuaikan dengan kondisi Logic Gate sebagai input agar arus di kabel bisa mengalir ke lampu!", "Lylia", 1);
					scr_text("Logic Gatenya terdiri dari: OR, AND, NOT, NOR, dan NAND!", "Lylia", 1);
					scr_text("Logic Gate OR akan benar jika ada salah satu input saja", "Lylia", 1);
					scr_text("Logic Gate AND akan benar jika ada semua input", "Lylia", 1);
					scr_text("Logic Gate NOT akan membalikkan input sekarang", "Lylia", 1);
					scr_text("Logic NOR adalah kebalikan OR dan akan benar jika tidak ada input sama sekali", "Lylia", 1);
					scr_text("Dan Logic Gate NAND adalah kebalikan AND dan akan salah jika ada kedua input!", "Lylia", 1);
					scr_text("Semoga kamu bisa memperbaiki jukeboxnya!", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
					
				case "jb_2":
					scr_text("Ok Player", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
			
		// Lylia after completing logic gate
		case "Lylia_post_logic":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah memperbaiki jukeboxnya!", "Lylia", 1);
			scr_text("Bagaimana? Apakah tugas tersebut susah?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Gampang sekali!", "jb_3");
			scr_option("Tadi sedikit susah!", "jb_4")
			break;
			
				case "jb_3":
					scr_text("Wow, kamu memang orang hebat!", "Lylia", 1);
					scr_text("Logic gate memerlukan pemikiran logika yang baik, dan kamu sanggup menyelesaikannya dengan mudah!", "Lylia", 1);
					scr_gameText("Lylia_post_logic_cont");
					break;
					
				case "jb_4":
					scr_text("Tidak apa-apa Player, yang penting kamu sudah berusaha dan berkat kamu, ...", "Lylia", 1);
					scr_text("Jukeboxnya mampu dibenarkan dan pengalaman pengunjung meningkat!", "Lylia", 1);
					scr_gameText("Lylia_post_logic_cont");
					break;
			
		case "Lylia_post_logic_cont":
			scr_text("Karena kamu sudah memperbaiki jukebox...", "Lylia", 1);
			scr_text("Selanjutnya, kamu bisa pergi ke office, ruangan di paling kanan, dan bertemu dengan Adhila!", "Lylia", 1);
			scr_text("Di sana, dia akan menjelaskan apa yang akan kamu kerjakan!", "Lylia", 1);
			scr_text("Player, jika kamu butuh istirahat, kamu bisa duduk sebentar di cafe sebelum ke sana! Ok!", "Lylia", 1);
			scr_text("Ambil waktu kamu Player!", "Lylia", 1);
			break;
			
		// Lylia after player completed graph
		case "Lylia_post_graph":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah memperbaiki sistem navigasi kami!", "Lylia", 1);
			scr_text("Aku sudah tahu kamu bisa melakukannya!", "Lylia", 1);
			scr_text("Untuk permasalahan selanjutnya, harap pergi ke Storage Room yang berada di atas Cafe!", "Lylia", 1);
			scr_text("Semoga sukses dan ambil waktumu Player!", "Lylia", 1);
			break;
			
		// Lylia after player completed Hanoi
		case "Lylia_post_hanoi":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah membantu Ami dalam memindahkan kontainernya!", "Lylia", 1);
			scr_text("Ami sangat merindukan bantuan kamu, Player...", "Lylia", 1);
			scr_text("dan sebagai temannya, saya sangat bangga dengan kamu!", "Lylia", 1);
			scr_text("Untuk permasalahan selanjutnya, kamu bisa pergi ke ruangan Control Room yang berada dekat dengan Storage Room!", "Lylia", 1);
			scr_text("Semoga sukses dan ambil waktumu Player!", "Lylia", 1);
			break;
			
		// Lylia after player completed flowchart
		case "Lylia_post_flowchart":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah membantu Roy dalam memperbaiki flowchartnya!", "Lylia", 1);
			scr_text("Flowchart tersebut kami gunakan untuk menentukan SOP dan alur kerja karyawan kami!", "Lylia", 1);
			scr_text("Dengan bantuan kamu, alur dan SOP akan jalan lebih baik dari sebelumnya!", "Lylia", 1);
			break;
		
		// Lylia Sorting Intro
		case "Lylia_sorting_intro":
			scr_text("Halo Player!", "Lylia", 1);
			scr_text("Sepertinya kamu sudah membantu Roy dalam memperbaiki flowchartnya...", "Lylia", 1);
			scr_text("Terima kasih Player atas bantuan kamu!", "Lylia", 1);
			scr_text("Karena kamu sudah menyelesaikan permalahan itu, hanya tersisa satu permasalahan lagi Player!", "Lylia", 1);
			scr_text("Untuk permasalahan terakhir...", "Lylia", 1);
			scr_text("Permasalahan ini tidak susah, tetapi permasalahan ini sangat repetitif jika dilakukan setiap hari!", "Lylia", 1);
			scr_text("Jadi setiap hari di Cafe, saya dan staf saya harus mensortir semua menu cafe dan pesanan pelanggan!", "Lylia", 1);
			scr_text("Untuk itu, saya minta kamu untuk membantu menyortir menu cafe agar kepuasan pelanggan meningkat!", "Lylia", 1);
			scr_text("Ok Player, tidak apa-apa kalau kamu ingin istirahat di sini terlebih dahulu!", "Lylia", 1);
			scr_text("Jika kamu sudah siap, kamu bisa bicara ke saya, Ok!", "Lylia", 1);
			break;
		
		// Lylia Sorting Minigame
		case "Lylia_sorting":
			scr_text("Halo Player!", "Lylia", 1);
			scr_text("Apakah kamu sudah siap?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya!", "sort_1");
			scr_option("Saya belum siap!", "sort_2")
			break;
			
				case "sort_1":
					scr_text("Ok Player, itulah yang saya ingin dengar!", "Lylia", 1);
					scr_text("Kalau begitu, marilah kita mulai!", "Lylia", 1);
					// Continue Minigame
					break;
					
				case "sort_2":
					scr_text("Tidak apa-apa Player!", "Lylia", 1);
					scr_text("Bicara ke saya lagi kalau kamu sudah siap!", "Lylia", 1);
					scr_text("Ambil waktumu Player!", "Lylia", 1);
					break;
		
		// Lylia after completing sorting
		case "Lylia_outro":
			scr_text("Kamu keliling, kamu bantu, dan kamu mempunyai jiwa yang baik...", "Lylia", 1);
			scr_text("Kadang kontribusi tidak harus besar. Yang besar sering lahir dari yang teguh dan konsisten.", "Lylia", 1);
			scr_text("...", "Player", -1);
			scr_text("Oh, Halo Player!", "Lylia", 1);
			scr_text("Maaf tadi saya lagi monolog", "Lylia", 1);
			scr_text("Player, Terima kasih atas semua bantuan dan kontribusi di lounge!", "Lylia", 1);
			scr_text("Semua bantuan dan kontribusi kamu di lounge sangat berharga bagi saya dan semua mahasiswa dan staf di sini!", "Lylia", 1);
			scr_text("Sebagai apresiasi atas kerja kamu, saya memberikan kunci untuk mesin arcade!", "Lylia", 1);
			scr_text("Kamu bisa memainkan ulang minigamenya pada Arcade Room, ruang di bawah Control Room!", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Baik, aku coba main kembali!", "arcade_1");
			scr_option("Aku senang pernah jadi bagian dari suasana ini!", "arcade_2");
			break;
			
				case "arcade_1":
					scr_text("Ok Player, selamat bermain!", "Lylia", 1);
					break;
					
				case "arcade_2":
					scr_text("Iya, saya juga senang sekali punya suasana dengan kamu", "Lylia", 1);
					break;
			
			
	// == ADHILA ==
		case "Adhila_default":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Nama aku Adhila!", "Adhila", 1);
			scr_text("Aku mahasiswa BINUS yang sekarang lagi magang di lounge ini!", "Adhila", 1);
			scr_text("Salam kenal!", "Adhila", 1);
			break;
		
		// Adhila Intro Cutscene
		case "Adhila_intro":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Aku dengar kamu sudah memperbaiki jukebox...", "Adhila", 1);
			scr_text("Itu benar kan?", "Adhila", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya memperbaikinya!", "adhila_intro_1");
			scr_option("Bukan saya", "adhila_intro_2");
			scr_option("Jukeboxnya memperbaiki sendiri!", "adhila_intro_3")
			break;
			
				case "adhila_intro_1":
					scr_text("Wow, terima kasih iya sudah memperbaikinya!", "Adhila", 1);
					scr_text("Memang Kak Lylia tidak bohong kalau kamu itu orang berbakat!", "Adhila", 1);
					scr_text("Karena kamu, cafenya tidak lagi membosankan karena sekarang sudah ada musik lagi!", "Adhila", 1);
					scr_gameText("Adhila_intro_cont");
					break;
					
				case "adhila_intro_2":
					scr_text("Haha jangan berbohong Player!", "Adhila", 1);
					scr_text("Aku sudah tahu kamu yang memperbaiknya karena Kak Lylia bilang ke aku", "Adhila", 1);
					scr_text("Jadi, terima kasih sudah memperbaikinya!", "Adhila", 1);
					scr_text("Karena kamu, cafenya tidak lagi membosankan karena sekarang sudah ada musik lagi!", "Adhila", 1);
					scr_gameText("Adhila_intro_cont");
					break;
					
				case "adhila_intro_3":
					scr_text("Wah, benarkah?", "Adhila", 1);
					scr_text("Terakhir kali aku cek, jukeboxnya rusak...", "Adhila", 1);
					scr_text("Kok tiba-tiba jadi benar dengan sendirinya?", "Adhila", 1);
					scr_text("Hmmm..., kira-kira siapa yang memperbaikinya ya?", "Adhila", 1);
					scr_text("...", "Player", -1);
					
					scr_text("Kenapa Player? apakah kamu setuju kalau jukeboxnya memperbaiki sendirinya?", "Adhila", 1)
					// Input Layer	
					scr_text("?", "Player", -1);
					scr_option("Iya...", "adhila_intro_4");
					scr_option("Mungkin saja", "adhila_intro_5")
					break;
					
						case "adhila_intro_4":
							scr_text("Kok kamu kelihatan tidak yakin?", "Adhila", 1);
							scr_text("Aku sudah tahu kalau kamu memperbaikinya!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya...", "Adhila", 1);
							scr_text("Jadi, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
						case "adhila_intro_5":
							scr_text("Iya kalau gitu, kemungkinan juga kamu yang memperbaikinya!", "Adhila", 1);
							scr_text("Jadi, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
							scr_text("Aku sudah tahu kalau kamu memperbaikinya!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya tadi!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
			case "Adhila_intro_cont":
				scr_text("Ok, jadi untuk permasalahan di ruang ini...", "Adhila", 1);
				scr_text("Sistem navigasi kita untuk rute antar-planet kurang optimal...", "Adhila", 1);
				scr_text("Ini menyebabkan gangguan navigasi dan keterlambatan datanganya kapal angkasa ke planet tujuan...", "Adhila", 1);
				scr_text("Untuk meneyelsaikan masalah ini, aku ingin kamu membantu aku dalam memperbaiki sistem navgisanya!", "Adhila", 1);
				scr_text("Ok Player, untuk melaksanakan tugasnya bisa pergi ke ruang meeting yang berada di belakang pintu ini!", "Adhila", 1);
				scr_text("Semoga sukses player!", "Adhila", 1);
				break;
		
		// Adhila after cutscene
		case "Adhila_post_intro":
			scr_text("Hai Player!", "Adhila", 1);
			scr_text("Kamu boleh masuk ke ruang meeting di belakang pintu untuk memulai tugasnya!", "Adhila", 1);
			scr_text("Tidak harus cepat selesainya, kamu bisa ke kafe dulu kalau kamu butuh istirahat", "Adhila", 1);
			scr_text("Dan jika nanti kamu kesusahan mengerjakan, kamu bisa nanya ke staf yang sedang bekerja di sana!", "Adhila", 1);
			scr_text("Ok Player, semoga sukses!", "Adhila", 1);
			break;
		
		// Adhila after completing graph
		case "Adhila_post_graph":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Terima kasih ya, sudah memperbaiki sistem navigasi kami!", "Adhila", 1);
			scr_text("Dengan perbaikan kamu, aku percaya kalau proses navigasi antarplanet menjadi lebih bagus!", "Adhila", 1);
			scr_text("Untuk permasalahan di lounge, masih ada beberapa lagi!", "Adhila", 1);
			scr_text("Aku dengar kalau di Storage Room, terdapat permasalahan logistik... ", "Adhila", 1);
			scr_text("di Control Room, ada permasalahan alur kerja karyawan...", "Adhila", 1);
			scr_text("dan menu di Cafe belum tersortir...", "Adhila", 1);
			scr_text("Aku yakin kamu bisa membantu mereka menyelesaikan permasalahan tersebut!", "Adhila", 1);
			scr_text("Semoga sukses Player, dan sampai jumpa!", "Adhila", 1);
			scr_text("~ Sepertinya masih ada beberapa masalah di lounge ini! ~");
			scr_text("~ Saya merasa untuk membantu permasalahn di Storange Room terlebih dahulu! ~");
			break;
			
	// == AMI ==
		case "Ami_default":
			scr_text("Hei Player!", "Lylia", 1);
			scr_text("Salam kenal, aku Ami", "Lylia", 1);
			scr_text("Pengurus bagian logistik lounge ini", "Lylia", 1);
			break;
			
		// Ami and Lylia Cutscene
		case "Ami_intro":
			scr_text("Halo Ami, apakah ada permasalahan di Storage Room?", "Lylia", 1);
			scr_text("Iya Lia, tetap ada masalah itu lagi...", "Ami", 1);
			scr_text("Proses logistik kita itu kurang efisien, Lia", "Ami", 1);
			scr_text("Kita sering mengirim barang ke planet lain, tetapi prosesnya sedikit lama dan tidak efisien!", "Ami", 1);
			scr_text("Dan ketika kita menerima barang, aku tidak mampu sortir semua barang tersebut dalam waktu!", "Ami", 1);
			scr_text("Aku tidak tahu harus apa lagi, Lia...", "Ami", 1);
			scr_text("AKu sudah bekerja sekeras mungkin dan saya sering capai memikirkan ini!", "Ami", 1);
			scr_text("Wah, maaf Ami, saya tidak tahu kamu harus bekerja sekeras ini!", "Lylia", 1);
			scr_text("Apakah yang saya bisa lakukan untuk membantumu?", "Lylia", 1);
			scr_text("Aku butuh pekerja lagi, Lia, dan aku tidak tahu siapa yang bisa membantu!", "Ami", 1);
			scr_text("Hmm, saya izin berkomentar, saya rekomen kamu untuk rekrut Player untuk membantumu!", "Lylia", 1);
			scr_text("Player kah, orang yang memperbaiki jukebox bukan? kenapa kamu rekomen dia?", "Ami", 1);
			scr_text("Iya, itu dia yang memperbaikinya, dia juga barusan memperbaiki sistem navigasi kami!", "Lylia", 1);
			scr_text("Saya yakin Player akan bisa membantu permasalahanmu dengan baik!", "Lylia", 1);
			scr_text("Menyelesaikan masalah-masalah tersebut tidak gampang dan memerlukan pemikiran dan logika yang bagus!", "Lylia", 1);
			scr_text("Hmm...", "Ami", 1);
			scr_text("Ok Lia, aku percaya kamu!", "Ami", 1);
			scr_text("Terima kasih Lia untuk sugestinya!", "Ami", 1);
			scr_text("Tidak apa-apa Ami!", "Lylia", 1);
			scr_text("Lia itu Player bukan?", "Ami", 1);
			scr_gameText("Ami_intro_cont");
			break;
			
		case "Ami_intro_cont":
			scr_text("Halo Player!, ini Ami, pengurus logistik lounge!", "Lylia", 1);
			scr_text("Dia bekerja di Storage Room, ruangan di atas Cafe!", "Lylia", 1);
			scr_text("Apakah kamu sudah mengenal Ami?", "Lylia", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Iya, saya tadi kenalan dengan Ami", "ami_intro_1");
				scr_option("Saya belum mengenal Ami!", "ami_intro_2")
				break;
					
					case "ami_intro_1":
						scr_text("Iya, tadi Player bertemu dengan saya!", "Ami", 1);
						scr_text("Wow, bagus sekali kalian sudah kenalan!", "Lylia", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text("Player, aku harus kembali kerja terlebih dahulu, sampai jumpa!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
					
					case "ami_intro_2":
						scr_text("Ok Player, namaku Ami, salam kenal!", "Ami", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text("Player, aku harus kembali kerja terlebih dahulu, sampai jumpa!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
						
			case "Ami_intro_last":
				scr_text("Player, aku harap kamu bisa membantu Ami menyelesaikan masalah dia!", "Lylia", 1);
				obj_cutscene.introCompleted = true;
				break;
			
		// Ami Hanoi Intro
		case "Ami_hanoi_intro":
			scr_text("Hei Player! kita ketemu lagi!", "Ami", 1);
			scr_text("Tanpa basa-basi, aku akan jelaskan apa yang kamu lakukan!", "Ami", 1);
			scr_text("Jadi, kamu membantu saya memindahkan kontainer-kontainer yang tertumpuk ke conveyor belt untuk dikirim!", "Ami", 1);
			scr_text("Sayangnya karena tempat ini terbatas dan containernya berat, kamu harus memindahkan kontainernya dengan cara tertentu!", "Ami", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Cara tertentu?", "ami_hanoi_1");
				scr_option("Apakah caranya mirip dengan Tower of Hanoi?", "ami_hanoi_2")
				break;
					
				case "ami_hanoi_1":
					scr_text("Maaf, aku kira kamu sudah tahu...", "Ami", 1);
					scr_text("Kamu bisa menggunakan cara Tower of Hanoi", "Ami", 1);
					scr_text("Kita menggunakan cara ini karena efisien dan clawnya tidak bisa memindahkan tumpukan container!", "Ami", 1);
					scr_text("Untuk cara kerjanya, jadi kamu hanya bisa memindahkan containernya satu per satu dan tidak bisa menempatkan comntainer lebih besar di atas yang lebih kecil!", "Ami", 1);
					scr_text("Untuk ini, kamu harus hati-hati untuk tempat penempatan containernya!", "Ami", 1);
					scr_gameText("Ami_hanoi_last")
					break;
					
				case "ami_hanoi_2":
					scr_text("Benar Player, emang kau pintar Player!", "Ami", 1);
					scr_text("Kalau begitu, apakah kamu sudah tahu cara kerja Tower of Hanoi?", "Ami", 1);
					// Input Layer	
						scr_text("?", "Player", -1);
						scr_option("Saya sudah tahu caranya!", "ami_hanoi_3");
						scr_option("Saya belum terlalu familiar!", "ami_hanoi_1")
						break;
							
					case "ami_hanoi_3":
						scr_text("Bagus sekali Player!", "Ami", 1);
						scr_gameText("Ami_hanoi_last")
						break;
						
			case "Ami_hanoi_last":
				scr_text("Ok Player, karena kamu sudah tahu cara kerjanya!", "Ami", 1);
				scr_text("Kamu bisa menggunakan control panelnya untuk mengoperasi clawnya...", "Ami", 1);
				scr_text("dan memindahkan containernya!", "Ami", 1);
				scr_text("Ingat, hanya satu container saja dan tidak bukan tumpukan!", "Ami", 1);
				scr_text("Dan Player, karena proses ini menguras waktu...", "Ami", 1);
				scr_text("Kamu bisa memilih 2 dari 3 tumpukan container untuk dpindahkan!", "Ami", 1);
				scr_text("Atau kamu bisa menyelesaikan tiga-tiganya, aku tidak keberatan!", "Ami", 1);
				scr_text("Semoga kamu bisa menyelesaikannya Player!", "Ami", 1);
				break;
			
		// Ami after completing Hanoi minigame
		case "Ami_post_hanoi":
			scr_text("Hei player!", "Ami", 1);
			scr_text("Selamat telah membantu aku memindahkan tumpukan kontainernya!", "Ami", 1);
			scr_text("Aku berterima kasih banget kepadamu!", "Ami", 1);
			scr_text("Ini sangat berarti bagi ku, jadi terima kasih lagi Player!", "Ami", 1);
			scr_text("Karena kamu sudah menyelesaikan masalah ini, kamu bisa menyelesaikan masalah lain di lounge atau istirahat dulu!", "Ami", 1);
			scr_text("Itu pilhanmu Player!", "Ami", 1);
			scr_text("Ok Player, sampai jumpa kembali!", "Ami", 1)
			scr_text("~ Sekarang terdapat 2 masalah lagi! ~");
			scr_text("~ Saya harap cek Control Room terlebih dahulu! ~");
			break;
		
	
	// == ROY ==
		case "Roy_default":
			scr_text("Halo Player!", "Roy", 1);
			scr_text("Perkenalkan, nama saya Roy!", "Roy", 1);
			scr_text("Saya adalah karyawan Control Room!", "Roy", 1);
			scr_text("Salam kenal dan senang bertemu denganmu!", "Roy", 1);
			break;
			
		// Roy Intro (after Hanoi)
		case "Roy_intro":
			scr_text("Halo Player, Saya Roy!", "Roy", 1);
			scr_text("Saya dengar Anda telah membantu Ami dalam memindahkan barang di Storage Room!", "Roy", 1);
			scr_text("Itu hebat sekali Player!", "Roy", 1);
			scr_text("Dengan itu, saya ingin memberi tahu sesuatu!", "Roy", 1);
			scr_text("Saya ingin Anda untuk membantu permasalahan di Control Room!", "Roy", 1);
			scr_text("Permasalahan ini mengenai SOP dan alur kerja lounge secara keseluruhan!", "Roy", 1);
			scr_text("Untuk detail permasalahannya, nanti saya jelaskan di sana!", "Roy", 1);
			scr_text("Player, apakah Anda sudah siap?", "Roy", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Saya sudah siap!", "roy_intro_1");
				scr_option("Saya harus istirahat terlebih dahulu!", "roy_intro_2")
				break;
		
				case "roy_intro_1":
					scr_text("Baiklah Player", "Roy", 1);
					scr_text("Saat Anda sudah siap, harap masuk ke Control Room!", "Roy", 1);
					scr_text("Jika Anda butuh istirahat terlebih dahulu, tidak apa-apa!", "Roy", 1);
					scr_text("Saya akan menunggu Anda di sana!", "Roy", 1);
					break;
							
				case "roy_intro_2":
					scr_text("Baiklah, tidak apa-apa Player", "Roy", 1);
					scr_text("Nanti jika Anda sudah siap, nanti bisa ke Control Room!", "Roy", 1);
					scr_text("Saya akan menunggu Anda di sana!", "Roy", 1);
					scr_gameText("Ami_hanoi_last");
					break;
		
		// Roy Flowchart Minigame
		case "Roy_flowchart":
			scr_text("Selamat datang Player!", "Roy", 1);
			scr_text("Sebelum itu, saya jelaskan dulu apa yang Anda akan lakukan!", "Roy", 1);
			scr_text("Jadi, Anda akan membantu saya memperbaiki alur flowchart di control panel...", "Roy", 1);
			scr_text("Flowchartnya harus sesuai dengan permintaan sistem dan akan dicek juga", "Roy", 1);
			scr_text("Semoga Anda bisa memperbaiki alur flowchartnya agar alur kerja dan SOP lounge ini tidak berantakan!", "Roy", 1);
			scr_text("Semoga berhasil, Player!", "Roy", 1);
			break;
			
		// Roy after completing flowchart
		case "Roy_post_flowchart":
			scr_text("Halo Player!", "Roy", 1);
			scr_text("Terima kasih telah membantu saya dalam memperbaiki alur flowchart!", "Roy", 1);
			scr_text("Kontribusi Anda sangat berharga bagi kami!", "Roy", 1);
			scr_text("Sekarang, hanya tersisa satu permasalahan lagi Player!", "Roy", 1);
			scr_text("Untuk permasalahan tersebut, harap ketemu Kak Lylia lagi di Cafe!", "Roy", 1);
			scr_text("Sekali lagi, terima kasih atas bantuan Anda dan sampai jumpa!", "Roy", 1);
			scr_text("Semoga Anda tetap sukses!", "Roy", 1);
			break;
		
	}
}