## Irssi  

http://www.irssi.org/  

```sh
docker build --rm -t irssi -f Dockerfile .
docker run --read-only --cap-drop=all -ti irssi
/server add -auto -ssl -network freenode irc.freenode.net 6697
```

Autobuild:
```sh
docker run --read-only --cap-drop=all -ti konstruktoid/irssi
```

`./apparmor/` contains apparmor profile and toml file, `--security-opt="apparmor:docker-irssi"`
