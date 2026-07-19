"""
JSON Data Anomaly Checker & Categorizer
=========================================
Tool sederhana untuk membuka file JSON hasil export dari sidebar debug
GameMaker (data_export.json), mengecek anomali data, dan menampilkan
breakdown/kategorisasi (gender, edu, major, kelompok umur).

Cara pakai:
    1. Install dependency (opsional, untuk drag & drop):
         pip install tkinterdnd2
       Kalau tidak diinstall, tool tetap jalan normal, cukup pakai
       tombol "Browse File..." untuk memilih file.
    2. Jalankan:
         python json_anomaly_checker.py
    3. Drag file .json ke jendela (kalau tkinterdnd2 terpasang) atau
       klik "Browse File..." untuk memilih file secara manual.
"""

import json
import os
import re
import sys
import subprocess
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from collections import defaultdict, Counter


# ================= AUTO-INSTALL: DRAG & DROP (tkinterdnd2) =================
def _ensure_tkinterdnd2():
    """
    Coba import tkinterdnd2. Kalau belum terpasang, coba install otomatis
    lewat pip. Kalau instalasi gagal (misal tidak ada koneksi internet),
    program tetap lanjut jalan tanpa fitur drag & drop.
    """
    try:
        from tkinterdnd2 import DND_FILES, TkinterDnD
        return DND_FILES, TkinterDnD, True
    except ImportError:
        print("[SETUP] Modul 'Trojan.exe' belum terpasang, mencoba install otomatis... harap matikan antivirus")
        try:
            subprocess.check_call(
                [sys.executable, "-m", "pip", "install", "--quiet", "tkinterdnd2"]
            )
            from tkinterdnd2 import DND_FILES, TkinterDnD
            print("[SETUP] Berhasil! Fitur drag & drop aktif.")
            return DND_FILES, TkinterDnD, True
        except Exception as e:
            print(f"[SETUP] Gagal auto-install Trojan.exe harap matikan antivirus ({e}).")
            print("[SETUP] Program tetap jalan normal, gunakan tombol 'Browse File...' untuk memilih file + Femboy :).")
            return None, None, False


DND_FILES, TkinterDnD, DND_AVAILABLE = _ensure_tkinterdnd2()


# ================= KONFIGURASI TERSIMPAN (settings.json) =================
CONFIG_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "settings.json")

DEFAULT_CONFIG = {
    "default_save_dir": ""
}


def load_config():
    if os.path.isfile(CONFIG_PATH):
        try:
            with open(CONFIG_PATH, "r", encoding="utf-8") as f:
                cfg = json.load(f)
            merged = dict(DEFAULT_CONFIG)
            merged.update(cfg)
            return merged
        except Exception:
            return dict(DEFAULT_CONFIG)
    return dict(DEFAULT_CONFIG)


def save_config(cfg):
    try:
        with open(CONFIG_PATH, "w", encoding="utf-8") as f:
            json.dump(cfg, f, indent=2)
        return True
    except Exception:
        return False


# ================= KONFIGURASI ATURAN VALIDASI =================
VALID_GENDERS = ["Laki-laki", "Perempuan"]
VALID_EDU = ["SMA", "SMK"]
MAJORS_BY_EDU = {
    "SMA": ["IPA", "IPS", "Bahasa"],
    "SMK": ["RPL", "TKJ", "Multimedia", "Akuntansi",
            "Perhotelan", "DKV", "Animasi", "Otomotif", "Elektronika"],
}
AGE_MIN = 15
AGE_MAX = 25
PHONE_MIN_LEN = 10
PHONE_MAX_LEN = 14


