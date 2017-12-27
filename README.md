# Phpunit Gitamine Plugin

## Requirements

* Shellcheck
* phpunit
* Linux/Mac

## Installation

```bash
gitamine install git4min3/gitamine-phpunit    
```

## Configuration

```yaml
# gitamine.yaml
gitamine:
  pre-commit:
    phpunit: ~    
```

```yaml
# gitamine.yaml
gitamine:
  pre-commit:
    phpunit:
      bin: bin/phpunit                #default phpunit
      enabled: true                   #default true
      min-coverage: 100               #default 0
      configuration-file: phpunit.xml #default phpunit.xml.dist    
```

## Other information

If you want to develop this library, you will need to have shellcheck installed
