for buildfile in $(find ${1} -name "build.xml"); do ant -f ${buildfile} clean; done
