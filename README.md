# loop and qemu-nbd flexvolume drivers for kubernetes

This driver provides you next options:

 - `loop` - simple loopback device
 - `qemu-nbd` - same like loopback but using qemu-nbd
 - `sheepdog` - sheepdog support (experimental)

Basicly this driver allows you to use large files on shared filesystem as vrtual drives for your containers.

It can be a necessary step if your containers have a lot of small files and you want to avoid excessive access to metadata of shared filesystem.

There is also experimental sheepdog support.

## Features

* Automatic volumes allocation and creation
* Multi-mount protection (for ext4 only)
* Checking for shared filesystem (is mounted or no)

## Requirements

* Kubernetes: >=1.9 version

* loop mode requirements:
  * Common filesystem mounted on each node in one place

* qemu-nbd mode requirements:
  * Common filesystem mounted on each node in one place
  * `qemu-img` and `qemu-nbd` installed in the system

* sheepdog mode requirements:
  * Sheepdog cluster
  * `dog`, `qemu-img` and `qemu-nbd` installed in the system

## Limitations

* Only raw images currently supported.
* Each volume will formatted with simple file system, so only one pod can use it in r/w mode.

## Quick start

## Usage

## License

* `flexvolume-qemu-nbd` is under the Apache 2.0 license. (See the [LICENSE](LICENSE) file for details)
