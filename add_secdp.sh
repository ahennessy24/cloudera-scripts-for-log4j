---
- hosts: zeus
  become: yes
  become_user: root
  tasks:
  - name: add secdp user
    ansible.builtin.user:
      name: secdp
  
  - name: copy the authorized_key
    ansible.builtin.copy:  
      src: /home/centos/.ssh
      dest: /home/secdp/
      remote_src: yes
      owner: secdp
      group: secdp
  
  - name: add the sudoers rule for secdp
    ansible.builtin.lineinfile:
      dest: /etc/sudoers
      line: "secdp  ALL=(ALL) NOPASSWD: ALL"
      owner: root
...
