#!/bin/bash

kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}{","}{.metadata.name}{","}{.spec.containers[].resources.requests.cpu}{","}{.spec.containers[].resources.requests.memory}{","}{.spec.containers[].resources.limits.cpu}{","}{.spec.containers[].resources.limits.memory}{"\n"}{end}'
