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

loop mode requirements:
  * Common filesystem mounted on each node in one place

qemu-nbd mode requirements:
  * Common filesystem mounted on each node in one place
  * `qemu-img` and `qemu-nbd` installed in the system

sheepdog mode requirements:
  * Sheepdog cluster
  * `dog`, `qemu-img` and `qemu-nbd` installed in the system

## Limitations

* Only raw images currently supported.
* Each volume will formatted with simple file system, so only one pod can use it in r/w mode.

## Quick start

This command will install all the drivers on your nodes:

```
kubectl apply -f https://raw.githubusercontent.com/kvaps/flexvolume-qemu-nbd/master/flexvolume-qemu-nbd.yaml
```

## Usage

There is few examples, check ![examples](examples) dir for more detail.

## Options

basic options:
 * `kubernetes.io/fsType` - filesystem type (default: `ext4`)
 * `mmp` - enable multimount protection (default: `true`)
 * `size` - specify the volume size
 * `fsck` - run filesystem check before mount (default `true`)
 * `mmpUpdateInterval` - specify the multimount protection interval (default `5`)
 * `fsckOptions` - fsck options for checking filesystem (default `a`)
 * `allocate` - create volume in filesystem if not exists (default `false`)

loop and qemu-nbd specific options:
 * `share` - path to your share, driver will return error if it not mounted in the system 
 * `file` - releative path to your volume, from `/` or from `share` if set

sheepdog specific options:
 * `vdiname` - volume name in sheepdog cluster
 * `prealloc` - preallocate all the data objects
 * `hyper` - create a hyper volume
 * `copies` - specify the data redundancy level
 * `address` - specify the sheepdog node address (default `localhost`)
 * `port` - specify the sheepdog daemon port
 * `block_size_shift` - specify the bit shift num for data object size

## License

* `flexvolume-qemu-nbd` is under the Apache 2.0 license. (See the [LICENSE](LICENSE) file for details)
