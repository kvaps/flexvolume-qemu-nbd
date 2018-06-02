#!/bin/sh

set -o errexit

VENDOR=kvaps
DRIVER=sheepdog-iscsi

# Install driver
driver_dir=$VENDOR${VENDOR:+"~"}${DRIVER}
mkdir -p "/flexmnt/$driver_dir"

for file in "$(which jq)" /$DRIVER; do
    cp "$file" "/flexmnt/$driver_dir/.$(basename $file)"
    mv -f "/flexmnt/$driver_dir/.$(basename $file)" "/flexmnt/$driver_dir/$(basename $file)"
done

# Sleep calm
exec tail -f /dev/null
