#! /bin/bash

# Constant
RED='\033[0;31m'
OG='\033[0m'

# Script
if [ "$#" -ne 1 ]; then
    echo -e "${RED}!!! Wrong number of arguments !!! ${OG}"
    echo "Usage: ./real_address.sh <address>"
    exit 1
fi

blury_adress=$1
curl_response=$(curl -s ${blury_adress})
grep_response=$(grep -s href <<< "${curl_response}")
clear_response=$(cut -d '"' -f 2 <<< "${grep_response}") 

echo "Real adress: ${clear_response}"