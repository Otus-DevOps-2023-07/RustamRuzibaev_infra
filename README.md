# RustamRuzibaev_infra
RustamRuzibaev Infra repository
## Homework №3 cloud-bastion
Для подключения к someinternalhost в одну команду нужно использовать опцию "-J" (jump):\
ssh -J appuser@158.160.122.158 appuser@10.128.0.7\
158.160.122.158 - внешний IP-адрес bastion\
10.128.0.7 - внутренний IP-адрес someinternalhost\
Для подключения к someinternalhost c помощью команды "ssh someinternalhost" нужно описать подключение через ProxyJump для someinternalhost. Для этого в файл ~/.ssh/config надо добавить следующие строки:\
Host bastion
  Hostname 158.160.122.158
  ForwardAgent yes
  User appuser
  IdentityFile /home/ram/.ssh/appuser
Host someinternalhost
  Hostname 10.128.0.7
  ProxyJump bastion
  User appuser


bastion_IP = 158.160.122.158
someinternalhost_IP = 10.128.0.7
