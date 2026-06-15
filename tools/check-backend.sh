
ORG="onecx"

is_target_repo() {
  local full_repo="$1"

  case "$full_repo" in
    onecx/*-bff|onecx/*-svc|onecx/*-operator|onecx/*-legacy|onecx/onecx-test-oidc|onecx/onecx-db-check)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

printf "%-40s %-10s %-15s %-20s\n" "REPO" "STATUS" "RESULT" "UPDATED"

for repo in $(gh repo list $ORG --limit 1000 --json name --jq '.[].name'); do
  full_repo="$ORG/$repo"

  if ! is_target_repo "$full_repo"; then
    continue
  fi
  run=$(gh api repos/$ORG/$repo/actions/runs -F branch=main -F per_page=1 --method GET --jq '.workflow_runs[0]')
  if [ -n "$run" ] && [ "$run" != "null" ]; then
    status=$(echo $run | jq -r '.status')
    conclusion=$(echo $run | jq -r '.conclusion')
    updated=$(echo $run | jq -r '.updated_at')

    printf "%-40s %-10s %-15s %-20s\n" "$repo" "$status" "$conclusion" "$updated"
  else
    printf "%-40s %-10s %-15s %-20s\n" "$repo" "no-run" "-" "-"
  fi
done
