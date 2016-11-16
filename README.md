# Node, MySQL, NGinx Vagrant box

A generic development environment for node apps with MySQL and nginx.

## Prerequisites

You will need the following applications to setup the development environment:

- [Vagrant](http://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Git](https://git-scm.com/downloads)

Linux users will also need `nfs-common` and `nfs-kernel-server`:

```bash
sudo apt-get install nfs-common nfs-kernel-server
```

Windows users should install Vagrant to a directory with no spaces in the path.

## Setup

To get started with the development environment, you will first need to clone this repo:

```bash
git clone git://github.com/BlueHatbRit/node-vagrant.git
```

Clone the your app repo into your new local node-vagrant repo:

```bash
cd node-vagrant
git clone $your-code-repo app
```

Now we have both repos cloned, we can proceed with setting up the VM:

```bash
vagrant up
```

Once the VM has been setup, you will need to log in to the VM and setup your app:

```bash
vagrant ssh
```

On the host you should now be able to access your web app by navigating to `local.nodeapp.org` or `192.168.33.10` in your browser.

## Stopping and Starting Your App

Once you have been through the setup process above, you can stop your app by logging in to the VM (`vagrant ssh`) and running:

```bash
sudo stop app
```

To start your app again run:

```bash
sudo start app
```

## Configuring the VM

You can configure various properties of the VM by creating a file named `vm_config.yml` in the `Node-Vagrant` root directory. The following properties are configurable:

- **hostname** - URI that will be used to access your application from the browser
- **ip** - IP address assigned to the virtual machine
- **memory** - Amount of memory the virtual machine should have
- **app_path** - Path to your application installation

```yml
hostname: local.myapp.org
ip: 192.168.33.10
memory: 1024
app_path: ./myapp
```

If `vm_config.yml` is not present when you first run `vagrant up`, it will be automatically created with the default values found in [.vm_config_default.yml](.vm_config_default.yml).

## Credits

This environment has been inspired by [Ghost's vagrant environment](https://github.com/TryGhost/Ghost-Vagrant).
