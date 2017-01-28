if [ "$#" == 0 ] || [ "$#" -gt 3 ]; then
   echo "usage:   openshift-rsync.sh <component> <application's name> <target's directory>"
   echo "example: openshift.rsync.sh database second person-2.0"
   exit 1
fi
oc rsync --watch --no-perms=false --progress=false target/${3}/ $(oc get pods --selector="component=${1},application=${2}" --output jsonpath="{..metadata.name}"):/opt/java/server/as/wildfly/standalone/deployments-exploded/ROOT.war
