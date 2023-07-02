#!/bin/bash

if [ "$#" -ne 6 ]; then
	echo "usage: "$0".sh <Profile, mandatory> <Namespace, mandatory> <Metric name, mandatory> <Start time: yyyy-dd-mmTHH:MM:SS, mandatory> <End time: yyyy-dd-mmTHH:MM:SS, mandatory> <Period mandatory> <Keep metric data query json: true/false. Mandatory>"
	exit 1
fi 

set -x

PROFILE=$1
shift
START_TIME=$1
shift
END_TIME=$1
shift
PERIOD=$1
shift
DIMENSION=$1
shift
KEEP_JSON=$1
shift

set +x
METRIC_DATA_QUERY=$(cat << EOF
{"MetricDataQueries": 
[{
      "Id": "kafka_tk_dvlp_BytesOutPerSec_publish_basic_rate_update",
      "MetricStat": {
          "Metric": {
              "Namespace": "AWS/Kafka",
              "MetricName": "BytesOutPerSec",
              "Dimensions": $DIMENSION
          },
          "Period": $PERIOD,
          "Stat": "Sum",
          "Unit": "Bytes/Second"
      },
      "ReturnData": true
  }
],
"StartTime": "$START_TIME",
"EndTime": "$END_TIME"
}
EOF
)

echo $METRIC_DATA_QUERY > metricDataQuery.json

set -x 

aws cloudwatch get-metric-data  --profile $PROFILE --no-cli-pager --cli-input-json file://metricDataQuery.json 

if [ "false" = "$KEEP_JSON" ]; then
    rm metricDataQuery.json
fi