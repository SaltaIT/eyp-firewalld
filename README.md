# firewalld

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What firewalld affects](#what-firewalld-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with firewalld](#beginning-with-firewalld)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [Contributing](#contributing)

## Overview

firewalld management

## Module Description

stops and masks firewalld

## Setup

### What firewalld affects

* manages servie firewalld (this module will mask it)

### Setup Requirements

This module requires pluginsync enabled

### Beginning with firewalld

```puppet
class { 'firewalld': }
```

## Usage

```puppet
class { 'firewalld':
  ensure => 'masked',
}
```

```puppet
class { 'firewalld':
  ensure => 'running',
}
```

## Reference

### classes

#### firewalld

* **ensure**: **running**/**masked** (default: masked)
* **enable**: (default: true)

### defines

#### addport

## Limitations

CentOS 7 only

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
