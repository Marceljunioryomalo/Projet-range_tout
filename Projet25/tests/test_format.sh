#!/bin/sh
# test_format.sh - Test des fonctions de lib/format.sh

DOSSIER=$(dirname "$0")
RACINE=$(cd "$DOSSIER/.." && pwd)

# On charge la bibliothèque de fonctions
. "$RACINE/lib/format.sh"

echo "--- Tests format_taille ---"
echo "1024 octets -> $(format_taille 1024)"
echo "42300000 octets -> $(format_taille 42300000)"
echo "524288000 octets -> $(format_taille 524288000)"

echo "--- Tests format_date ---"
echo "20261009-101532 -> $(format_date "20261009-101532")"
echo "20231125-083000 -> $(format_date "20231125-083000")"