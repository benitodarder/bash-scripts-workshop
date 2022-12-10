#!/bin/bash

set -x 

mvn org.jacoco:jacoco-maven-plugin:prepare-agent  org.jacoco:jacoco-maven-plugin:report
 
