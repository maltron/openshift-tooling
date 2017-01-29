if [ "$#" == 0 ] || [ "$#" -gt 2 ]; then
   echo "usage:   openshift-rsh.sh <component> <application's name>"
   echo "example: openshift.rsh.sh database second"
   exit 1
fi
POD=$(oc get pods --selector="component=${1},application=${2}" -o jsonpath="{..metadata.name}" --namespace ${2})
if [ -n "${POD}" ]; then
   oc project ${2}
   oc rsh ${POD}
else
   echo "### NO PODS SELECTED. Component:"${1}" Application:"${2}
fi
