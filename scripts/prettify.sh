#!/bin/sh
tsfiles=$(git diff --cached --name-only --diff-filter=ACM "*.ts" "*.tsx" | tr '\n' ' ')
[ -z "$tsfiles" ] && exit 0

# Prettify all staged .js files
echo "$tsfiles" | xargs ./node_modules/.bin/prettier --write

# Add back the modified/prettified files to staging
echo "$tsfiles" | xargs git add

exit 0
