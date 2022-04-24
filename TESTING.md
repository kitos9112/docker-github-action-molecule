# Testing

To test the container before publication, run these steps.

1. `docker_hash=$(docker build . -q)`.
2. Go to a role-directory, like `ansible-role-example`.
3. Try lint:

```shell
docker run --privileged \
  --volume $(pwd):/github/workspace/kitos9112/$(basename $(pwd)):z \
  --volume /var/run/docker.sock:/var/run/docker.sock:z \
  --tty --interactive --env \
  command="lint" \
  --env GITHUB_REPOSITORY="kitos9112/$(basename  $(pwd))" \
  --env ANSIBLE_ROLES_PATH="../" \
  ${docker_hash}
```
4. Try role:

```shell
docker run --privileged \
  --volume $(pwd):/github/workspace/kitos9112/$(basename $(pwd)):z \
  --volume /var/run/docker.sock:/var/run/docker.sock:z \
  --tty --interactive \
  --env GITHUB_REPOSITORY="kitos9112/$(basename $(pwd))" \
  --env ANSIBLE_ROLES_PATH="../" \
  ${docker_hash}
```
