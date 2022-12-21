ansible-target
=========

Set up a user and keys on an Ansible managed node. 

Requirements
------------

Nothing special.

Role Variables
--------------

The defaults/main.yml file contains an asymmetric key pair. 
The public and private key are only there as an example of how to store text like this in a vars file. 
Since this is public, it's useless for security. 
Generate your own and encrypt the private key. See ssh-keygen and ansible-vault. 

Dependencies
------------

ansible.posix collection is used to set up the authorized key.
See https://docs.ansible.com/ansible/latest/collections/ansible/posix/index.html and https://galaxy.ansible.com/ansible/posix.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

Playbook 

  ---
  - name: Add my account to remote boxes.
    hosts: my_managed_nodes
    become: yes
    gather_facts: no
    roles:
      - ansible-target

There is probably an administrator account on the remote machines that can be used to install the Ansible user. Run the playbook with something like this. 

  ansible-playbook --ask-pass --ask-become-pass my_target_playbook.yml 


License
-------

BSD

Author Information
------------------

Nick Hardiman

