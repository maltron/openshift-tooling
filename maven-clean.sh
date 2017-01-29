for pomfile in $(find ${1} -name "pom.xml"); do mvn --file ${pomfile} clean; done
