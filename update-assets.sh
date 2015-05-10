#!/bin/bash
set -e

copy_frontend() {
  repo="$1"
  app="$2"

  rm -rf "static/$app"
  mkdir -p "static/$app"
  cp -r tmp/"$repo"/frontend/build/prod/* "static/$app/"
}

update_repo() {
  repo="$1"

  echo "updating $repo"
  cd "$repo"

  git reset --hard
  git checkout master
  git pull
  version=$(git describe --abbrev=0 --tags)
  git checkout -B "tags/$version"

  cd ..
}

cd tmp

update_repo "homecam"

cd ..

copy_frontend "homecam" "hc"
