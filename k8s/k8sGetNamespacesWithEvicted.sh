#!/bin/bash


set -x

kubectl get pod -A | grep Evicted | awk '{print $1}' | awk '!seen[$0]++'