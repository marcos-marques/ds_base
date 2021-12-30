#!/bin/bash

PROJECT_DIR="$(dirname $0)/../.."

. "$PROJECT_DIR/.env"
. "$PROJECT_DIR/config/$ENVIRONMENT/.env"

if [ "$1" = 'jupyter' ]; then
  if [ -n "$JUPYTER_THEME" ]; then
    jt -t $JUPYTER_THEME
  else
    jt -r
  fi

  jupyter lab --ip=0.0.0.0 --port=$JUPYTER_PORT --allow-root \
                                --NotebookApp.notebook_dir='./notebooks' \
                                --NotebookApp.token='' \
                                --NotebookApp.password=''
fi