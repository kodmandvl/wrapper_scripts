# Script for creating YC virtual machine for testing and education with low-cost parameters (20% core-fraction, HDD disk-type, 32GB HDD, preemptible, etc)
# 1st argument: VM name
# 2nd argument: OS image family (debian-11, centos-7, almalinux-8, fedora-35, ubuntu-2204-lts, etc)
# 3rd argument: file with metadata (users and public SSH keys)
# Examples:
# ./yc_vm_create.sh mydeb11 debian-11 ./users.yaml
# ./yc_vm_create.sh myalma8 almalinux-8 ./users.yaml
# ./yc_vm_create.sh myubuntu ubuntu-2204-lts ./users.yaml
# ./yc_vm_create.sh mycentos7 centos-7 ./users.yaml
# ./yc_vm_create.sh myfedora fedora-35 ./users.yaml
# ATTENTION! Before run this script you should set correct values for other parameters in script: user data from users.yaml file, subnet-name, zone, etc.
echo
echo "CREATING $1 VM ON $2 AFTER 5 SECONDS..."
echo
sleep 5
yc compute instance create \
      --name $1 \
      --zone ru-central1-a \
      --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
      --create-boot-disk type=network-hdd,size=32,image-folder-id=standard-images,image-family=$2 \
      --description My_$1_VM_on_$2 \
      --metadata-from-file user-data=$3 \
      --memory 8GB \
      --cores 4 \
      --core-fraction 20 \
      --platform standard-v3 \
      --preemptible \
      # end of creating
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
