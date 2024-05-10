# Project GDPT THANH SON
# PNGR Stack 🏓
[![Build](https://github.com/karlkeefer/pngr/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/karlkeefer/pngr/actions/workflows/build.yml)

Dockerized (postgres + nginx + golang + react) starter kit

Customized for GDPT purposes

## Clone
[Link to clone](https://github.com/ThiVietTran/gdpt.git)

## Installation
Trước khi chạy mới cần theo các bước sau:

1. Dọn dẹp sạch sẽ docker container bằng cách chạy
    ```bash
    chmod +x delete_images.sh
    ./delete_images.sh
    ```

2. Sau đó tải lại toàn bộ container bằng cách chạy lệnh:
    ```bash
    sudo docker compose up
    ```

3. Đợi cho nó chạy xong, mở một cửa sổ terminal khác chạy lệnh:
    ```bash
    sudo docker ps
    ```
    - Nội dung tương tự như sau:
    ```
    CONTAINER ID   IMAGE           COMMAND                  CREATED       STATUS          PORTS                                               NAMES
    5d207a1f82d7   gdpt-nginx      "/docker-entrypoint.…"   2 hours ago   Up 14 seconds   80/tcp, 0.0.0.0:4500->4500/tcp, :::4500->4500/tcp   gdpt-nginx-1
    dbc266e1a326   gdpt-worker     "/bin/sh -c 'modd -f…"   2 hours ago   Up 15 seconds                                                       gdpt-worker-1
    9addf161d7d6   gdpt-golang     "/bin/sh -c 'modd -f…"   2 hours ago   Up 15 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp           gdpt-golang-1
    ad0ec138493b   gdpt-postgres   "docker-entrypoint.s…"   2 hours ago   Up 15 seconds   5432/tcp                                            gdpt-postgres-1
    e9dc09dfe476   gdpt-react      "docker-entrypoint.s…"   2 hours ago   Up 15 seconds   0.0.0.0:3000->3000/tcp, :::3000->3000/tcp           gdpt-react-1
    ```
    ở đây ta thấy ID container của gdpt-postgres là ad0ec138493b

4. Chạy lệnh sau ngay chỗ có file "tracnghiem_backup.sql"
    ```bash
    cat tracnghiem_backup.sql | sudo docker exec -i ad0ec138493b psql -U huyanh -d tracnghiem
    ```

5. sau đó mở 
    http://localhost:4500

6. Để tương tác, nhớ là khi đăng ký nhớ bấm link kích hoạt ở dưới terminal
