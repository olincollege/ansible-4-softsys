# Ansible Playbook for SoftSys Setup
### Final Project for Extraordinary Tools in Computing Fall 2023
*Contributors: Shree Madan, Daeyoung Kim, Meredith Alley*

![Screenshot from 2023-12-10 18-33-35](https://github.com/olincollege/ansible-4-softsys/assets/95325894/53cba5b4-e437-4450-b312-4682e6542fb0)

## How to Run

### Setup

In order to run this playbook, first clone this repository onto your machine:
```
git clone git@github.com:olincollege/ansible-4-softsys.git
```

Then, make sure you have ansible and docker installed (and properly versioned):
```
ansible --version
docker --version
```

To install ansible:
```
sudo apt update
sudo apt install ansible
```
Docker install instructions can be found [here](https://docs.docker.com/engine/install/ubuntu/).

If you want to skip SSH key configuration, you're all done! Read about **flags** below, and then run the **command** from within the directory containing the playbook. If not, then generate a Github Access Token first.

#### Github Token Generation

***STUFF HERE***

### Actual Use

#### Command

To execute this playbook, call a command with the following structure from the command line:

```
ansible-playbook -K main.yml -e "git_user_name=Alan Turing git_user_email=alan@turing.org"
```

Make sure to substitute the flags within the quotation marks after -e with your preferred flags, as designated by the options below.

#### Flags

A few tasks performed by this playbook require additional input from the user, but can be skipped if the user chooses to forgo that part of the setup. The 'skip' flags for all of the following tasks are set to 'false' by default, and the playbook will raise a corresponding error message if the user does not follow one of two options for each task: either input the required information or indicate that that task should be skipped.

***Configuring git with the user's information***

Depending on if the user would like their Github acccount attached to this machine, they should either use the flags (with their corresponding account information):

```
git_user_name: "xxx" git_user_email: "xxx@xxx.com" 
```

or the flag:

```
skip_git_config: true
```

***Configuring git with the user's chosen editor***

Depending on if the user would like to set as their primary Git editor, they should either use the following flag with their corresponding editor (default: 'code'[VSCode]):

```
git_editor: "code"
```

or the flag:

```
skip_git_editor: true
```

***Authenticating this machine with an SSH Key***

Depending on if the user would like to add an SSH key in order to allow this machine to write to Github without inputting their access token every time, they should either input their token (generated above) and intended name for the storage of the SSH key:

```
github_ssh_key_title: "SSH key for SoftSys" github_token: "xxxx"  
```

or the flag:

```
skip_ssh: true
```

### Testing

This playbook can be run in an Ubuntu 22.04 Docker conatiner using the provided Dockerfile. To do so, use the command line and begin by **building** the container:

```
docker build -t test-ansible .
```

Then, run the container:

```
docker container run -it test-ansible
```
When prompted for the BECOME password, just press enter.

***Flag Info*** 

The container is run with a configuration that skips the SSH key step, meaning the user doesn't have to input a Github token, and with a dummy Github account. The combination of flags used is:
```
"git_user_name=Alan Turing git_user_email=alan@turing.org skip_ssh=true"
```
