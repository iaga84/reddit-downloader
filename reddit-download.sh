#!/bin/bash

set -euo pipefail
pip install -U bdfr

if ! grep -q user_token "/root/.config/bdfr/default_config.cfg"; then
  echo "client_id = $CLIENT_ID" >> /root/.config/bdfr/default_config.cfg
  echo "client_secret = $CLIENT_SECRET" >> /root/.config/bdfr/default_config.cfg
  echo "user_token = $USER_TOKEN" >> /root/.config/bdfr/default_config.cfg
fi

python3 -m bdfr download /downloads \
  --user me \
  --upvoted \
  --authenticate \
  --no-dupes \
  --search-existing \
  --file-scheme '{POSTID}_{TITLE}' \
  -L 100 \
  --skip-domain 'youtube.com' \
  --skip-domain 'www.youtube.com' \
  --skip-domain 'polygon.com' \
  --exclude-id 'mohgr6'
