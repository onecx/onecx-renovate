# Tools Scripts

This folder contains helper scripts that generate a quick GitHub Actions health report for selected OneCX repositories.

## What The Check Scripts Do

All check scripts follow the same flow:

1. List repositories in the onecx GitHub organization.
2. Filter repositories by script-specific naming rules.
3. Query the latest workflow run on branch main.
4. Print a table with:
   - REPO: repository name
   - STATUS: workflow run status (for example, queued, in_progress, completed)
   - RESULT: workflow conclusion (for example, success, failure, cancelled)
   - UPDATED: last update timestamp of the run
5. If no run exists, print no-run with placeholder values.

## Scripts

### check-backend.sh

Purpose:
- Reports CI status for backend-related OneCX repositories.

Included repository patterns:
- onecx/*-bff
- onecx/*-svc
- onecx/*-operator
- onecx/*-legacy
- onecx/onecx-test-oidc
- onecx/onecx-db-check

### check-ui.sh

Purpose:
- Reports CI status for UI repositories.

Included repository patterns:
- onecx/*-ui

Excluded repository patterns:
- onecx/docs-*

## Prerequisites

- GitHub CLI installed (gh)
- jq installed
- Authenticated GitHub CLI session with access to onecx org

Example login:

	gh auth login

## How To Run

From the repository:

	./check-backend.sh
	./check-ui.sh

## Notes For Developers

- Both scripts currently query only branch main.
- Both scripts request only the most recent workflow run (per_page=1).
- Repository filtering is implemented in the is_target_repo function in each script.
