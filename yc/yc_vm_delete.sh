# Script for delete YC virtual machine
# 1st argument: VM name
# Example:
# ./yc_vm_delete.sh mydeb11
echo
echo "DELETE $1 VM..."
echo
yc compute instance delete --name $1 --async
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