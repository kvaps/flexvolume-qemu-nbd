#!/bin/sh

set -o errexit
set -o pipefail

VENDOR=kvaps
DRIVER=qemu-nbd
OLD_DRIVER=nbd

# Install driver
driver_dir=$VENDOR${VENDOR:+"~"}${DRIVER}
mkdir -p "/flexmnt/$driver_dir"
cp "/jq" "/flexmnt/$driver_dir/.jq"
mv -f "/flexmnt/$driver_dir/.jq" "/flexmnt/$driver_dir/jq"
cp "/$DRIVER" "/flexmnt/$driver_dir/.$DRIVER"
mv -f "/flexmnt/$driver_dir/.$DRIVER" "/flexmnt/$driver_dir/$DRIVER"

# Update old driver also
old_driver_dir=$VENDOR${VENDOR:+"~"}${OLD_DRIVER}
mkdir -p "/flexmnt/$old_driver_dir"
ln -sf "../$driver_dir/$DRIVER" "/flexmnt/$old_driver_dir/$OLD_DRIVER"

# Sleep calm
while : ; do
  sleep 3600
done
