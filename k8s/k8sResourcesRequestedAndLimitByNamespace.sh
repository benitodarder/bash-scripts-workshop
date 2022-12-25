#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage:$0 <Namespace>"
    echo "  Can set several namespaces using \| and enclousing using double quotes: \"namespace1 \| namespace2\""
    exit 1
fi

set -x

kubectl describe nodes | grep "Name:\|Resource \|cpu \|^  memory \|Namespace \|$1"
