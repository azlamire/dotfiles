{ config, pkgs, ...  }:

{
  services.nginx = {
    enable = false;
    
    config = ''
      worker_processes 1;

      events {
        worker_connections 1024;
      }

      rtmp {
        server {
          listen 1935;
          chunk_size 4096;

          application live {
            live on;
            allow publish all;
            hls on;
            hls_path /tmp/hls;
            hls_fragment 1s;
            hls_nested on;
          }
        }
      }

      http {
        include ${pkgs.nginx}/conf/mime.types;
        default_type application/octet-stream;

        server {
          listen 80;
          server_name localhost;
          add_header Access-Control-Allow-Origin *;
          
          location /hls/ {
            types {
              application/vnd.apple.mpegurl m3u8;
              video/mp2t ts;
            } 
            alias /tmp/hls/;
            expires -1;
          }
        }

        server {
          listen 81;
          server_name localhost;
          
          location / {
            root /usr/src/nginx/docs/html;
            index index.html index.htm;
          }
        }
      }
    '';
  };

  systemd.tmpfiles.rules = [
    "d /tmp/hls 0777 nginx nginx - "
  ];
}
