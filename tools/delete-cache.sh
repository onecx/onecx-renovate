ORG="onecx"
APP="${1:?Usage: $0 <APP>}"

gh cache delete --all --repo "$ORG/$APP"