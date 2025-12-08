#!/bin/sh
set -e

mkdir -p /var/lib/grafana/dashboards

echo "Downloading dashboards..."

while IFS=":" read -r id revision; do
  if [ -n "$id" ]; then
    echo "- Downloading $id revision $revision"
    curl -sSL \
      "https://grafana.com/api/dashboards/$id/revisions/$revision/download" \
      -o "/var/lib/grafana/dashboards/${id}.json"
  fi
done < /etc/grafana/dashboard-list.txt

echo "All dashboards downloaded."

exec /run.sh
