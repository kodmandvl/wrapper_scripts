# Script to backup resources (manifests) from cluster.
# 1st arg: namespace
# 2nd arg: resource kind
# 3rd arg: backup directory
# Example:
# k8s_resources_backup.sh mynamespace statefulsets.apps ~/work/backup
export NS=${1}
export KIND=${2}
export DIR=${3}
echo
echo "BACKUP ${KIND} IN ${NS} NAMESPACE TO ${DIR}/${NS}/${KIND} DIRECTORY:"
echo
mkdir -pv ${DIR}/${NS}/${KIND}
echo
echo "CREATE RESOURCES LIST FILE:"
echo
kubectl get -n ${NS} ${KIND} | awk '{ print $1 }' | grep -v ^NAME > ${DIR}/${NS}/${KIND}_list && echo "${KIND}_list FILE OK"
echo
echo "CREATE RESOURCES BACKUP:"
echo
FILE=${DIR}/${NS}/${KIND}_list
while read LINE;
do
RESOURCE=`echo $LINE | cut -f1 -d" "`
kubectl get -n ${NS} ${KIND}/${RESOURCE} -oyaml > ${DIR}/${NS}/${KIND}/${RESOURCE}.yaml && echo "${RESOURCE} BACKUP OK"
done < $FILE
echo
echo DONE.
echo