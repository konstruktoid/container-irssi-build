## Irssi  

http://www.irssi.org/  

```sh
docker build --rm -t irssi -f Dockerfile .
docker run --cap-drop=all -ti irssi
/server add -auto -ssl -ssl_verify -ssl_capath /etc/ssl/certs -network freenode chat.freenode.net 6697
```

`./apparmor/` contains apparmor profile and toml file, `--security-opt="apparmor:docker-irssi"`
