# Irssi

[Irssi](https://irssi.org) is a modular text mode chat client. It comes with
IRC support built in.

_Please note that because of the changes to [Docker Automated Builds](https://docs.docker.com/docker-hub/builds/)
many Docker images are now outdated and a manual build is required and
recommended._

```sh
podman build --rm -t konstruktoid/irssi -f Dockerfile .
podman run --read-only --cap-drop=all -ti konstruktoid/irssi
/server add -auto -ssl -network freenode irc.freenode.net 6697
```

`./apparmor/` contains apparmor profile and toml file, `--security-opt="apparmor:docker-irssi"`
