#!/bin/bash

PYTHONPATH="/usr/local/lib/python3.9:/usr/local/lib/python3.9/lib-dynload:/usr/local/lib/python3.9/site-packages:$PYTHONPATH"
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export PYTHONPATH
export PATH

set -euo pipefail
pip install -U pip setuptools ffmpeg bdfr

python3 -m bdfr download /downloads \
  --user me \
  --upvoted \
  --authenticate \
  --no-dupes \
  --file-scheme '{POSTID}_{TITLE}' \
  -L 1000 \
  --skip-domain 'youtu.be' \
  --skip-domain 'youtube.com' \
  --skip-domain 'www.youtube.com' \

date >> /var/log/cron.log

