# Script for creating YC virtual machine (100% core-fraction, non-preemptible)
# 1st argument (mandatory): VM name
# 2nd argument (mandatory): OS image family (debian-11, centos-7, almalinux-8, fedora-35, ubuntu-2204-lts, etc)
# 3rd argument (mandatory): yaml file with metadata (users and public SSH keys)
# 4th argument (optional): CPUs (default: 2)
# 5th argument (optional): RAM in GB (default: 8)
# 6th argument (optional): size of boot-disk in GB (default: 32)
# 7th argument (optional): type of boot-disk (ssd or hdd, default: ssd)
# Examples:
# ./yc_vm_create_new.sh mydeb11 debian-11 ./users.yaml 2 8 32 ssd
# ./yc_vm_create_new.sh myalma8 almalinux-8 ./users.yaml
# ./yc_vm_create_new.sh myubuntu ubuntu-2204-lts ./users.yaml
# ./yc_vm_create_new.sh myubuntu2004 ubuntu-2004-lts ./users.yaml - - - hdd
# ./yc_vm_create_new.sh mycentos7 centos-7 ./users.yaml 2 2 32 hdd
# ./yc_vm_create_new.sh myfedora fedora-35 ./users.yaml 4 16 64 hdd
# ATTENTION! Before run this script you should set correct values for other parameters in script: user data from users.yaml file, subnet-name, zone, etc.
VMNAME=${1}
VMIMAGE=${2}
USERSFILE=${3}
CPUS=${4}
RAMGB=${5}
DISKSIZE=${6}
DISKTYPE=${7}
if [[ "${4}" == "" ]] || [[ "${4}" == "-" ]]; then
CPUS=2
fi
if [[ "${5}" == "" ]] || [[ "${5}" == "-" ]]; then
RAMGB=8
fi
if [[ "${6}" == "" ]] || [[ "${6}" == "-" ]]; then
DISKSIZE=32
fi
if [[ "${7}" == "" ]] || [[ "${7}" == "-" ]]; then
DISKTYPE="ssd"
fi
echo
echo "Creating ${VMNAME} VM on ${VMIMAGE} image after 5 seconds..."
echo "(user data from ${USERSFILE} file, ${CPUS} CPUs, ${RAMGB} GB RAM, ${DISKSIZE} GB disk size, ${DISKTYPE} disk type)"
echo
sleep 5
yc compute instance create \
      --name ${VMNAME} \
      --zone ru-central1-a \
      --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
      --create-boot-disk type=network-${DISKTYPE},size=${DISKSIZE},image-folder-id=standard-images,image-family=${VMIMAGE} \
      --description My_${VMNAME}_VM_on_${VMIMAGE} \
      --metadata-from-file user-data=${USERSFILE} \
      --memory ${RAMGB}GB \
      --cores ${CPUS} \
      --core-fraction 100 \
      --platform standard-v3 \
      # end of creating
echo
echo "LIST VM:"
echo
yc compute instance list
echo
echo "THIS VM:"
echo
yc compute instance list | grep ${VMNAME}
echo
echo "DONE."
echo
