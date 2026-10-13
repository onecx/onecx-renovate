ORG="onecx"
APP="${1:?Usage: $0 <APP>}"
ID="${2:?Usage: $0 <APP> <ID>}"

gh run rerun  --repo "$ORG/$APP" $ID