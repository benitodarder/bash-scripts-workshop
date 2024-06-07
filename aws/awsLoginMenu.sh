#!/bin/bash
# Requires Bash 4 due to the associative array usage.
declare -A MENU_OPTIONS

IFS_BAK=${IFS}
IFS="
"
PROFILES=$(cat ~/.aws/config | grep -P "\[profile (.*)\]" | cut -d "]" -f 1)
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
echo " "
echo "Please select one and press enter."
read SELECTION
if [ $SELECTION -ge 0 ] && [ $SELECTION -lt ${#MENU_OPTIONS[@]} ]; then
  if type yawsso > /dev/null; then
    set -x
    yawsso login --profile ${MENU_OPTIONS[$SELECTION]}
    set +x
  else
    set -x
    aws login sso --profile ${MENU_OPTIONS[$SELECTION]}
    set +x
  fi
else
  declare -i KEYS=${#MENU_OPTIONS[@]} ONE=1 MAX_INDEX=KEYS-1
  echo "Invalid selection: "$SELECTION". Please choose between: 0 and "$MAX_INDEX
fi