# Ansible Collection - nick.platform

Documentation for the collection.

Create a network of virtual machines on a fresh RHEL 9 host. 
I created this for experiments on a 64GB PC and RHEL 9. 

resources

* libvirt volume storage pool images. This is the default that would get created anyway. ISO files and disk images go here.
* libvirt network public0. Virtual machines that serve the network go here. I don't touch the default NAT network default.
* libvirt networks private0 and private1. These are for experiments with administering those hard-to-reach places.



