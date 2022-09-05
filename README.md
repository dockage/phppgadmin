# phpPgAdmin [![Docker Pulls](https://img.shields.io/docker/pulls/dockage/phppgadmin.svg?style=flat)](https://hub.docker.com/r/dockage/phppgadmin/) [![Docker Stars](https://img.shields.io/docker/stars/dockage/phppgadmin.svg?style=flat)](https://hub.docker.com/r/dockage/phppgadmin/) [![MicroBadger](https://images.microbadger.com/badges/image/dockage/phppgadmin.svg)](https://microbadger.com/images/dockage/phppgadmin) [![Docker Automated build](https://img.shields.io/docker/automated/dockage/phppgadmin.svg?style=flat)](https://hub.docker.com/r/dockage/phppgadmin/)
[phpPgAdmin](https://github.com/phppgadmin/phppgadmin) is a web-based administration tool for [PostgreSQL](https://www.postgresql.org). It is perfect for PostgreSQL DBAs, newbies, and hosting services.

## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your awesome features and bug fixes
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).

## Issues

Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

SELinux users should try disabling SELinux using the command `setenforce 0` to see if it resolves the issue.

If the above recommendations do not help then [report your issue](../../issues/new) along with the following information:

- Output of the `docker vers6` and `docker info` commands
- The `docker run` command or `docker-compose.yml` used to start the image. Mask out the sensitive bits.
- Please state if you are using [Boot2Docker](http://www.boot2docker.io), [VirtualBox](https://www.virtualbox.org), etc.

# Getting started

## Installation

Pull the image from the docker index. This is the recommended method of installation as it is easier to update image. These builds are performed by the **Docker Trusted Build** service.

```bash
docker pull dockage/phppgadmin:latest
```

Alternately you can build the image locally.

```bash
git clone https://github.com/dockage/phppgadmin.git
cd phppgadmin
docker build --tag="$USER/phppgadmin" .
```


## Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

```bash
wget https://raw.githubusercontent.com/dockage/phppgadmin/master/docker-compose.yml
docker-compose up
```

Alternately, you can manually launch the `phppgadmin` container.

```bash
docker run --name='phppgadmin' -d \
  --publish=80:80 \
dockage/phppgadmin:latest
```


### Available Configuration Parameters

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternatively you can use docker-compose.*

Below is the complete list of available options that can be used to customize your phppgadmin installation.

| Parameter | Description |
|-----------|-------------|
| `PHP_PG_ADMIN_SERVER_DESC` | Display name for the server on the login screen. Defaults to `PostgreSQL`. |
| `PHP_PG_ADMIN_SERVER_HOST` | Hostname or IP address for server.  Use '' for UNIX domain socket. Defaults to ``. |
| `PHP_PG_ADMIN_SERVER_PORT` | Database port on server. Defaults to `5432`. |
| `PHP_PG_ADMIN_SERVER_SSL_MODE` | Database SSL mode. Possible options: `disable`, `allow`, `prefer`, `require`. To require SSL on older servers use option: `legacy`. To ignore the SSL mode, use option: `unspecified`. Defaults to `allow` |
| `PHP_PG_ADMIN_SERVER_DEFAULT_DB` | Change the default database only if you cannot connect to template1. Defaults to `template1`. |
| `PHP_PG_ADMIN_SERVER_PG_DUMP_PATH` | Specify the path to the database dump utilities for this server. Defaults to `/usr/bin/pg_dump`. |
| `PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH` | Specify the path to the database dump utilities for this server. Defaults to `/usr/bin/pg_dumpall`. |
| `PHP_PG_ADMIN_DEFAULT_LANG` | Default language. E.g.: `english`, `polish`, etc.  See [lang](https://github.com/phppgadmin/phppgadmin/tree/master/lang) directory for all possibilities. If you specify `auto` it will use your browser preference. Defaults to `auto`. |
| `PHP_PG_ADMIN_AUTO_COMPLETE` | AutoComplete uses AJAX interaction to list foreign key values on insert fields. It currently only works on single column foreign keys. You can choose one of the following values: `default on` enables AutoComplete and turns it on by default. `default off` enables AutoComplete but turns it off by default. `disable` disables AutoComplete. Defaults to `default on`. |
| `PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY` | If extra login security is `true`, then logins via phpPgAdmin with no password or certain usernames (pgsql, postgres, root, administrator) will be denied. Only set this false once you have read the FAQ and understand how to change PostgreSQL's pg_hba.conf to enable passworded local connections. Defaults to `false`. |
| `PHP_PG_ADMIN_OWNED_ONLY` | Only show owned databases? Note: This will simply hide other databases in the list - this does not in any way prevent your users from seeing other database by other means. (e.g. Run ```SELECT * FROM pg_database``` in the SQL area.). Defaults to `false`. |
| `PHP_PG_ADMIN_SHOW_COMMENTS` | Display comments on objects? Comments are a good way of documenting a database, but they do take up space in the interface. Defaults to `true`. |
| `PHP_PG_ADMIN_SHOW_ADVANCED` | Display "advanced" objects? Setting this to true will show aggregates, types, operators, operator classes, conversions, languages and casts in phpPgAdmin. These objects are rarely administered and can clutter the interface. Defaults to `false`. |
| `PHP_PG_ADMIN_SHOW_SYSTEM` | Display "system" objects? Defaults to `false`. |
| `PHP_PG_ADMIN_MIN_PASSWORD_LENGTH` | Minimum length users can set their password to. Defaults to `1`. |
| `PHP_PG_ADMIN_LEFT_WIDTH` | Width of the left frame in pixels (object browser). Defaults to `200`. |
| `PHP_PG_ADMIN_THEME` | Which look & feel theme to use. Defaults to `default`. |
| `PHP_PG_ADMIN_SHOW_OIDS` | Show OIDs when browsing tables? Defaults to `false`. |
| `PHP_PG_ADMIN_MAX_ROWS` | Max rows to show on a page when browsing record sets. Defaults to `30`. |
| `PHP_PG_ADMIN_MAX_CHARS` | Max chars of each field to display by default in browse mode. Defaults to `50`. |
| `PHP_PG_ADMIN_USE_XHTML_STRICT` | Send XHTML strict headers? Defaults to `false`. |
| `PHP_PG_ADMIN_HELP_BASE` | Base URL for PostgreSQL documentation. '%s', if present, will be replaced with the PostgreSQL version (e.g. 8.4). Defaults to `http://www.postgresql.org/docs/%s/interactive/`. |
| `PHP_PG_ADMIN_AJAX_REFRESH` | Configuration for ajax scripts. Time in seconds. If set to `0`, refreshing data using ajax will be disabled (locks and activity pages). Defaults to `3`. |


## Upgrading

To upgrade to newer `phppgadmin` releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Update the docker image.

```bash
docker pull dockage/phppgadmin:latest
```

- **Step 2**: Stop and remove the currently running image

```bash
docker stop phppgadmin
docker rm phppgadmin
```

- **Step 3**: Start the image

```bash
docker run --name=phppgadmin -d [OPTIONS] dockage/phppgadmin:latest
```

## Quick reference
* Where to get help: [website](https://dockage.dev/), [documentation](https://dockage.dev/docs/)
* GitHub repo: [dockage/phppgadmin](https://github.com/dockage/phppgadmin)
* Where to file issues: [GitHub issues](https://github.com/dockage/phppgadmin/issues)
* Maintained by: The Dockage team (info at dockage.dev)
* License(s) - [license](https://github.com/dockage/phppgadmin/blob/main/LICENSE), check 3rd party documentation for license information