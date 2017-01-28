if [ "$#" == 0 ] || [ "$#" -gt 2 ]; then
   echo "usage:   openshift-logs.sh <component> <application's name>"
   echo "example: openshift.logs.sh database second"
   exit 1
fi
POD=$(oc get pods --selector="component=${1},application=${2}" -o jsonpath="{..metadata.name}")
if [ -n "${POD}" ]; then
   oc logs --follow ${POD} --namespace ${2}
else 
  echo "### NO PODS SELECTED: Component:"${1}" Application:"${2}
fi
