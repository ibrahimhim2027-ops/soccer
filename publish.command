#!/bin/bash
# Double-click this file to put your latest changes on the website.
cd "$(dirname "$0")" || exit 1

echo "Publishing your site..."
echo

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "No GitHub repository is connected yet."
  echo "Create one at github.com, then run:"
  echo "   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git"
  echo
  read -n 1 -s -r -p "Press any key to close."
  exit 1
fi

# GitHub rejects any single file over 100 MB, and video is the only
# thing here likely to cross that line. Catch it before the upload.
# Only files git would actually send are checked, so the gitignored
# originals in the year folders are correctly left alone. Reading
# null separated names keeps filenames with spaces intact.
big=""
while IFS= read -r -d '' f; do
  [ -f "$f" ] || continue
  sz=$(stat -f%z "$f" 2>/dev/null || echo 0)
  if [ "$sz" -gt 94371840 ]; then
    big="${big}   $(du -h "$f" | cut -f1)  ${f}"$'\n'
  fi
done < <(git ls-files -co --exclude-standard -z)

if [ -n "$big" ]; then
  echo "STOP. These files are too big for GitHub, which caps a single"
  echo "file at 100 MB:"
  echo
  printf '%s' "$big"
  echo
  echo "Compress them first, for example:"
  echo "   avconvert --source big.mp4 --output smaller.mp4 --preset Preset1280x720"
  echo
  read -n 1 -s -r -p "Press any key to close."
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing has changed since the last publish."
  echo
  read -n 1 -s -r -p "Press any key to close."
  exit 0
fi

echo "Changed files:"
git status --short
echo

git add -A
git commit -q -m "Site update $(date '+%b %d, %Y at %-I:%M %p')"

if git push -q origin HEAD 2>/dev/null; then
  echo "Done. Your site will be live in about a minute."
  url=$(git remote get-url origin | sed -E 's#.*github.com[:/]([^/]+)/(.+?)(\.git)?$#https://\1.github.io/\2/#')
  echo "$url"
else
  echo "The upload failed. Usually that means GitHub needs you to sign in."
  echo "Opening GitHub Desktop is the easiest fix."
fi

echo
read -n 1 -s -r -p "Press any key to close."
