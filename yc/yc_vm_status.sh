# Script for get status YC virtual machine
# 1st argument: VM name
# Example:
# ./yc_vm_status.sh mydeb11
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