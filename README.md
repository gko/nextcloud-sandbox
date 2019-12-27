# Nextcloud sandbox

This repo contains `docker` stack to be able to develop and test `nextcloud` app.

It contains:
 - nextcloud
 - composer
 - node

## Installation

Clone the project:
```shell
git clone https://github.com/gko/nextcloud-sandbox.git
```

## Usage

To run it simply launch build ():
```shell
docker-compose -f stack.yml up
```

then `nextcloud` will be available on [localhost:8080](https://localhost:8080/)

### Node version

By default `node` 12 will be installed, but you can change it in [`.env`](/blob/master/.env) file.

### Creating app

Let's look at the example of [nextcloud/notes](https://github.com/nextcloud/notes)

First, clone repo within [`custom_apps/`](/tree/master/custom_apps) folder:
```shell
git clone https://github.com/nextcloud/notes.git
```

then bash into container:
```shell
docker exec -it \
	--workdir /var/www/html/custom_apps/notes \
	nextcloud \
	/bin/bash
```

Then follow the `developer` instructions in the [notes/README](https://github.com/nextcloud/notes#warning-developer-info)

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2012-2020 Konstantin Gorodinskiy