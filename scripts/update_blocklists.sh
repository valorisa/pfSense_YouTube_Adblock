#!/bin/sh
# Met à jour les listes de blocage pour YouTube
LIST_URL="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
TMP_FILE="/tmp/yt_ads.txt"

# Télécharge et filtre les domaines YouTube
curl -s $LIST_URL | grep -E '^(0.0.0.0|127.0.0.1)' | grep 'youtube\|googlevideo' | awk '{print $2}' > $TMP_FILE

# Applique les règles à pfBlockerNG
if [ -s $TMP_FILE ]; then
    pfctl -t youtube_ads -T replace -f $TMP_FILE
    echo "✅ Listes mises à jour : $(wc -l $TMP_FILE) domaines bloqués."
else
    echo "❌ Échec du téléchargement des listes."
fi
