# fricloud-ansible

## How to develop with vagrant
Make sure vagrant is running with libvirt backend (see vagrant docs), then:

- Make sure `hosts` in `local.yml` is set to `fricloudtest`
- Get submodules `$ git submodule update --init --recursive`

and

`$ vagrant up`

Ansible should run on the machine automatically.
Note that some errors are to be expected.
However, if ansible completes, you should be fine.
As of writing, testing is done manually, this will be worked on soon(tm).
When you are done, do:

`$ vagrant destroy`

and 

`$ vagrant up`

again, to run with changes.

To remove the downloaded Debian image, do:

`$ vagrant box remove debian/stretch64`

TL;DR: Read Vagrant documentation.

