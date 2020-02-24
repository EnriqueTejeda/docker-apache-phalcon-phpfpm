![Docker Pulls](https://img.shields.io/docker/pulls/etejeda/docker-apache-phalcon-phpfpm)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/etejeda/docker-apache-phalcon-phpfpm)
![GitHub last commit](https://img.shields.io/github/last-commit/enriquetejeda/docker-apache-phalcon-phpfpm)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A docker image  with Apache + Phalcon + PHP-FPM 7.2 all in Alpine Linux with 40MB~ of size :heart:

## Requirements

* Docker Engine  :heart:

### Which programs is inside?

* php-fpm with extensions (gd, mbstring, soap, xml, ctype, json)
* apache2
* apache2-proxy
* libxml2-dev
* libpng-dev
* runit
* libtool

## Why this container execute two process, isn't this a bad practice and goes against docker thinking?

There are many reasons not to think this, however, making this container has been very useful in several cases, such as to run sites that need phalcon and do a very primitive test, feel free to improve it and give me your comments!

## Getting Started

### Run & Enjoy

You only run this command in your terminal:

```
docker run -p HOST_PORT:80 -v YOUR_DIRECTORY:/var/www/localhost/htdocs etejeda/docker-apache-phalcon-phpfpm 
```
And then you only enter to 127.0.0.1 in you navigator & enjoy!

Example: 

```
docker run -p 80:80 -v $PWD/MYFIRSTWEB:/var/www/localhost/htdocs etejeda/docker-apache-phalcon-phpfpm 
```

## Building the container

I provided a makefile for do this job, only run this command:

```
make run build 
```

## Notes

If you require other version of Phalcon or PSR, only run the docker build with the correct args, like:

```
docker build --build-arg PHALCON_VERSION=X.X.X --build-arg PSR_VERSION=X.X.X . -t YOURTAG
```

## How contribute? :rocket:

Please feel free to contribute to this project, please fork the repository and make a pull request! :heart:

## Share the Love :heart:

Like this project? Please give it a ★ on [this GitHub](https://github.com/EnriqueTejeda/docker-apache-phalcon-phpfpm)! (it helps me a lot)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

