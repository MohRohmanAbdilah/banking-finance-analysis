# 💳 Credit Card Transaction Evaluation & Risk-Value Identification

![Dashboard Preview](03_dashboard_preview.png)

## 📌 1. Strategi Bisnis
**Target Industri:** Finance / Perbankan  
**Masalah Utama:** Bank perlu meningkatkan penggunaan kartu (*revenue*) tanpa meningkatkan risiko gagal bayar (*debt*).

**Pertanyaan Bisnis:**
1.  **Deskriptif:** Apa kategori kartu yang menghasilkan nilai transaksi paling tinggi?
2.  **Diagnostik:** Mengapa beberapa kategori kartu memiliki tingkat error transaksi lebih tinggi dibanding yang lain?
3.  **Preskriptif:** Bagaimana pola utilisasi limit kartu pada nasabah aktif dengan skor kredit >700 dan DTI rendah?

## 📊 2. Indikator Kinerja Utama (KPI)
* **KPI Utama:** Average Ticket Size (ATS) per Kategori Kartu.
* **KPI Pendukung:** Transaction Error Rate dan Debt-to-Income (DTI) Ratio.

## 🛠️ 3. Eksekusi Analisis (5-Step Analysis)

### 🔍 Explore & Profile
Analisis dilakukan pada tiga dataset utama:
* **Transactions Data:** Detail transaksi termasuk jumlah (*amount*) dan status error.
* **Users Data:** Informasi profil nasabah (pendapatan, hutang, skor kredit).
* **Cards Data:** Informasi limit kartu dan jenis kartu yang dimiliki.
* Total gabungan data mencapai **144.907 baris**.

### 🧹 Clean & Shape (SQL)
Proses pembersihan dan penggabungan dilakukan di SQL (`01_extraction_query.sql`):
* **Standarisasi Tipe Data:** Menghapus simbol `$` pada kolom `amount`, `yearly_income`, `total_debt`, dan `credit_limit`, lalu mengubahnya menjadi `Decimal(18,2)`.
* **Binary Transformation:** Transformasi kolom `errors` (kosong/isi) menjadi format biner (1 = Error, 0 = Sukses).
* **Table Joining:** Menggabungkan ketiga tabel menggunakan **LEFT JOIN** dengan `Transactions` sebagai tabel utama, dihubungkan ke `Users` dan `Cards` melalui kolom Primary Key.
* **Formatting:** Memastikan data nasabah yang terdeteksi di *dark web* memiliki format yang konsisten untuk analisis risiko.

### 📈 Analyze & Feature Engineering
Membuat kolom kalkulasi baru di Excel untuk mendapatkan wawasan lebih dalam:
* **Limit Utilization (%)**: `(Amount / Credit Limit) * 100`.
* **DTI Ratio**: Rasio hutang terhadap pendapatan tahunan.
* **Average Ticket Size (ATS)**: Nilai rata-rata transaksi untuk melihat pola belanja.

## 📈 4. Storytelling & Hasil (Insights)

### 💡 Temuan (Aha! Moment)
* **Potensi Nasabah "Low Risk":** Nasabah dengan skor kredit >700 dan DTI rendah memiliki tingkat keamanan tinggi, namun **Limit Utilization** mereka menunjukkan angka yang rendah. Ini adalah *idle capacity* bagi bank.
* **Masalah Operasional:** Analisis pada `Transaction Error Rate` menunjukkan kategori kartu tertentu memiliki hambatan teknis yang mengurangi volume transaksi harian secara signifikan.

### 🚀 Rekomendasi Bisnis
1.  **Peningkatan Revenue:** Melakukan kampanye pemasaran tertarget (seperti cicilan 0% atau poin reward) pada nasabah aktif berskor kredit tinggi untuk mendorong penggunaan limit kartu.
2.  **Efisiensi Sistem:** Melakukan audit pada sistem otorisasi untuk kategori kartu dengan *Error Rate* tinggi guna meminimalisir kegagalan transaksi.

---

## 📁 Struktur Repositori
* 📁 **datasets/** : Berisi sampel data mentah (`transactions_sample.csv`, `users_sample.csv`, `cards_sample.csv`).
* 📄 `01_extraction_query.sql` : Script SQL pembersihan & penggabungan 3 tabel.
* 📊 `02_banking_performance_dashboard.xlsx` : File master dashboard (Data bersih + Visualisasi).
* 🖼️ `03_dashboard_preview.png` : Pratinjau visual dashboard.

> **Catatan Teknis:** Dataset di folder `datasets/` telah di-sampling (10.000 baris) karena batasan ukuran file GitHub. Analisis penuh dilakukan pada dataset asli berukuran 1 GB+.
