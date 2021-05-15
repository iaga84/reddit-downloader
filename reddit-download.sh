#!/bin/bash

set -euo pipefail

echo "client_id = $CLIENT_ID" >> /root/.config/bdfr/default_config.cfg
echo "client_secret = $CLIENT_SECRET" >> /root/.config/bdfr/default_config.cfg
echo "user_token = $USER_TOKEN" >> /root/.config/bdfr/default_config.cfg
python3 -m bdfr download /downloads --user me --upvoted --authenticate --no-dupes --search-existing --file-scheme '{POSTID}_{TITLE}' -L 1000