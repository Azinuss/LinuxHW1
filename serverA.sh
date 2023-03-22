#!/bin/bash
ip link add macvlan1 link eth0 type macvlan mode bridge # создаем новый адаптер с типом bridge и делаем связь адаптера с eth0 
ip address add dev macvlan1 192.168.1.10/24 # добавляем ip адрес адаптеру
ip link set macvlan1 up # включаем адаптер
#ip route add <subnet A vm>/<mask> via <gateway ip B vm>
ip route add 192.168.2.0/24 via 192.168.1.1
pip install flask

cat > app.py << EOF
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

app.run(host='0.0.0.0', port=5000)
EOF

python3 app.py