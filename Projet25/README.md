# Projet rangetout

Assistant de rangement de fichiers (shell POSIX).

## Usage
    bin/rangetout.sh inventaire <dossier>
    bin/rangetout.sh ranger [-n] <dossier>
    bin/rangetout.sh historique <dossier>

## Codes de sortie
0 = succes | 1 = usage | 2 = dossier invalide | 3 = commande inconnue

## Tests
    sh tests/run_tests.sh