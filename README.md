# Irssi

[Irssi](https://irssi.org) is a modular text mode chat client. It comes with
IRC support built in.

## Build and run

```sh
podman build --rm -t konstruktoid/irssi -f Dockerfile .
podman run --read-only --cap-drop=all -ti konstruktoid/irssi
```

Inside irssi:

```text
/server add -auto -tls -network Libera irc.libera.chat 6697
```

The image runs as the unprivileged `irssi` user, sets `LANG=C.UTF-8`, and keeps
its configuration in the `/home/irssi/.irssi` volume, so settings survive a
`--read-only` container:

```sh
podman run --read-only --cap-drop=all -ti \
  -v irssi-config:/home/irssi/.irssi konstruktoid/irssi
```

## OTR

`irssi-otr` is installed, so `libotr_core.so` is available:

```text
/load otr
/help otr
```

## AppArmor

`./apparmor/` contains an AppArmor profile and its toml source, applied with
`--security-opt="apparmor:docker-irssi"`.

## Development

`.pre-commit-config.yaml` runs gitleaks, hadolint, actionlint and
markdownlint:

```sh
pre-commit run --all-files
```
