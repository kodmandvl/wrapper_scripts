# Script for get list of YC virtual machines
# Example:
# ./yc_vm_list.sh
echo
echo "LIST VM:"
echo
yc compute instance list
echo
echo "DONE."
echo