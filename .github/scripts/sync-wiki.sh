#!/usr/bin/env bash
set -euo pipefail

# Copy tracked docs only; never delete pages that exist only in the Wiki.
repo_root=$(git rev-parse --show-toplevel)
wiki_dir=$(cd "${1:?Usage: sync-wiki.sh WIKI_DIRECTORY}" && pwd)
cd "$repo_root"
while IFS= read -r -d '' file; do
  relative=${file#docs/}
  if [[ "$relative" == .git || "$relative" == .git/* || "$relative" == */.git/* ]]; then
    echo "Refusing Git metadata path: $file" >&2
    exit 1
  fi
  if [[ -L "$file" || ! -f "$file" ]]; then
    echo "Expected a regular documentation file: $file" >&2
    exit 1
  fi
  mkdir -p "$wiki_dir/$(dirname "$relative")"
  cp -- "$file" "$wiki_dir/$relative"
done < <(git ls-files -z -- docs/)

git -C "$wiki_dir" add --all
if git -C "$wiki_dir" diff --cached --quiet; then
  echo "Wiki already up to date."
  exit 0
fi
git -C "$wiki_dir" -c user.name='github-actions[bot]' \
  -c user.email='41898282+github-actions[bot]@users.noreply.github.com' \
  commit -m "Sync docs from ${GITHUB_REPOSITORY:-repository}@$(git rev-parse --short HEAD)"
git -C "$wiki_dir" push origin HEAD
local_head=$(git -C "$wiki_dir" rev-parse HEAD)
remote_head=$(git -C "$wiki_dir" ls-remote origin HEAD | cut -f1)
[[ "$local_head" == "$remote_head" ]] || {
  echo 'Wiki changed during publication; inspect the remote before retrying.' >&2
  exit 1
}
echo "Verified Wiki publication: $local_head"
