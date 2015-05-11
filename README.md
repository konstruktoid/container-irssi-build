## Irssi  

Builds the Irssi IRC client with libotr support.  

http://www.irssi.org/  
https://github.com/cryptodotis/irssi-otr  
    
```sh  
docker build --rm -t irssi -f Dockerfile .  
docker run --cap-drop=all -ti irssi  
/server add -auto -ssl -ssl_verify -ssl_capath /etc/ssl/certs -network freenode chat.freenode.net 6697  
```  
