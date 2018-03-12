# echoservice

```bash
make
bin/echoservice

# or

GOOS=linux GOARCH=amd64 make
make docker-build
make docker-run
```

```sh-session
$ curl -v localhost:8080
* Rebuilt URL to: localhost:8080/
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 8080 (#0)
> GET / HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.54.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Mon, 12 Mar 2018 07:24:30 GMT
< Content-Length: 6
< Content-Type: text/plain; charset=utf-8
<
hello
* Connection #0 to host localhost left intact
```
