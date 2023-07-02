#!/bin/bash

if [ "$#" -lt 6 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Namespace, mandatory> <Metric name, mandatory> <Start time: yyyy-dd-mmTHH:MM:SS, mandatory> <End time: yyyy-dd-mmTHH:MM:SS, mandatory> <Period mandatory> <Optional arguments>"
	exit 1
fi 

set -x

PROFILE=$1
shift
NAMESPACE=$1
shift
METRIC_NAME=$1
shift
START_TIME=$1
shift
END_TIME=$1
shift
PERIOD=$1
shift

aws cloudwatch get-metric-statistics  --profile $PROFILE --namespace $NAMESPACE --no-cli-pager --start-time $START_TIME --end-time $END_TIME --period $PERIOD --metric-name $METRIC_NAME --statistics Sum "$@"