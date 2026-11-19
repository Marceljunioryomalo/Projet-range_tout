#!/bin/sh
# run_tests.sh - tests de base du squelette

DOSSIER=$(dirname "$0")
RACINE=$(cd "$DOSSIER/.." && pwd)
SCRIPT="$RACINE/bin/rangetout.sh"

ECHECS=0

# Compare le code obtenu avec le code attendu
verifier() {
    nom=$1
    attendu=$2
    obtenu=$3
    if [ "$obtenu" -eq "$attendu" ]; then
        echo "OK    $nom"
    else
        echo "ECHEC $nom (attendu=$attendu obtenu=$obtenu)"
        ECHECS=1
    fi
}

sh "$SCRIPT" >/dev/null 2>&1
verifier "sans argument" 1 $?

sh "$SCRIPT" foobar /tmp >/dev/null 2>&1
verifier "commande inconnue" 3 $?

sh "$SCRIPT" ping x >/dev/null 2>&1
verifier "ping" 0 $?

sh "$SCRIPT" inventaire /tmp >/dev/null 2>&1
verifier "inventaire" 0 $?

if [ "$ECHECS" -eq 0 ]; then
    echo "Tous les tests passent."
    exit 0
else
    echo "Certains tests ont echoue."
    exit 1
fi