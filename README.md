# Fake Dict

## Why Fake Dict
為了解決 [請教nginx的二級域名轉址設定問題](http://ithelp.ithome.com.tw/question/10124965) 之實作

## configure Nginx
www.dict
```
upstream dict {
    server 127.0.0.1:3000;
}

server_name www.dict.xxx
if (!-f $request_filename) {
  proxy_pass http://dict;
  break;
}
```

*.dict
```
server_name ~^(?<subdomain>.+)\.dict\.xxx\.xxx;
proxy_pass http://dict/search/$subdomain;
```
## Demo Site
http://www.dict.tagbible.net
