#!/bin/sh
# format.sh - Fonctions de formatage (tailles et dates)
# Usage : . ./lib/format.sh (pour charger les fonctions)

# Octets -> taille lisible (ex: 42300000 -> 40,3 Mo)
format_taille() {
    octets=${1:-0}
    awk -v o="$octets" 'BEGIN {
        if (o < 1024)            printf "%d o\n", o
        else if (o < 1048576)    printf "%.1f Ko\n", o/1024
        else if (o < 1073741824) printf "%.1f Mo\n", o/1048576
        else                     printf "%.1f Go\n", o/1073741824
    }' | tr '.' ','
}

# 20261009-101532 -> 09/10/2026 à 10h15
format_date() {
    brut=$1
    annee=$(echo "$brut" | cut -c1-4)
    mois=$(echo "$brut" | cut -c5-6)
    jour=$(echo "$brut" | cut -c7-8)
    heure=$(echo "$brut" | cut -c10-11)
    minute=$(echo "$brut" | cut -c12-13)

    printf '%s/%s/%s à %sh%s\n' "$jour" "$mois" "$annee" "$heure" "$minute"
}