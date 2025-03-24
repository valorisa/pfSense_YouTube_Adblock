# Dépannage

## 🚫 Les publicités persistent
### Causes possibles :
1. **Mises à jour des serveurs YouTube** : Les domaines publicitaires changent régulièrement.
   - **Solution** : Exécutez manuellement le script de mise à jour :
     ```bash
     /usr/local/bin/update_blocklists.sh
     ```

2. **Pubs intégrées au flux vidéo (DASH)** : Impossible à bloquer sans casser la lecture.
   - **Solution** : Utilisez [uBlock Origin](https://ublockorigin.com/) en complément.

## 🔒 Erreurs SSL/HTTPS
### Scénarios courants :
- **« Votre connexion n'est pas privée »** sur tous les sites :
  - **Cause** : Le certificat CA n'est pas installé sur l'appareil.
  - **Solution** :  
    1. Exportez le certificat depuis pfSense (**System > Cert. Manager**).  
    2. Installez-le dans le magasin de certificats de confiance de l'appareil.

## 🖥️ Le lecteur YouTube ne se charge pas
### Étapes de diagnostic :
1. **Vérifiez les domaines bloqués** :
   ```bash
   tail -f /var/log/pfblockerng.log | grep youtube
   ```
2. **Whitelistez les domaines essentiels** (exemple) :
   ```yaml
   # pfblockerng.yaml
   whitelist:
     - "i.ytimg.com"       # Miniatures
     - "www.youtube.com"   # Lecteur principal
   ```

## 🐢 Ralentissements réseau
- **Désactivez l'inspection SSL** temporairement :
  ```bash
  service squid stop
  ```
- **Ajustez les règles pfBlockerNG** pour exclure les CDN non critiques.

---

**Problème non listé ?** [Ouvrez une issue](/.github/ISSUE_TEMPLATE/bug_report.md) avec les logs pertinents !
```

---

### Points clés :
- Problèmes **SSL** → Liés au certificat CA non installé.
- **Lecteur cassé** → Whitelistez `i.ytimg.com` ou `yt3.ggpht.com`.
- **Performances** → L'inspection SSL consomme des ressources.
