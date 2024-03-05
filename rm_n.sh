#!/bin/bash

usage() {
  echo "Usage: $0 <dir> <n>" 1>&2
}

if [ "$#" -ne 2 ]; then
  usage
  exit 1
fi

dir=$1
n=$2

if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a valid directory" 1>&2
  exit 2
fi

find "$dir" -type f -size +"${n}c" -exec rm {} +

