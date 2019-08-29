cd /home/`whoami`/TPM/mods/yolo
port=`cat port.txt`
if [ "$?" == "0" ];
then
    echo "    - [PORT]: $port"
else
    echo "Oh no... unable to configure..."
    echo "Running configure script now";
    bash config.sh;
    port=`cat port.txt`
fi
cd /home/`whoami`/TPM/mods/yolo
priv=`cat priv.txt`
if [ "$?" == "0" ];
then
    echo "    - [PRIV]: $priv"
else
    echo "Oh no... unable to configure..."
    echo "Running configure script now";
    bash config.sh;
    priv=`cat priv.txt`
fi
cd /home/`whoami`/TPM/mods/yolo/node
echo "    - [node] Starting...";
screen -dm node index.js "$port" "`whoami`" $priv
