#!/bin/bash
# Requires Bash 4 due to the associative array usage.
declare -A MENU_OPTIONS

IFS_BAK=${IFS}
IFS="
"
PROFILES=$(cat ~/.aws/credentials | grep -P "\[(.*)\]" | cut -d "]" -f 1 | cut -d "[" -f 2)
IFS=${IFS_BAK}

ITER=0
for PROFILE in $PROFILES; do
  if [ "$PROFILE" != "[profile" ]; then 
    MENU_OPTIONS[$ITER]="$PROFILE"
    ((ITER++))
  fi
done

echo "Available profiles:"
echo " "
for KEY in $(echo "${!MENU_OPTIONS[@]}" | tr ' ' '\n' | sort -n); do
    VALUE="${MENU_OPTIONS[$KEY]}"
    echo "$KEY - $VALUE"
done
