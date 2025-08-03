# plopoyop.stalwart

Install & configure stalwart email server

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [stalwart_additionnal_configs](#stalwart_additionnal_configs)
  - [stalwart_component](#stalwart_component)
  - [stalwart_directory_options](#stalwart_directory_options)
  - [stalwart_directory_type](#stalwart_directory_type)
  - [stalwart_fallback_admin_login](#stalwart_fallback_admin_login)
  - [stalwart_fallback_admin_password](#stalwart_fallback_admin_password)
  - [stalwart_server_listeners](#stalwart_server_listeners)
  - [stalwart_server_max_connection](#stalwart_server_max_connection)
  - [stalwart_server_max_connections](#stalwart_server_max_connections)
  - [stalwart_service_enabled](#stalwart_service_enabled)
  - [stalwart_service_state](#stalwart_service_state)
  - [stalwart_storage_blob](#stalwart_storage_blob)
  - [stalwart_storage_data](#stalwart_storage_data)
  - [stalwart_storage_fts](#stalwart_storage_fts)
  - [stalwart_storage_lookup](#stalwart_storage_lookup)
  - [stalwart_stores](#stalwart_stores)
  - [stalwart_system_group](#stalwart_system_group)
  - [stalwart_system_user](#stalwart_system_user)
  - [stalwart_tracers](#stalwart_tracers)
  - [stalwart_version](#stalwart_version)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`

## Default Variables

### stalwart_additionnal_configs

Stalwart additionnal configuration

**_Type:_** list<br />

#### Default value

```YAML
stalwart_additionnal_configs: []
```

#### Example usage

```YAML
stalwart_additionnal_configs:
  - name: "directory.imap.pool"
    options:
      max-connections: 10
  - name: "directory.imap.pool.timeout"
    options:
      create: "30s"
      wait: "30s"
      recycle: "30s"
```

### stalwart_component

Stalwart component to install : stalwart / stalwart-foundationdb

**_Type:_** string<br />

#### Default value

```YAML
stalwart_component: stalwart
```

### stalwart_directory_options

#### Default value

```YAML
stalwart_directory_options:
  store: rocksdb
```

### stalwart_directory_type

Stalwart directory options

**_Type:_** dict<br />

#### Default value

```YAML
stalwart_directory_type: internal
```

### stalwart_fallback_admin_login

Stalwart admin login

**_Type:_** string<br />

#### Default value

```YAML
stalwart_fallback_admin_login: admin
```

### stalwart_fallback_admin_password

Stalwart admin password

**_Type:_** string<br />

#### Default value

```YAML
stalwart_fallback_admin_password: changeme!
```

### stalwart_server_listeners

Stalwart listeners : all enabled per default, remove unwanted

**_Type:_** list<br />

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
      tls.implicit: true
  - name: imap
    bind: '[::]:143'
    protocol: imap
  - name: imaptls
    bind: '[::]:993'
    protocol: imap
    options:
      tls.implicit: true
  - name: pop3
    bind: '[::]:110'
    protocol: pop3
  - name: pop3s
    bind: '[::]:995'
    protocol: pop3
    options:
      tls.implicit: true
  - name: sieve
    bind: '[::]:4190'
    protocol: managesieve
  - name: https
    protocol: http
    bind: '[::]:443'
    options:
      tls.implicit: true
  - name: http
    protocol: http
    bind: '[::]:8080'
```

### stalwart_server_max_connection

Stalwart server max connections

**_Type:_** int<br />

### stalwart_server_max_connections

#### Default value

```YAML
stalwart_server_max_connections: 8192
```

### stalwart_service_enabled

Enable Stalwart service

**_Type:_** boolean<br />

#### Default value

```YAML
stalwart_service_enabled: true
```

### stalwart_service_state

Stalwart service desired state

**_Type:_** string<br />

#### Default value

```YAML
stalwart_service_state: started
```

### stalwart_storage_blob

Stalwart blob storage name

**_Type:_** string<br />

#### Default value

```YAML
stalwart_storage_blob: rocksdb
```

### stalwart_storage_data

Stalwart data storage name

**_Type:_** string<br />

#### Default value

```YAML
stalwart_storage_data: rocksdb
```

### stalwart_storage_fts

Stalwart full-text store storage name

**_Type:_** string<br />

#### Default value

```YAML
stalwart_storage_fts: rocksdb
```

### stalwart_storage_lookup

Stalwart lookup storage name

**_Type:_** string<br />

#### Default value

```YAML
stalwart_storage_lookup: rocksdb
```

### stalwart_stores

Stalwart stores : must contain match to data, fts, blob, lookup stores

**_Type:_** list<br />

#### Default value

```YAML
stalwart_stores:
  - name: rocksdb
    type: rocksdb
    options:
      path: '{{ stalwart_data_path }}'
      compression: lz4
      write-buffer-size: 134217728
      min-blob-size: 16834
      pool.worker: 10
```

### stalwart_system_group

System group name to create

**_Type:_** string<br />

#### Default value

```YAML
stalwart_system_group: stalwart
```

### stalwart_system_user

System user name to create

**_Type:_** string<br />

#### Default value

```YAML
stalwart_system_user: stalwart
```

### stalwart_tracers

Stalwart tracers

**_Type:_** list<br />

#### Default value

```YAML
stalwart_tracers:
  - type: stdout
    options:
      level: info
      ansi: false
      enable: true
  - type: log
    options:
      level: info
      path: '{{ stalwart_logs_path }}'
      prefix: stalwart.log
      rotate: daily
      ansi: false
      enable: true
```

### stalwart_version

Stalwart version to install

**_Type:_** string<br />

#### Default value

```YAML
stalwart_version: 0.13.2
```

## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
