#!/bin/bash

export JAVA_HOME="C:\Portables\jdk-11"

echo "JAVA_HOME="$JAVA_HOME

set -x 

mvn spring-boot:run
