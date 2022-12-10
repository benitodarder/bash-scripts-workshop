#!/bin/bash

mvn test

mvn org.jacoco:jacoco-maven-plugin:prepare-agent  org.jacoco:jacoco-maven-plugin:report

mvn sonar:sonar -Dsonar.coverage.jacoco.xmlReportPaths=./target/site/jacoco/jacoco.xml -Dsonar.exclusions=**/test/** "$@"
