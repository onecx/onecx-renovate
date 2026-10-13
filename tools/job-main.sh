ORG="onecx"
APP="${1:?Usage: $0 <APP>}"

gh run list --branch main -w Build --limit 3 --repo "$ORG/$APP"