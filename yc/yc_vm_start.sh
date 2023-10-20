# Script for start YC virtual machine
# 1st argument: VM name
# Example:
# ./yc_vm_start.sh mydeb11
echo
echo "START $1 VM..."
echo
yc compute instance start --name $1 --async
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