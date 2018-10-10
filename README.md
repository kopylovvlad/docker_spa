# docker_spa

Example how to build image for SPA (single page application).
Here is two differents ways:

- Image with nodejs, yarn and all source code
- Image with nginx and only static files

## Images

```
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
nginx_spa_image           latest              5c083e70c96b        18 seconds ago      148MB
node_spa_image            latest              8b1318545df3        2 minutes ago       781MB
```

## Benchmarks

All benchmarks by [wrk](https://github.com/wg/wrk)

### NODEJS

```
$ wrk -t12 -c400 -d30s http://127.0.0.1:8080/

Running 30s test @ http://127.0.0.1:8080/
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   146.03ms   44.95ms 513.91ms   88.22%
    Req/Sec   143.69     95.73   343.00     61.00%
  49133 requests in 30.09s, 37.72MB read
  Socket errors: connect 156, read 180, write 14, timeout 0
Requests/sec:   1632.68
Transfer/sec:      1.25MB


$ wrk -t12 -c400 -d30s http://127.0.0.1:8080/static/js/vendor.2420502e2b2c7f321d64.js

Running 30s test @ http://127.0.0.1:8080/static/js/vendor.2420502e2b2c7f321d64.js
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   528.04ms   59.45ms 928.94ms   82.12%
    Req/Sec    55.60     28.51   240.00     68.96%
  13531 requests in 30.08s, 1.42GB read
  Socket errors: connect 156, read 1, write 1, timeout 0
Requests/sec:    449.76
Transfer/sec:     48.22MB
```

### NGINX

```
$ wrk -t12 -c400 -d30s http://127.0.0.1:8080/

Running 30s test @ http://127.0.0.1:8080/
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    51.17ms   35.56ms 508.79ms   88.29%
    Req/Sec   408.67    259.64     1.24k    56.83%
  144881 requests in 30.09s, 103.63MB read
  Socket errors: connect 156, read 56, write 7, timeout 0
Requests/sec:   4814.17
Transfer/sec:      3.44MB


$ wrk -t12 -c400 -d30s http://127.0.0.1:8080/static/js/vendor.2420502e2b2c7f321d64.js

Running 30s test @ http://127.0.0.1:8080/static/js/vendor.2420502e2b2c7f321d64.js
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   525.50ms   81.78ms   1.45s    95.61%
    Req/Sec    49.35     33.24   262.00     70.80%
  13561 requests in 30.10s, 1.42GB read
  Socket errors: connect 156, read 194, write 32, timeout 0
Requests/sec:    450.59
Transfer/sec:     48.32MB
```

## For more information see

See Makefile
