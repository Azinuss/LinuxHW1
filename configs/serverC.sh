#!/bin/bash
ip link add macvlan1 link eth0 type macvlan mode bridge # создаем новый адаптер с типом bridge и делаем связь адаптера с eth0 
ip address add dev macvlan1 192.168.2.10/24 # добавляем ip адрес адаптеру
ip link set macvlan1 up # включаем адаптер
#ip route add <subnet A vm>/<mask> via <gateway ip B vm>
ip route add 192.168.1.0/24 via 192.168.2.1

curl 'http://192.168.1.10:5000/'