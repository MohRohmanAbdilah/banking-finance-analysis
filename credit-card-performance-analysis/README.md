# 💳 Credit Card Transaction Evaluation & Risk-Value Identification

## 📖 Project Background
Sebagai seorang Data Analyst di industri perbankan, saya ditugaskan untuk menganalisis perilaku transaksi nasabah. Fokus utama proyek ini adalah mengidentifikasi peluang untuk meningkatkan penggunaan kartu kredit pada segmen nasabah berisiko rendah (Low-Risk) tanpa meningkatkan potensi gagal bayar.

Saat ini, bank melihat adanya ketimpangan di mana nasabah dengan profil kredit sehat (Credit Score >700) justru lebih sering menggunakan kartu debit. Proyek ini bertujuan untuk menggali hambatan teknis dan memberikan rekomendasi strategi berbasis data untuk mengonversi volume transaksi debit menjadi kredit.

**Insights dan rekomendasi difokuskan pada area berikut:**
* **Category 1: Transaction Reliability:** Analisis kegagalan transaksi dan dampaknya terhadap arus kas.
* **Category 2: Customer Spending Behavior:** Perbandingan penggunaan antara instrumen Debit dan Kredit.
* **Category 3: Credit Utilization:** Evaluasi efektivitas limit kredit yang diberikan kepada nasabah aman.
* **Category 4: Operational System Health:** Dampak gangguan teknis terhadap volume transaksi harian.

### 🛠️ Quick Links
* **SQL Queries (Cleaning & Analysis):** [Link ke file .sql Anda]
* **Interactive Excel Dashboard:** [Link ke file Excel/OneDrive Anda]

---

## 📊 Data Structure & Initial Checks
Struktur database utama terdiri dari tiga tabel dengan total data mencapai **144,907 baris**:
1. **Transactions Table:** Berisi detail nominal, stempel waktu, dan status error transaksi.
2. **Users Table:** Berisi profil risiko, skor kredit, dan rasio utang (DTI).
3. **Cards Table:** Berisi informasi limit kredit, jenis kartu, dan brand (Visa, Mastercard, dll).

---

## 📑 Executive Summary

### Overview of Findings
Analisis menunjukkan bahwa nasabah "Low-Risk" memiliki **Credit Utilization Rate** yang sangat rendah, yaitu hanya **0.58%**, sementara volume belanja didominasi oleh kartu debit sebesar **$16,227**. Selain itu, ditemukan korelasi langsung antara gangguan sistem (*technical glitches*) dengan penurunan drastis volume transaksi sebesar **60%** pada tanggal 16 Januari. Masalah utama kegagalan transaksi adalah **Insufficient Balance** (298 kasus), yang menunjukkan perlunya sistem notifikasi saldo yang lebih proaktif.

![Dashboard Preview](03_dashboard_preview.png)

---

## 🔍 Insights Deep Dive

### Category 1: Root Cause Analysis of Transaction Failures
* **Dominasi Saldo Tidak Cukup:** "Insufficient Balance" adalah pendorong utama penolakan transaksi, terhitung sebanyak **298 kasus** (67% dari total error).
* **Hambatan Teknis:** Terdapat **55 kasus Technical Glitch** yang menghalangi nasabah untuk bertransaksi meskipun mereka memiliki dana/limit yang cukup.

### Category 2: Daily Spending Activity & Volume Patterns
* **Anomali Volume:** Pada 16 Januari 2010, volume transaksi anjlok menjadi **$759.91**, turun drastis dari rata-rata harian yang berada di kisaran $1,500 - $1,900.
* **Dampak Downtime:** Penurunan ini bertepatan dengan tercatatnya 55 gangguan teknis, yang membuktikan bahwa stabilitas sistem adalah kunci utama dalam menjaga volume belanja harian.

### Category 3: Total Spending by Card Type
* **Preferensi Debit:** Nasabah lebih nyaman menggunakan Debit ($16,227) dibandingkan Credit ($9,611). 
* **Potensi Revenue:** Karena nasabah ini adalah segmen berisiko rendah (Credit Score >700), bank kehilangan potensi pendapatan dari bunga dan biaya transaksi kredit yang seharusnya bisa dioptimalkan.

### Category 4: Credit Utilization Rate
* **Idle Capacity:** Angka pemakaian kredit sebesar **0.58%** menunjukkan bahwa limit kredit yang diberikan tidak dimanfaatkan secara maksimal. Ini menunjukkan produk kartu kredit saat ini kurang kompetitif atau kurang menarik dibandingkan kartu debit bagi nasabah tersebut.

---

## 🚀 Recommendations
Berdasarkan temuan di atas, saya merekomendasikan langkah-langkah berikut:
* **Sistem Notifikasi Real-Time:** Mengimplementasikan peringatan saldo rendah (low-balance alerts) untuk membantu nasabah menghindari kegagalan transaksi "Insufficient Balance".
* **Strategi Insentif Kredit:** Meluncurkan program loyalitas seperti cashback atau poin reward khusus untuk transaksi kartu kredit guna mendorong perpindahan penggunaan dari Debit ke Credit.
* **Audit Infrastruktur IT:** Melakukan pemeliharaan sistem secara berkala untuk meminimalkan *technical glitch* yang terbukti menyebabkan kehilangan volume transaksi hingga 60% dalam sehari.

---

## ⚠️ Assumptions and Caveats
* **Data Filtering:** Data telah difilter untuk hanya menyertakan nasabah dengan Credit Score >= 700 dan DTI < 0.4 untuk fokus pada segmen berisiko rendah.
* **Security Exclusion:** Kartu yang terindikasi bocor di *Dark Web* telah dihapus dari dataset untuk memastikan akurasi data transaksi yang sah.
* **Missing Data:** Transaksi dengan status error yang tidak terdefinisi dikeluarkan dari analisis Root Cause.
