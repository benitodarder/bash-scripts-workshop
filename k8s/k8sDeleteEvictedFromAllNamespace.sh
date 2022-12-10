#!/bin/bash


set -x

for NAMESPACE in $(./k8sGetNamespacesWithEvicted.sh); do
	./k8sDeleteEvictedFromNamespace.sh $NAMESPACE
done
