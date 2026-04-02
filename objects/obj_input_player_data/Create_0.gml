label_text1 = "Name";
label_text2 = "Age";
label_text3 = "Email";
label_text4 = "Phone Number";
label_text5 = "Last-Education";
label_text5_A = "Major (SMA)";
label_text5_B = "Major (SMK)";

global.font_main = font_add_sprite(spr_font1, 32, true, 1);
if(!variable_global_exists("focused_input")){
    global.focused_input = noone;
}
input_name = "";
input_age = "";
input_phone = "";
input_email = "";

// posisi box (ikut label pertama)
// posisi input (sesuaikan dikit nanti manual)
name_y  = 500;
age_y   = 540;
email_y = 580;
phone_y = 620;

input_x = 279; // posisi kanan label
box_w = 250;
box_h = 30;

pos_y = [
    436,
    480,
    530,
    600,
    670,
    720,
    770
];
// status dropdown
edu_open = false;
selected_edu = "";   // "SMA" / "SMK"
selected_major = "";

// LIST SMA (fixed)
majors_SMA = [
    "IPA",
    "IPS",
    "Bahasa"
];

// LIST SMK (bisa kamu ubah nanti)
majors_SMK = [
    "RPL",
    "TKJ",
    "Multimedia",
    "Akuntansi",
    "Perhotelan"
];

start_x = 350;
global.name = "";
global.phone = "";
global.email = "";
