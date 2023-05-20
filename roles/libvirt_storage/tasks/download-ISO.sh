#!/bin/bash -x
# download rhel-baseos-9.0-x86_64-dvd.iso

# prereq
# dnf install curl
# dnf install jq

# set the offline token and checksum parameters
# https://access.redhat.com/management/api > Generate Token
# They will expire after 30 days of inactivity.
offline_token="eyJhb ...(huge string)... 4KGBpZhQ"
 # checksum copied from https://access.redhat.com/downloads/content/479/ver=/rhel---9/9.0/x86_64/product-software
checksum=c6942e3ed65947ed48c30589d9c1a752e96c5b94ee8de1923331449fee162cc1

# get an access token
access_token=$(curl https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token -d grant_type=refresh_token -d client_id=rhsm-api -d refresh_token=$offline_token | jq -r '.access_token')

# get the filename and download url
image=$(curl -H "Authorization: Bearer $access_token" "https://api.access.redhat.com/management/v1/images/$checksum/download")
filename=$(echo $image | jq -r .body.filename)
url=$(echo $image | jq -r .body.href)

# download the file
curl $url -o $filename

