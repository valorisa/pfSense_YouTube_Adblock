# Guide d'Installation

## 1. Prérequis

- pfSense 2.6+ installé.
- Accès SSH à pfSense.

## 2. Déployer les Scripts

```bash
scp -r scripts/* admin@pfsense:/usr/local/bin/
chmod +x /usr/local/bin/*.sh
```

## 3. Configurer pfBlockerNG

Copiez ```config-examples/pfblockerng.yaml``` dans ```/var/db/pfblockerng/```.

```markdown
# Dépannage

## Les pubs persistent
- Vérifiez les logs : `tail -f /var/log/pfblockerng.log`
- Whitelistez `*.googlevideo.com` si la vidéo ne se charge pas.

```
