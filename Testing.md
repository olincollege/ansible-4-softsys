# Using Docker to Test the Anisble Playbook

## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Testing

First, we need to build the Docker image:

```bash
docker image build -t ansible .
```

Then, we can run the container that will execute the Ansible playbook at startup:

```bash
docker run -it ansible
```

It will as for `BECOME password: ` but you can just press `Enter` to continue.
Observe the output of the playbook execution for any error messages.
