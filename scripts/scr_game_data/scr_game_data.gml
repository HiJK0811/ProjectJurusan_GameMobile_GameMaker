function scr_init_game_data() {
    if (variable_global_exists("game_data_ready")) return;
    global.game_data_ready = true;

    // ---------- STATE GLOBAL ----------
    global.dialog_active  = false;   // sedang ada kotak dialog terbuka?
    global.egg_started    = false;   // easter egg sudah dimulai?
    global.egg_completed  = false;   // semua Bekeners ketemu?
    global.bekeners_found = 0;
    global.bekeners_total = 7;

    // ---------- QUOTE BANK ADHILA (muncul acak sebelum pilihan) ----------
    global.adhila_quotes = [
        "Cara berpikir yang rapi itu bikin masalah kelihatan bisa dipegang.",
        "Promosi itu bukan memaksa orang memilih, tapi memberi orang keberanian mencoba.",
        "Aku suka lihat orang menemukan polanya sendiri."
    ];

    // ---------- DATA 7 BEKENERS ----------
    // sprite : spr_Bekeners (index 0) s/d spr_Bekeners_6 (index 6)
    // correct: index jawaban benar (0-3)
    global.bekeners_data = [
        {
            name    : "Bekeners Variable",
            question: "Dalam pemrograman, 'variabel' paling tepat diibaratkan sebagai...?",
            options : [
                "Kotak berlabel untuk menyimpan nilai",
                "Mesin pencetak dokumen",
                "Kabel penghubung listrik",
                "Layar untuk menonton video"
            ],
            correct : 0,
            edu     : "Variabel adalah 'kotak berlabel' di memori untuk menyimpan data. Isinya bisa diganti-ganti, misalnya skor = 10 lalu berubah jadi skor = 25."
        },
        {
            name    : "Bekeners Integers",
            question: "Manakah di bawah ini yang merupakan nilai bertipe INTEGER (bilangan bulat)?",
            options : [
                "3.14",
                "\"tujuh\"",
                "42",
                "true"
            ],
            correct : 2,
            edu     : "Integer adalah bilangan bulat tanpa koma, contohnya 42. Kalau 3.14 itu tipe desimal (float), \"tujuh\" itu teks (string), dan true itu boolean."
        },
        {
            name    : "Bekeners Logic",
            question: "Hasil dari operasi logika: BENAR DAN SALAH (true AND false) adalah...?",
            options : [
                "BENAR",
                "SALAH",
                "Kadang benar, kadang salah",
                "Error"
            ],
            correct : 1,
            edu     : "Operator AND hanya menghasilkan BENAR jika KEDUA sisinya benar. Karena salah satunya salah, hasilnya SALAH."
        },
        {
            name    : "Bekeners Function",
            question: "Apa manfaat utama membuat FUNCTION dalam sebuah program?",
            options : [
                "Membuat komputer lebih cepat secara fisik",
                "Agar kode bisa dipakai ulang dan lebih rapi",
                "Menambah kapasitas RAM",
                "Mengubah warna layar monitor"
            ],
            correct : 1,
            edu     : "Function membungkus sekumpulan instruksi supaya bisa dipanggil berulang kali. Kode jadi rapi, mudah dibaca, dan mudah diperbaiki."
        },
        {
            name    : "Bekeners Code",
            question: "Apa yang dimaksud dengan 'source code'?",
            options : [
                "Kumpulan instruksi yang ditulis programmer",
                "Kata sandi WiFi kampus",
                "Nomor seri sebuah komputer",
                "File musik di dalam game"
            ],
            correct : 0,
            edu     : "Source code adalah teks instruksi yang ditulis programmer dalam bahasa pemrograman, lalu diterjemahkan menjadi program yang bisa dijalankan komputer."
        },
        {
            name    : "Bekeners SDLC",
            question: "Dalam SDLC (Software Development Life Cycle), tahap yang umumnya dilakukan PERTAMA adalah...?",
            options : [
                "Testing (pengujian)",
                "Analisis kebutuhan (requirement)",
                "Maintenance (perawatan)",
                "Deployment (perilisan)"
            ],
            correct : 1,
            edu     : "SDLC biasanya dimulai dari analisis kebutuhan: memahami dulu masalah dan apa yang diinginkan pengguna, baru lanjut desain, coding, testing, rilis, dan maintenance."
        },
        {
            name    : "Bekeners Computer Science",
            question: "Sebagai pemimpin para Bekeners, jawab ini: Computer Science pada dasarnya mempelajari...?",
            options : [
                "Cara merakit meja komputer",
                "Komputasi, algoritma, dan pemecahan masalah",
                "Sejarah televisi dunia",
                "Cara memperbaiki AC ruangan"
            ],
            correct : 1,
            edu     : "Computer Science mempelajari bagaimana masalah dipecahkan lewat komputasi: algoritma, struktur data, logika, hingga bagaimana software dibangun."
        }
    ];
}
