/// @function src_dialog_data()
/// @description Menginisialisasi semua dialog minigame Sorting

function src_dialog_data()
{
    global.dialog = {};

    //==============================
    // OPENING
    //==============================
    global.dialog.opening =
    [
        "Halo! Selamat datang di Cosmic Café. Kamu pasti pegawai baru yang dijadwalkan mulai hari ini.",

        "Namamu... {player}, ya? Senang bertemu denganmu. Aku akan membimbingmu selama shift pertamamu.",

        "Tugasmu hari ini cukup sederhana. Setiap pelanggan akan meminta menu diurutkan berdasarkan harga.",

        "Kalau mereka meminta menu termurah, urutkan dari harga yang paling rendah ke yang paling tinggi.",

        "Kalau mereka meminta menu termahal, lakukan sebaliknya. Mulai dari harga tertinggi hingga terendah.",

        "Kalau kamu kesulitan mencari menu tertentu, gunakan tombol Search untuk membantumu menemukan menu lebih cepat.",

        "Setiap pelanggan juga memiliki batas waktu. Jadi bekerjalah dengan cepat, tetapi jangan sampai kehilangan ketelitian.",

        "Baiklah... kalau sudah siap, mari kita mulai shift pertamamu. Semoga sukses, {player}!"
    ];

    //==============================
    // COMBO
    //==============================
    global.dialog.combo =
    [
        "Wah, tiga pelanggan berturut-turut sudah kamu layani dengan benar.",

        "Sepertinya kamu mulai terbiasa dengan ritme pekerjaan di sini.",

        "Pertahankan fokusmu. Kerja bagus!"
    ];

    //==============================
    // OUTRO
    //==============================
    global.dialog.outro =
    [
        "Baik, pelanggan terakhir sudah selesai dilayani.",

        "Itu berarti shift hari ini resmi berakhir.",

        "Terima kasih atas kerja kerasmu hari ini, {player}.",

        "Untuk hari pertama, hasilmu sudah cukup baik.",

        "Semoga pengalaman hari ini membuatmu lebih siap menghadapi pelanggan berikutnya.",

        "Silakan lihat hasil kerjamu. Sampai jumpa lagi di Cosmic Café!"
    ];
}