Задание 1
    https://hub.docker.com/repository/docker/olegmanzhay/custom-nginx/general

Задание 2
    date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html
    08-12-2025 15:47:04.112849844 +05
    CONTAINER ID   IMAGE                            COMMAND                  CREATED         STATUS         PORTS                                     NAMES
    97fd7015adac   olegmanzhay/custom-nginx:1.0.0   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   custom-nginx-t2
    172.17.0.1 - - [08/Dec/2025:10:45:01 +0000] "GET / HTTP/1.1" 200 170 "-" "curl/8.5.0" "-"
    PCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0
    PSJVVEYtOCI+CiAgICA8dGl0bGU+SGV5LCBOZXRvbG9neTwvdGl0bGU+CjwvaGVhZD4KPGJvZHk+
    CiAgICA8aDE+SSB3aWxsIGJlIERldk9wcyBFbmdpbmVlciE8L2gxPgo8L2JvZHk+CjwvaHRtbD4=
    admin-oleg@admin-oleg-VMware-Virtual-Platform:/etc/docker$ curl localhost:8080
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Hey, Netology</title>
    </head>
    <body>
        <h1>I will be DevOps Engineer!</h1>
    </body>
    </html>

Задание 3

Выполните docker ps -a и объясните своими словами почему контейнер остановился. (так как мы находимся внутри контейнера, выполняем команду ctrl+c - является сигналом приложению завершить процесс)
docker exec -it custom-nginx-t2 /bin/bash - Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
Проблема может заключаться в следующем:

    Измененный порт (81) не опубликован извне. По умолчанию, если  менятся внутренний порт приложения,
    это изменение должно сопровождаться изменением настроек публикации портов Docker. 
    То есть нужно добавить флаг --publish 81:81 при запуске контейнера либо изменить настройки сети вручную.
    Порт 8080 мог остаться открытым, поскольку изначально использовался как публичный порт, 
    однако страница приветствия больше не доступна на нём после смены внутреннего порта Nginx.
docker rm custom-nginx-t2 -f - удаление через force

Задание 4
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology$ docker exec -it centos bash
[root@426bf478d278 /]# cd data
[root@426bf478d278 data]# ls -la
total 24
drwxrwxr-x 6 1000 1000 4096 Dec  8 09:34 .
drwxr-xr-x 1 root root 4096 Dec  9 09:16 ..
drwxrwxr-x 8 1000 1000 4096 Dec  5 14:37 .git
drwxrwxr-x 2 1000 1000 4096 Dec  5 14:33 1-virtualization
drwxrwxr-x 2 1000 1000 4096 Dec  9 09:04 3-docker
drwxrwxr-x 2 1000 1000 4096 Dec  8 10:53 4-docker-compose
[root@426bf478d278 data]# touch 1.txt
[root@426bf478d278 data]# exit
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology$ docker ps
CONTAINER ID   IMAGE           COMMAND            CREATED         STATUS         PORTS     NAMES
426bf478d278   centos:8        "sleep infinity"   2 minutes ago   Up 2 minutes             centos
9167563eaf57   debian:latest   "sleep infinity"   2 minutes ago   Up 2 minutes             debian
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology$ docker exec -it debian bash
root@9167563eaf57:/# cd data
root@9167563eaf57:/data# ls -la
total 24
drwxrwxr-x 6 1000 1000 4096 Dec  9 09:18 .
drwxr-xr-x 1 root root 4096 Dec  9 09:16 ..
drwxrwxr-x 8 1000 1000 4096 Dec  5 14:37 .git
drwxrwxr-x 2 1000 1000 4096 Dec  5 14:33 1-virtualization
-rw-r--r-- 1 root root    0 Dec  9 09:18 1.txt
-rw-r--r-- 1 1000 1000    0 Dec  9 09:18 2.txt
drwxrwxr-x 2 1000 1000 4096 Dec  9 09:04 3-docker
drwxrwxr-x 2 1000 1000 4096 Dec  8 10:53 4-docker-compose

Задание 5

admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker compose up -d
WARN[0000] Found multiple config files with supported names: /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml, /home/admin-oleg/Desktop/Netology/4-docker-compose/docker-compose.yaml 
WARN[0000] Using /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml 
WARN[0000] /home/admin-oleg/Desktop/Netology/4-docker-compose/docker-compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
WARN[0000] /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 9/9
 ✔ Image registry:2                 Pulled                                                                                                                                       7.2s 
 ✔ Network 4-docker-compose_default Created                                                                                                                                      0.0s 
 ✔ Container 4-docker-compose-portainer-1 Created                                                                                                                                0.1s 
 ✔ Container 4-docker-compose-registry-1 Created                                                                                                                                 0.1s 
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker ps 
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                                         NAMES
87241ec5e6c0   portainer/portainer-ce:latest   "/portainer"             31 seconds ago   Up 31 seconds                                                 4-docker-compose-portainer-1
4bb7854053de   registry:2                      "/entrypoint.sh /etc…"   31 seconds ago   Up 31 seconds   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   4-docker-compose-registry-1

admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker compose up -d
WARN[0000] Found multiple config files with supported names: /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml, /home/admin-oleg/Desktop/Netology/4-docker-compose/docker-compose.yaml 
WARN[0000] Using /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml 
WARN[0000] /home/admin-oleg/Desktop/Netology/4-docker-compose/docker-compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
WARN[0000] /home/admin-oleg/Desktop/Netology/4-docker-compose/compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 9/9
 ✔ Image registry:2                 Pulled                                                                                                                                       7.2s 
 ✔ Network 4-docker-compose_default Created                                                                                                                                      0.0s 
 ✔ Container 4-docker-compose-portainer-1 Created                                                                                                                                0.1s 
 ✔ Container 4-docker-compose-registry-1 Created                                                                                                                                 0.1s 
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker ps 
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                                         NAMES
87241ec5e6c0   portainer/portainer-ce:latest   "/portainer"             31 seconds ago   Up 31 seconds                                                 4-docker-compose-portainer-1
4bb7854053de   registry:2                      "/entrypoint.sh /etc…"   31 seconds ago   Up 31 seconds   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   4-docker-compose-registry-1

admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker tag custom-nginx:1.0.0 localhost:5000/custom-nginx:latest
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker images
                                                                                                                                                                  i Info →   U  In Use
IMAGE                                         ID             DISK USAGE   CONTENT SIZE   EXTRA
centos:8                                      5d0da3dc9764        231MB             0B        
custom-nginx:1.0.0                            e05725aaa93e        192MB             0B        
debian:latest                                 910a89191f05        120MB             0B        
gcr.io/k8s-minikube/kicbase:v0.0.48           c6b5532e987b       1.31GB             0B        
localhost:5000/custom-nginx:latest            e05725aaa93e        192MB             0B        
olegmanzhay/custom-nginx/custom-nginx:1.0.0   e05725aaa93e        192MB             0B        
olegmanzhay/custom-nginx:1.0.0                e05725aaa93e        192MB             0B        
portainer/portainer-ce:latest                 9bde3c70195f        186MB             0B    U   
registry:2                                    26b2eb03618e       25.4MB             0B    U   
registry:3                                    e4e570676819       57.7MB             0B    U   
admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker push localhost:5000/custom-nginx:latest
The push refers to repository [localhost:5000/custom-nginx]
21ad78a92a53: Pushed 
2e174fd56089: Pushed 
727839498dfa: Pushed 
508937af8963: Pushed 
e9b5d470f331: Pushed 
5e1b8f458cec: Pushed 
d89e58119fc7: Pushed 
eb5f13bce993: Pushed 
latest: digest: sha256:a4ad64fbd9a6d05f9d34a4ea538b71ebc9e320e359ea104518282f8204860ae6 size: 1985

admin-oleg@admin-oleg-VMware-Virtual-Platform:~/Desktop/Netology/4-docker-compose$ docker images localhost:5000/custom-nginx
                                                                                                                                                                  i Info →   U  In Use
IMAGE                                ID             DISK USAGE   CONTENT SIZE   EXTRA
localhost:5000/custom-nginx:latest   e05725aaa93e        192MB             0B        


{
AppArmorProfile:"docker-default",
Args:[
"nginx",
"-g",
"daemon off;"
],
Config:{
AttachStderr:true,
AttachStdin:false,
AttachStdout:true,
Cmd:[
"nginx",
"-g",
"daemon off;"
],
Domainname:"",
Entrypoint:[
"/docker-entrypoint.sh"
],
Env:[
"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
"NGINX_VERSION=1.29.0",
"NJS_VERSION=0.9.0",
"NJS_RELEASE=1~bookworm",
"PKG_RELEASE=1~bookworm",
"DYNPKG_RELEASE=1~bookworm"
],
ExposedPorts:{
80/tcp:{
}
},
Hostname:"c421833e94d6",
Image:"127.0.0.1:5000/custom-nginx",
Labels:{
com.docker.compose.config-hash:"8b9fe9ab3a7934244a4cb3d97ea83abe99d1849b88a7d7931370a021dd008c42",
com.docker.compose.container-number:"1",
com.docker.compose.depends_on:"",
com.docker.compose.image:"sha256:e05725aaa93eb83573b0872b812b15f1469ce5c43e2d10329bcf2cb0177d26a3",
com.docker.compose.oneoff:"False",
com.docker.compose.project:"custom-nginx",
com.docker.compose.project.config_files:"/data/compose/1/docker-compose.yml",
com.docker.compose.project.working_dir:"/data/compose/1",
com.docker.compose.service:"nginx",
com.docker.compose.version:"",
maintainer:"NGINX Docker Maintainers <docker-maint@nginx.com>"
},
OpenStdin:false,
StdinOnce:false,
StopSignal:"SIGQUIT",
Tty:false,
User:"",
Volumes:null,
WorkingDir:""
},
Created:"2025-12-09T10:01:41.245262871Z",


WARN[0000] /home/admin-oleg/Desktop/Netology/4-docker-compose/docker-compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
WARN[0000] Found orphan containers ([4-docker-compose-portainer-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up. 

Это означает, что Docker обнаружил контейнеры ("сиротские"), которые были созданы ранее, но теперь не соответствуют текущему файлу конфигурации. Вероятно, вы удалили или переименовали сервис Portainer в вашем docker-compose.yaml, но соответствующий контейнер остался.