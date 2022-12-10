#!/bin/bash


mvn sonar:sonar -Dsonar.coverage.jacoco.xmlReportPaths=./target/site/jacoco/jacoco.xml -Dsonar.exclusions=**/test/** "$@"
