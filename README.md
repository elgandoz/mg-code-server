# mg-code-server
Base setup for code-server

## Getting Started

### Prerequisites

__Disclaimer:__ _mg-code-server is designed to work on a confined sandbox._

* Linux operating system (tested only on CentOS & RHEL 7)
* `curl` or `wget` should be installed
* `git` should be installed


### Basic Installation

mg-code-server is installed by running one of the following commands in your terminal. You can install this via the command-line with either `curl` or `wget`.

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/elgandoz/mg-code-server/master/install.sh)"
```

#### via wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/elgandoz/mg-code-server/master/install.sh)"
```

#### Manual inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do
that by downloading the install script first, looking through it so everything looks normal,
then running it:

```shell
curl -Lo install.sh https://raw.githubusercontent.com/elgandoz/mg-code-server/master/install.sh
sh install.sh
```
