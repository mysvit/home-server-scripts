#!/usr/bin/env sh
set -eux
#parce arguments
xargs=$(which gxargs || which xargs)
CONFIG=$@
for line in $CONFIG; do
  eval "$line"
done

if [ $# -lt 4 ] ;then
    echo "Usage: token=<git_token> repo=<org/repo> tag=<tag or 'latest'> filename=<filename>"
    exit 1
fi

# Define variables.
AUTH="Authorization: Bearer $token"
REPO="${repo}"
TAG=${tag}                        # tag name or the word "latest"
FILE="${filename}"                # the name of your release asset file, e.g. build.tar.gz
GITHUB_API_ENDPOINT="api.github.com"

if [ "$TAG" = "latest" ]; then
  # Github should return the latest release first.
  PARSER=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  PARSER=". | map(select(.tag_name == \"$TAG\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi

RESPONSE=`curl -sL -H "$AUTH" -H "Accept: application/vnd.github.v3.raw" https://$GITHUB_API_ENDPOINT/repos/$REPO/releases`

# echo "Response: $RESPONSE"

ASSET_ID=`echo "$RESPONSE" | jq "$PARSER"`

# echo "Asset ID: $ASSET_ID"

if [ "$ASSET_ID" = "null" ]; then
  errcho "ERROR: version not found $VERSION"
  exit 1
fi

# echo "Getting asset $ASSET_ID"

curl -sL -H "$AUTH" -H "Accept: application/octet-stream" https://api.github.com/repos/$REPO/releases/assets/$ASSET_ID  --output $FILE