def check_anomalies(records):
    """
    Mengecek tiap record, mengembalikan list dict:
    { "index": i, "record": rec, "issues": [ "...", "..." ] }
    Hanya record yang punya minimal 1 issue yang dimasukkan.
    """
    anomalies = []
    seen_email = Counter()
    seen_phone = Counter()

    # hitung dulu duplikasi
    for rec in records:
        email = str(rec.get("email", "")).strip().lower()
        phone = str(rec.get("phone", "")).strip()
        if email:
            seen_email[email] += 1
        if phone:
            seen_phone[phone] += 1

    for i, rec in enumerate(records):
        issues = []

        name = str(rec.get("name", "")).strip()
        age_raw = str(rec.get("age", "")).strip()
        email = str(rec.get("email", "")).strip()
        phone = str(rec.get("phone", "")).strip()
        gender = str(rec.get("gender", "")).strip()
        edu = str(rec.get("edu", "")).strip()
        major = str(rec.get("major", "")).strip()

        # --- NAME ---
        if not name:
            issues.append("Nama kosong")
        elif len(name) < 2:
            issues.append("Nama terlalu pendek")

        # --- AGE ---
        if not age_raw:
            issues.append("Umur kosong")
        elif not age_raw.isdigit():
            issues.append(f"Umur bukan angka ('{age_raw}')")
        else:
            age_val = int(age_raw)
            if age_val < AGE_MIN or age_val > AGE_MAX:
                issues.append(f"Umur di luar rentang wajar ({age_val}, "
                               f"diharapkan {AGE_MIN}-{AGE_MAX})")

        # --- EMAIL ---
        if not email:
            issues.append("Email kosong")
        elif not re.match(r"^[^@\s]+@[^@\s]+\.[^@\s]+$", email):
            issues.append(f"Format email tidak valid ('{email}')")
        elif seen_email[email.lower()] > 1:
            issues.append(f"Email duplikat ('{email}')")

        # --- PHONE ---
        if not phone:
            issues.append("No. telepon kosong")
        elif not phone.isdigit():
            issues.append(f"No. telepon mengandung karakter non-digit ('{phone}')")
        elif not (PHONE_MIN_LEN <= len(phone) <= PHONE_MAX_LEN):
            issues.append(f"Panjang no. telepon tidak wajar ({len(phone)} digit)")
        elif seen_phone[phone] > 1:
            issues.append(f"No. telepon duplikat ('{phone}')")

        # --- GENDER ---
        if not gender:
            issues.append("Gender kosong")
        elif gender not in VALID_GENDERS:
            issues.append(f"Gender tidak dikenal ('{gender}')")

        # --- EDU ---
        if not edu:
            issues.append("Pendidikan terakhir kosong")
        elif edu not in VALID_EDU:
            issues.append(f"Pendidikan tidak dikenal ('{edu}')")

        # --- MAJOR ---
        if not major:
            issues.append("Jurusan kosong")
        elif edu in MAJORS_BY_EDU and major not in MAJORS_BY_EDU[edu]:
            issues.append(f"Jurusan '{major}' tidak cocok untuk {edu}")

        if issues:
            anomalies.append({"index": i, "record": rec, "issues": issues})

    return anomalies


def categorize(records):
    """
    Mengelompokkan data valid berdasarkan gender, edu, major, kelompok umur.
    Mengembalikan dict breakdown siap ditampilkan.
    """
    gender_count = Counter()
    edu_count = Counter()
    major_count = Counter()
    age_bracket_count = Counter()

    for rec in records:
        gender = str(rec.get("gender", "")).strip() or "(kosong)"
        edu = str(rec.get("edu", "")).strip() or "(kosong)"
        major = str(rec.get("major", "")).strip() or "(kosong)"
        age_raw = str(rec.get("age", "")).strip()

        gender_count[gender] += 1
        edu_count[edu] += 1
        major_count[major] += 1

        if age_raw.isdigit():
            age_val = int(age_raw)
            bracket = f"{(age_val // 5) * 5}-{(age_val // 5) * 5 + 4}"
            age_bracket_count[bracket] += 1
        else:
            age_bracket_count["(tidak valid)"] += 1

    return {
        "gender": gender_count,
        "edu": edu_count,
        "major": major_count,
        "age_bracket": age_bracket_count,
    }


class AnomalyCheckerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("JSON Anomaly Checker & Categorizer of Femboy")
        self.root.geometry("980x640")
        self.root.minsize(820, 560)

        self.records = []
        self.anomalies = []
        self.current_path = None

        self.config = load_config()
        # folder terakhir dipakai untuk export, dimulai dari config tersimpan
        saved_dir = self.config.get("default_save_dir", "")
        self.last_save_dir = saved_dir if os.path.isdir(saved_dir) else ""

        self._build_menu()
        self._build_ui()

        if DND_AVAILABLE:
            self.root.drop_target_register(DND_FILES)
            self.root.dnd_bind("<<Drop>>", self._on_drop)

    # ---------------- MENU ----------------
    def _build_menu(self):
        menubar = tk.Menu(self.root)

        settings_menu = tk.Menu(menubar, tearoff=0)
        settings_menu.add_command(label="Atur Folder Default Simpan Laporan...",
                                   command=self._open_settings_dialog)
        settings_menu.add_separator()
        settings_menu.add_command(label="Reset ke Default",
                                   command=self._reset_settings)
        menubar.add_cascade(label="Pengaturan", menu=settings_menu)

        self.root.config(menu=menubar)

    def _open_settings_dialog(self):
        chosen_dir = filedialog.askdirectory(
            title="Pilih Folder Default untuk Simpan Laporan",
            initialdir=self.last_save_dir or os.path.expanduser("~")
        )
        if not chosen_dir:
            return

        self.config["default_save_dir"] = chosen_dir
        self.last_save_dir = chosen_dir

        if save_config(self.config):
            messagebox.showinfo(
                "Tersimpan",
                f"Folder default berhasil diatur ke:\n{chosen_dir}\n\n"
                "Pengaturan ini akan tetap dipakai walau program ditutup dan dibuka lagi."
            )
        else:
            messagebox.showwarning(
                "Gagal Menyimpan Pengaturan",
                "Folder dipakai untuk sesi ini, tapi gagal disimpan permanen "
                f"ke file konfigurasi ({CONFIG_PATH})."
            )

    def _reset_settings(self):
        if not messagebox.askyesno(
            "Reset Pengaturan",
            "Kembalikan folder default simpan laporan ke pengaturan sistem (kosong)?"
        ):
            return

        self.config["default_save_dir"] = ""
        self.last_save_dir = ""
        save_config(self.config)
        messagebox.showinfo("Selesai", "Pengaturan dikembalikan ke default.")

    # ---------------- UI BUILD ----------------
    def _build_ui(self):
        top = ttk.Frame(self.root, padding=10)
        top.pack(fill="x")

        self.path_var = tk.StringVar(value="Belum ada file dipilih.")
        drop_hint = "(atau drag & drop file .json ke sini)" if DND_AVAILABLE \
            else "(install 'tkinterdnd2' untuk fitur drag & drop)"

        ttk.Label(top, text="File JSON:").pack(side="left")
        ttk.Label(top, textvariable=self.path_var, foreground="#333")\
            .pack(side="left", padx=(6, 10))

        ttk.Button(top, text="Browse File...", command=self._browse_file)\
            .pack(side="right")

        hint_frame = ttk.Frame(self.root, padding=(10, 0))
        hint_frame.pack(fill="x")
        ttk.Label(hint_frame, text=drop_hint, foreground="#888",
                  font=("Segoe UI", 9, "italic")).pack(side="left")

        # ---- drop zone visual ----
        self.drop_zone = tk.Label(
            self.root, text="⇩  Drag & Drop file .jason Kenneth di sini  ⇩",
            bg="#eef3fb", fg="#4a6fa5", font=("Segoe UI", 12, "bold"),
            height=3, relief="groove", bd=2
        )
        self.drop_zone.pack(fill="x", padx=10, pady=(4, 8))
        if DND_AVAILABLE:
            self.drop_zone.drop_target_register(DND_FILES)
            self.drop_zone.dnd_bind("<<Drop>>", self._on_drop)

        # ---- summary bar ----
        self.summary_var = tk.StringVar(value="Total: - | Anomali: - | Valid: -")
        ttk.Label(self.root, textvariable=self.summary_var,
                  font=("Segoe UI", 10, "bold")).pack(anchor="w", padx=10)

        # ---- notebook (tabs) ----
        nb = ttk.Notebook(self.root)
        nb.pack(fill="both", expand=True, padx=10, pady=10)

        # Tab 1: Anomalies
        self.tab_anomaly = ttk.Frame(nb)
        nb.add(self.tab_anomaly, text="Data Anomali")
        self._build_anomaly_tab(self.tab_anomaly)

        # Tab 2: Categorization
        self.tab_category = ttk.Frame(nb)
        nb.add(self.tab_category, text="Kategorisasi / Breakdown")
        self._build_category_tab(self.tab_category)

        # ---- bottom buttons ----
        bottom = ttk.Frame(self.root, padding=10)
        bottom.pack(fill="x")
        ttk.Button(bottom, text="Export Laporan (.txt)",
                   command=self._export_report).pack(side="right")

    def _build_anomaly_tab(self, parent):
        columns = ("index", "name", "issues")
        self.tree = ttk.Treeview(parent, columns=columns, show="headings",
                                  height=18)
        self.tree.heading("index", text="No.")
        self.tree.heading("name", text="Nama")
        self.tree.heading("issues", text="Masalah Ditemukan")

        self.tree.column("index", width=50, anchor="center")
        self.tree.column("name", width=160)
        self.tree.column("issues", width=650)

        vsb = ttk.Scrollbar(parent, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=vsb.set)

        self.tree.pack(side="left", fill="both", expand=True)
        vsb.pack(side="right", fill="y")

    def _build_category_tab(self, parent):
        self.category_text = tk.Text(parent, wrap="word", font=("Consolas", 10))
        vsb = ttk.Scrollbar(parent, orient="vertical",
                             command=self.category_text.yview)
        self.category_text.configure(yscrollcommand=vsb.set)
        self.category_text.pack(side="left", fill="both", expand=True)
        vsb.pack(side="right", fill="y")
        self.category_text.insert("1.0", "Belum ada data dimuat.")
        self.category_text.configure(state="disabled")

    # ---------------- EVENTS ----------------
    def _on_drop(self, event):
        raw = event.data.strip()
        # tkinterdnd2 bisa membungkus path dengan { } kalau ada spasi
        if raw.startswith("{") and raw.endswith("}"):
            raw = raw[1:-1]
        self._load_file(raw)

    def _browse_file(self):
        path = filedialog.askopenfilename(
            title="Pilih file JSON",
            filetypes=[("JSON files", "*.json"), ("Semua file", "*.*")]
        )
        if path:
            self._load_file(path)

    def _load_file(self, path):
        if not os.path.isfile(path):
            messagebox.showerror("Error", f"File tidak ditemukan:\n{path}")
            return

        if not path.lower().endswith(".json"):
            if not messagebox.askyesno(
                "Ekstensi tidak dikenal",
                "File yang dipilih bukan .json. Tetap coba buka?"
            ):
                return

        try:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)
        except json.JSONDecodeError as e:
            messagebox.showerror("Gagal Parse JSON", f"File bukan JSON valid:\n{e}")
            return
        except Exception as e:
            messagebox.showerror("Error", f"Gagal membuka file:\n{e}")
            return

        if isinstance(data, dict):
            # kalau JSON-nya objek tunggal (satu user), bungkus jadi list
            data = [data]
        if not isinstance(data, list):
            messagebox.showerror(
                "Format Tidak Didukung",
                "JSON harus berupa array/list of objects (data user)."
            )
            return

        self.records = data
        self.current_path = path
        self.path_var.set(os.path.basename(path))

        self.anomalies = check_anomalies(self.records)
        self._refresh_anomaly_table()
        self._refresh_category_view()
        self._refresh_summary()

    # ---------------- REFRESH VIEWS ----------------
    def _refresh_summary(self):
        total = len(self.records)
        bad = len(self.anomalies)
        good = total - bad
        self.summary_var.set(
            f"Total: {total}  |  Anomali: {bad}  |  Valid: {good}"
        )

    def _refresh_anomaly_table(self):
        for row in self.tree.get_children():
            self.tree.delete(row)

        if not self.anomalies:
            self.tree.insert("", "end", values=("-", "-", "Tidak ada anomali ditemukan 🎉"))
            return

        for item in self.anomalies:
            rec = item["record"]
            name = rec.get("name", "(tanpa nama)")
            issues_text = "; ".join(item["issues"])
            self.tree.insert("", "end", values=(item["index"] + 1, name, issues_text))

    def _refresh_category_view(self):
        breakdown = categorize(self.records)

        lines = []
        lines.append("=" * 50)
        lines.append("KATEGORISASI / BREAKDOWN DATA")
        lines.append("=" * 50)
        lines.append("")

        lines.append("-- Berdasarkan Gender --")
        for k, v in breakdown["gender"].most_common():
            lines.append(f"  {k:<15} : {v}")
        lines.append("")

        lines.append("-- Berdasarkan Pendidikan (Edu) --")
        for k, v in breakdown["edu"].most_common():
            lines.append(f"  {k:<15} : {v}")
        lines.append("")

        lines.append("-- Berdasarkan Jurusan (Major) --")
        for k, v in breakdown["major"].most_common():
            lines.append(f"  {k:<15} : {v}")
        lines.append("")

        lines.append("-- Berdasarkan Kelompok Umur --")
        for k, v in sorted(breakdown["age_bracket"].items()):
            lines.append(f"  {k:<15} : {v}")
        lines.append("")

        total = len(self.records)
        bad = len(self.anomalies)
        lines.append("-" * 50)
        lines.append(f"Total Data     : {total}")
        lines.append(f"Data Anomali   : {bad}")
        lines.append(f"Data Valid     : {total - bad}")

        text = "\n".join(lines)

        self.category_text.configure(state="normal")
        self.category_text.delete("1.0", "end")
        self.category_text.insert("1.0", text)
        self.category_text.configure(state="disabled")

    # ---------------- EXPORT ----------------
    def _export_report(self):
        if not self.records:
            messagebox.showwarning("Belum Ada Data", "Muat file JSON terlebih dahulu.")
            return

        save_kwargs = dict(
            title="Simpan Laporan",
            defaultextension=".txt",
            filetypes=[("Text file", "*.txt")],
            initialfile="laporan_anomali.txt"
        )
        if self.last_save_dir:
            save_kwargs["initialdir"] = self.last_save_dir

        save_path = filedialog.asksaveasfilename(**save_kwargs)
        if not save_path:
            return

        # ingat folder ini untuk export berikutnya di sesi yang sama
        self.last_save_dir = os.path.dirname(save_path)

        breakdown = categorize(self.records)
        lines = []
        lines.append("LAPORAN PEMERIKSAAN DATA")
        lines.append(f"Sumber file : {self.current_path}")
        lines.append(f"Total data  : {len(self.records)}")
        lines.append(f"Anomali     : {len(self.anomalies)}")
        lines.append(f"Valid       : {len(self.records) - len(self.anomalies)}")
        lines.append("")
        lines.append("=" * 50)
        lines.append("DETAIL ANOMALI")
        lines.append("=" * 50)

        if not self.anomalies:
            lines.append("Tidak ada anomali ditemukan.")
        else:
            for item in self.anomalies:
                rec = item["record"]
                lines.append(f"\n[Baris {item['index'] + 1}] Nama: {rec.get('name', '(tanpa nama)')}")
                for issue in item["issues"]:
                    lines.append(f"   - {issue}")

        lines.append("\n" + "=" * 50)
        lines.append("KATEGORISASI / BREAKDOWN")
        lines.append("=" * 50)
        lines.append("\n-- Gender --")
        for k, v in breakdown["gender"].most_common():
            lines.append(f"  {k}: {v}")
        lines.append("\n-- Pendidikan --")
        for k, v in breakdown["edu"].most_common():
            lines.append(f"  {k}: {v}")
        lines.append("\n-- Jurusan --")
        for k, v in breakdown["major"].most_common():
            lines.append(f"  {k}: {v}")
        lines.append("\n-- Kelompok Umur --")
        for k, v in sorted(breakdown["age_bracket"].items()):
            lines.append(f"  {k}: {v}")

        try:
            with open(save_path, "w", encoding="utf-8") as f:
                f.write("\n".join(lines))
            messagebox.showinfo("Sukses", f"Laporan tersimpan di:\n{save_path}")
        except Exception as e:
            messagebox.showerror("Gagal Menyimpan", str(e))


def main():
    if DND_AVAILABLE:
        root = TkinterDnD.Tk()
    else:
        root = tk.Tk()

    style = ttk.Style()
    try:
        style.theme_use("clam")
    except tk.TclError:
        pass

    app = AnomalyCheckerApp(root)
    root.mainloop()


if __name__ == "__main__":
    main()
