# The structure of the system tree file
/ (root) - Thư mục gốc, chứa toàn bộ hệ thống
├── bin/                    -> Chứa các lệnh thiết yếu cho người dùng (ls, cp, ...).
├── opt/                    -> Nơi để cài đặt các phần mềm hoặc các ứng dụng từ bên thứ ba (.zip .tar.gz).
├── sbin/                   -> Chứa các lệnh cho quản trị hệ thống (reboot, ...).
├── etc/                    -> Chứa toàn bộ file cấu hình hệ thống.
├── dev/                    -> Chứa các file đại diện cho thiết bị phần cứng.
├── proc/                   -> Chứa thông tin về các tiến trình đang chạy (ảo).
├── var/                    -> Chứa các file có dữ liệu thay đổi liên tục (logs, cache).
├── tmp/                    -> Chứa các file tạm thời (bị xóa khi khởi động lại).
├── lib/                    -> Chứa thư viện cần thiết cho các lệnh trong /bin và /sbin.
├── boot/                   -> Chứa các file cần cho quá trình khởi động hệ thống.
├── mnt/                    -> Thư mục tạm để "gắn" các ổ đĩa ngoài (USB, CD-ROM).
│
├── usr/                    -> Chứa chương trình, thư viện, tài liệu cho người dùng.
│   ├── usr/bin/            -> Chứa phần lớn các chương trình thông thường.
│   └── usr/lib/            -> Chứa thư viện cho các chương trình trong /usr/bin.
│   └── usr/share/          -> Chứa dữ liệu dùng chung (font, icon, ...).
│
└── home/                   -> "Tầng" chứa thư mục riêng của tất cả người dùng.
    └── ten_nguoi_dung/ (~) -> "Căn hộ" riêng của bạn.
        ├── Desktop/
        ├── Documents/
        ├── Downloads/
        └── .local/bin/     -> Chứa chương trình bạn tự cài.


# A few basic notes about the directory system
├── ~/                      -> Chuyển đến thư mục home dành cho người dùng
├── /                       -> Chuyển đến thư mục root của hệ thống

