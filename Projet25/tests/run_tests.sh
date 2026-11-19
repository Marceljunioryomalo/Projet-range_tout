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

for interpreteur in bash dash; do
    $interpreteur "$SCRIPT" >/dev/null 2>&1
    verifier "$interpreteur sans argument" 1 $?

    $interpreteur "$SCRIPT" foobar /tmp >/dev/null 2>&1
    verifier "$interpreteur commande inconnue" 3 $?

    $interpreteur "$SCRIPT" ping x >/dev/null 2>&1
    verifier "$interpreteur ping" 0 $?

    $interpreteur "$SCRIPT" inventaire /tmp >/dev/null 2>&1
    verifier "$interpreteur inventaire" 0 $?
done

if [ "$ECHECS" -eq 0 ]; then
    echo "Tous les tests passent."
    exit 0
else
    echo "Certains tests ont echoue."
    exit 1
fi