Config Terbaru Nixos "Lebih Rapi dan Minimal"
❄️ NixOS Dotfiles: Hype7x8

Repositori ini berisi konfigurasi sistem NixOS saya yang bersifat deklaratif dan reproduksibel. Konfigurasi ini dioptimalkan untuk performa gaming, multimedia, dan pengembangan perangkat lunak.
✨ Fitur Unggulan

    Modern Stack: Menggunakan Nix Flakes untuk manajemen dependensi yang lebih stabil.

    Desktop Environment: Menggunakan KDE Plasma 6 terbaru dengan SDDM sebagai display manager.

    Gaming Ready: Dilengkapi dengan gamemode, gamescope, mangohud, steam-run, dan wine (unstable).

    AMD Optimized: Konfigurasi khusus untuk driver amdgpu, termasuk dukungan OpenCL dan perbaikan fase initramfs.

    Home Manager Integration: Manajemen aplikasi user (diecko) dan dotfiles secara terpusat melalui home.nix.

    Repository Tools: Integrasi dengan NUR (Nix User Repository) untuk paket-paket komunitas seperti xdman.

🧩 Advanced Package Management

Konfigurasi ini menggunakan pendekatan hybrid untuk memastikan stabilitas sistem sekaligus mendapatkan akses ke perangkat lunak terbaru:
🧪 Unstable & Special Packages

Untuk aplikasi yang membutuhkan fitur paling mutakhir, sistem ini menarik paket langsung dari cabang nixpkgs-unstable:

    Wine: Menggunakan versi unstable untuk kompatibilitas aplikasi Windows yang lebih baik.

    Kvantum & Heroic: Diambil dari unstable guna mendapatkan perbaikan bug terbaru pada interface KDE.

    Gaming Tools: Dilengkapi dengan gamemode, gamescope, dan mangohud untuk performa maksimal.

🏗️ NUR (Nix User Repository)

Integrasi dengan NUR memungkinkan instalasi paket komunitas yang tidak tersedia di repositori resmi:

    XDMAN: Terintegrasi melalui repositori lonerOrz lengkap dengan desktop entry kustom.

    Overlay Support: Konfigurasi flake.nix sudah menyertakan overlay NUR agar dapat diakses dengan mudah di seluruh sistem.

🐍 Python Environment

Konfigurasi ini menyertakan environment Python yang dideklarasikan secara eksplisit dengan pustaka analisis data:

    Libraries: Sudah terinstall pandas, requests, numpy, dan matplotlib.

    Declarative: Semua dependensi Python dikelola langsung oleh Home Manager, memastikan lingkungan kerja selalu identik.

📂 Struktur Repositori
| File | Deskripsi |
| :----: | :----: |
| `flake.nix` | Entry point utama, mendefinisikan input (nixpkgs, home-manager, NUR). |
| `configuration.nix` | Konfigurasi sistem global (bootloader, hardware, networking, system packages). |
| `home.nix` | Konfigurasi spesifik user diecko (VS Code, Python environment, XDG User Dirs). |        
| `hardware-configuration.nix` | Hasil scan hardware otomatis (file systems, kernel modules). |
                              
🛠️ Detail Teknis

  -  `Kernel`       : Menggunakan kernel Linux versi terbaru (linuxPackages_latest).

  -  `Audio`        : Full Pipewire setup dengan dukungan ALSA dan PulseAudio.

  -  `Shell`        : Zsh dengan tema robbyrussell dan plugin z melalui Oh-My-Zsh.

  -  `Networking`   : Firewall dimatikan untuk kelancaran layanan VPN (tun module diaktifkan).

  -  `Locale`       : Regional settings disesuaikan untuk Malaysia (ms_MY.UTF-8) dengan default sistem US English.

🚀 Cara Pemasangan

    [!CAUTION]
    Jangan menjalankan konfigurasi ini mentah-mentah tanpa menyesuaikan hardware-configuration.nix (terutama UUID disk) agar sistem Anda bisa booting.

    Clone repositori:
    Bash

    git clone https://github.com/Dicko46/nixos-config.git
    cd nixos-config

    Terapkan konfigurasi (menggunakan nama host hype7x8):
    Bash

    sudo nixos-rebuild switch --flake .#hype7x8

📦 Aplikasi yang Disertakan

  -  Development: VS Code, Micro, Vim, Python 3 (Pandas, Requests, Matplotlib).

  -  Multimedia: MPV, VLC, FFMPEG, GStreamer plugins.

  -  Social: AyuGram Desktop (Telegram client).

  -  Tools: Fastfetch, Kitty, Bat, Partition Manager, Xtreme Download Manager.

Dibuat oleh Dicko Rahmansyah