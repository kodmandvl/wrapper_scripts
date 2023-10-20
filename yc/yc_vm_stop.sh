# Script for stop YC virtual machine
# 1st argument: VM name
# Example:
# ./yc_vm_stop.sh mydeb11
echo
echo "STOP $1 VM..."
echo
yc compute instance stop --name $1 --async
echo
sleep 5
echo
echo "LIST VM:"
echo
yc compute instance list
echo
echo "THIS VM:"
echo
yc compute instance list | grep $1
echo
echo "DONE."
echo