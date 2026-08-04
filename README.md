# plopoyop.stalwart

Install &amp; configure stalwart email server

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [stalwart_additional_configs](#stalwart_additional_configs)
  - [stalwart_cli_version](#stalwart_cli_version)
  - [stalwart_component](#stalwart_component)
  - [stalwart_data_store](#stalwart_data_store)
  - [stalwart_default_domain](#stalwart_default_domain)
  - [stalwart_fallback_admin_login](#stalwart_fallback_admin_login)
  - [stalwart_fallback_admin_password](#stalwart_fallback_admin_password)
  - [stalwart_server_hostname](#stalwart_server_hostname)
  - [stalwart_server_listeners](#stalwart_server_listeners)
  - [stalwart_server_max_connections](#stalwart_server_max_connections)
  - [stalwart_service_enabled](#stalwart_service_enabled)
  - [stalwart_service_state](#stalwart_service_state)
  - [stalwart_system_group](#stalwart_system_group)
  - [stalwart_system_user](#stalwart_system_user)
  - [stalwart_version](#stalwart_version)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`


## Default Variables

### stalwart_additional_configs

Additional declarative plan operations appended verbatim to the generated
plan. Each entry is a full stalwart-cli apply operation.
'stalwart_additionnal_configs' is deprecated but still accepted as an alias.

#### Default value

```YAML
stalwart_additional_configs: '{{ stalwart_additionnal_configs | default([]) }}'
```

#### Example usage

```YAML
stalwart_additional_configs:
  - "@type": "update"
    object: "Imap"
    value:
      maxRequestSize: 52428800
  - "@type": "upsert"
    object: "AllowedIp"
    matchOn: ["address"]
    value:
      allow-1:
        address: "10.0.0.0/8"
```

### stalwart_cli_version

Stalwart CLI version to install

#### Default value

```YAML
stalwart_cli_version: 1.0.10
```

### stalwart_component

Stalwart component to install : stalwart / stalwart-foundationdb

#### Default value

```YAML
stalwart_component: stalwart
```

### stalwart_data_store

Primary data store definition written to config.json. This is the only
setting kept in the on-disk configuration file; every other setting is
stored in the database and reconciled through the declarative plan.

#### Default value

```YAML
stalwart_data_store:
  '@type': RocksDb
  path: '{{ stalwart_data_path }}'
```

#### Example usage

```YAML
stalwart_data_store:
  "@type": "PostgreSql"
  host: "db.example.com"
  database: "stalwart"
  authUsername: "stalwart"
  authSecret:
    "@type": "Value"
    secret: "changeme"
```

### stalwart_default_domain

Default email domain provisioned and referenced by the system settings.
Defaults to the parent domain of 'stalwart_server_hostname'.

#### Default value

```YAML
stalwart_default_domain: "{{ stalwart_server_hostname.split('.', 1)[1] if '.' in stalwart_server_hostname
  else stalwart_server_hostname }}"
```

### stalwart_fallback_admin_login

Recovery administrator login. Used with 'STALWART_RECOVERY_ADMIN' to
bootstrap the deployment and to authenticate the declarative plan.

#### Default value

```YAML
stalwart_fallback_admin_login: admin
```

### stalwart_fallback_admin_password

Recovery administrator password

#### Default value

```YAML
stalwart_fallback_admin_password: changeme!
```

### stalwart_server_hostname

Default hostname used in SMTP greetings, reports and auto configuration.
When set, the role also provisions the matching default domain. Leave
undefined to keep the value chosen during the initial bootstrap.

#### Default value

```YAML
stalwart_server_hostname: ''
```

### stalwart_server_listeners

Network listeners to create. Each entry maps to a NetworkListener object:
'bind' accepts a single address or a list, and 'options' carries any extra
NetworkListener field (e.g. tlsImplicit, useTls, maxConnections).

#### Default value

```YAML
stalwart_server_listeners:
  - name: smtp
    bind: '[::]:25'
    protocol: smtp
  - name: submission
    bind: '[::]:587'
    protocol: smtp
  - name: submissions
    bind: '[::]:465'
    protocol: smtp
    options:
      tlsImplicit: true
  - name: imap
    bind: '[::]:143'
    protocol: imap
  - name: imaptls
    bind: '[::]:993'
    protocol: imap
    options:
      tlsImplicit: true
  - name: pop3
    bind: '[::]:110'
    protocol: pop3
  - name: pop3s
    bind: '[::]:995'
    protocol: pop3
    options:
      tlsImplicit: true
  - name: sieve
    bind: '[::]:4190'
    protocol: manageSieve
  - name: https
    protocol: http
    bind: '[::]:443'
    options:
      tlsImplicit: true
  - name: http
    protocol: http
    bind: '[::]:8080'
```

### stalwart_server_max_connections

Stalwart server max connections

#### Default value

```YAML
stalwart_server_max_connections: 8192
```

### stalwart_service_enabled

Enable Stalwart service

#### Default value

```YAML
stalwart_service_enabled: true
```

### stalwart_service_state

Stalwart service desired state

#### Default value

```YAML
stalwart_service_state: started
```

### stalwart_system_group

System group name to create

#### Default value

```YAML
stalwart_system_group: stalwart
```

### stalwart_system_user

System user name to create

#### Default value

```YAML
stalwart_system_user: stalwart
```

### stalwart_version

Stalwart server version to install

#### Default value

```YAML
stalwart_version: 0.16.1
```



## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
