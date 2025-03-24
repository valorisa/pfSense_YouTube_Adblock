# pfSense-YouTube-Adblock 🔒🚫

_Blocage réseau des publicités YouTube via pfSense avec inspection SSL et filtrage DNS._

## **1. Structure Recommandée du Projet GitHub**

```bash
pfSense-YouTube-Adblock/
├── README.md               # Documentation principale
├── REALICENSE                 # Licence (GPLv3, MIT, etc.)
├── /
│   ├── update_blocklists.sh  # Script de mise à jour des listes
│   ├└── ssl_inspection_setup.sh  # Configuration automatique SSL
├── config-examples/        # Fichiers de configuration
│   ├── pfblockerng.yaml    # Exemple de règles pfBlockerNG
│   ├└── squid.conf          # Configuration Squid pour SSL Inspection
├── docs/
│   ├── installation_guide.md  # Guide détaillé
│   ├└── troubleshooting.md  # Problèmes courants
└── .github/
    ├── ISSUE_TEMPLATE/     # Modèles pour les issues
    └── workflows/          # CI/CD (optionnel)
```

## **2. Fonctionnalités**

- ✅ Blocage des publicités **pré-roll**, **mid-roll** et **display** sur YouTube.
- 🔒 Inspection SSL pour analyser le trafic HTTPS.
- 📦 Scripts automatisés de mise à jour des listes de blocage.
- 📡 Compatible avec tous les appareils du réseau (PC, mobile, TV).

## **3. Prérequis**

- Matériel :
  - Routeur pfSense ([guide d'installation](https://docs.netgate.com/pfsense/en/latest/install/install-pfsense.html)).
  - 2 Go de RAM minimum (pour l’inspection SSL).
- Logiciel :
  - pfSense 2.6+.
  - Accès root (SSH ou interface web).

## **4. Installation Rapide**

```bash
# Cloner le dépôt
git clone https://github.com/votre-utilisateur/pfSense-YouTube-Adblock.git
cd pfSense-YouTube-Adblock

# Copier les scripts dans pfSense
scp -r scripts/* admin@pfsense.local:/usr/local/bin/

# Exécuter le script de configuration SSL
ssh admin@pfsense.local /usr/local/bin/ssl_inspection_setup.sh
```

---

## **5. Configuration des Listes de Blocage**

- **Fichier de configuration** : `config-examples/pfblockerng.yaml`

  ```yaml
  dnsbl:
    feeds:
      - name: "YouTube Ads"
        url: "https://raw.githubusercontent.com/your-repo/youtube-ads-list/main/domains.txt"
    whitelist:
      - "i.ytimg.com"  # Nécessaire pour les miniatures
  ```

## **6. Scripts Automatisés**

- **Mise à jour des listes** (`scripts/update_blocklists.sh`) :

  ```bash
  #!/bin/sh
  # Télécharge les domaines de pubs YouTube
  curl -s https://your-domain-list.com/yt-ads.txt > /tmp/yt_ads.txt
  # Applique les règles pfBlockerNG
  pfctl -t youtube_ads -T replace -f /tmp/yt_ads.txt
  ```

## **7. Documentation Complète**

Créez un Wiki GitHub ou un dossier `docs` avec :

- **Guide d’installation pas à pas** avec captures d’écran.
- **FAQ** (ex : « Pourquoi les pubs mid-roll persistent ? »).
- **Avertissements légaux** (risques de contournement des CGU YouTube).

## **8. Licence**

Choisissez une licence open source (ex: **GPLv3**) pour permettre la réutilisation et les contributions. Exemple de `LICENSE` :

```text
Ce projet est sous licence GPLv3. Toute utilisation commerciale doit respecter 
les conditions de la licence et mentionner l’auteur original.
```

---

## **9. Contribution**

- **Modèle de Pull Request** :

  ```markdown
  ## Description des changements
  - [ ] Correction de bugs
  - [ ] Ajout de fonctionnalités
  ```
  
  ## Tests effectués
  
  ```markdown
  - Liste des appareils testés (ex : Android TV, Chrome v98).
  ```
  
  - **Code de conduite** (ex : respect des contributeurs).

---

## **10. Captures d’Écran et Démo**

- Ajoutez des visuels :
  - Interface pfBlockerNG avec les règles YouTube.
  - Avant/Après le blocage (ex : vidéo sans pub).
- Lien vers une vidéo de démo (ex : PeerTube ou YouTube privée).

---

## **Promotion et Communauté**

- Partagez le projet sur :
  - **Reddit** : r/pfsense, r/selfhosted.
  - **Forums** : Netgate Forum, GitHub Discussions.
- Collaborez avec des projets similaires (ex : [AdGuard Home](https://github.com/AdguardTeam/AdGuardHome)).

---

## **Exemple de Projets Inspirants**

- [Pi-hole](https://github.com/pi-hole/pi-hole) → Gestion des blocages DNS.
- [pfBlockerNG](https://github.com/pfsense/pfsense-pkg-pfBlockerNG) → Filtrage avancé.

---

Avec cette structure, j'espère que ce projet attirera des contributeurs et des utilisateurs techniques. N’oubliez pas de maintenir une **documentation claire** et de répondre aux issues pour assurer la pérennité du projet ! 🚀
