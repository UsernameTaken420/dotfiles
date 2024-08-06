"Playbook"-based task execution engine, using [[YAML]] files to define target configuration and tasks to be executed

```yaml
name: samplePlaybook
hosts: all
become: yes
become_user: root
tasks:
	- name: ensure apache is latest version
	yum:
		name: httpd
		state: latest
	- name: ensure apache is running
	service:
		name: httpd
		state: started
```

Run with `ansible-playbook samplePlaybook.yaml`

---

#stub