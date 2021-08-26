#!/usr/bin/bash

# Just a fun HTTP request for cat facts
FACT='/home/.logs/catfact/fact.txt'

function getFact () {
if http --check-status --timeout=2.5 HEAD https://catfact.ninja/fact &> /dev/null; then
  echo $(http https://catfact.ninja/fact | jq '.fact') > ${FACT}

while IFS= read -r line; do
  echo " "
  echo "$line"
  echo " "
done < "${FACT}"

else
    case $? in
        2) echo 'Request timed out!' ;;
        3) echo 'Unexpected HTTP 3xx Redirection!' ;;
        4) echo 'HTTP 4xx Client Error!' ;;
        5) echo 'HTTP 5xx Server Error!' ;;
        6) echo 'Exceeded --max-redirects=<n> redirects!' ;;
        *) echo 'Other Error!' ;;
    esac
fi
}

getFact