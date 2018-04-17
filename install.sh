#!/bin/sh

set -o errexit
set -o pipefail

VENDOR=kvaps
DRIVER=qemu-nbd

# Install driver
driver_dir=$VENDOR${VENDOR:+"~"}${DRIVER}
mkdir -p "/flexmnt/$driver_dir"
cp "/jq" "/flexmnt/$driver_dir/.jq"
mv -f "/flexmnt/$driver_dir/.jq" "/flexmnt/$driver_dir/jq"
cp "/$DRIVER" "/flexmnt/$driver_dir/.$DRIVER"
mv -f "/flexmnt/$driver_dir/.$DRIVER" "/flexmnt/$driver_dir/$DRIVER"

# Update old driver also
for LN_DRIVER in nbd loop; do
    ln_driver_dir=$VENDOR${VENDOR:+"~"}${LN_DRIVER}
    mkdir -p "/flexmnt/$ln_driver_dir"
    ln -sf "../$driver_dir/$DRIVER" "/flexmnt/$ln_driver_dir/$LN_DRIVER"
done

# Sleep calm
while : ; do
  sleep 3600
done
