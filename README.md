# kube-loop-flexvolume

This driver allows you to create large files on shared filesystem, then format it and mount as volume for container.

It can be a necessary step if your containers have a lot of small files and you want to avoid excessive access to metadata.

## Features

* Automatic volumes allocation and creation
* Multi-mount protection (for ext4 only)
* Checking for shared filesystem (is mounted or no)

## Requirements

* Kubernetes: >=1.9 version
* Common filesystem mounted on each node in one place

## Limitations

* Each volume will formatted with simple file system, so only one pod can use it in r/w mode.

## Quick start

## Usage

## License

* Kube-loop-flexvolume is under the Apache 2.0 license. (See the [LICENSE](LICENSE) file for details)
