# Documentation d'utilisation

## Script `run.sh`

Le script `run.sh` est utilisé pour exécuter les programmes compilés, collecter les résultats d'exécution et les enregistrer dans un fichier CSV. Voici comment l'utiliser :

### 1. Rendre le script exécutable

Assurez-vous que le script `run.sh` est exécutable. Si ce n'est pas le cas, vous pouvez lui accorder les permissions nécessaires avec la commande suivante :

```sh
chmod +x run.sh
```

### 2. Exécuter le script

Pour exécuter le script, utilisez la commande suivante dans le terminal, en remplaçant `<numéro d'exercice>` par le numéro de l'exercice que vous souhaitez exécuter :

```sh
./run.sh <numéro d'exercice>
```

Les options possibles pour `<numéro d'exercice>` sont les suivantes :

1 - Générer un rapport  
2 - Exécuter l'exercice 2  
3 - Exécuter l'exercice 3  
4 - Exécuter l'exercice 4  

Le script génère un fichier CSV contenant les résultats d'exécution moyens pour chaque combinaison de taille de tableau et de nombre de threads. Il affiche également les temps d'exécution pour chaque configuration dans la sortie standard.

### 3. Exemple d'utilisation

Si vous souhaitez exécuter l'exercice 2, utilisez la commande suivante :

```sh
./run.sh 2
```

Cela lancera le programme pour l'exercice 2 en utilisant différentes tailles de tableaux et nombres de threads. Les résultats seront enregistrés dans le fichier `test/exo2.csv`.

## Makefile

Le Makefile est utilisé pour automatiser le processus de compilation des programmes. Voici les principales commandes que vous pouvez utiliser avec `make` :

### 1. Compiler un programme

Pour compiler un programme pour un exercice spécifique, utilisez la commande suivante, en remplaçant `<numéro d'exercice>` par le numéro de l'exercice :

```sh
make exo<numéro d'exercice>
```

Exemple pour l'exercice 2 :

```sh
make exo2
```

Cela compilera le programme correspondant dans le répertoire `build/`.

### 2. Nettoyer les fichiers générés

Pour supprimer les fichiers objets, les exécutables générés, ainsi que les fichiers CSV et PNG de résultats, utilisez la commande suivante :

```sh
make clean
```

Cela supprimera tous les fichiers temporaires et de sortie afin de repartir sur une base propre.

## Notes supplémentaires

### Résultats CSV

Après avoir exécuté le script `run.sh`, un fichier CSV contenant les résultats sera généré dans le répertoire `test/` avec le nom `exo<numéro d'exercice>.csv`. Ce fichier contient les informations suivantes : exercice, taille du tableau, nombre de threads, et temps d'exécution.

### Graphiques PNG

Vous pouvez également générer des graphiques de comparaison des temps d'exécution en utilisant le script Python `plot.py`. Ce script peut être exécuté via la commande suivante :

```sh
python3 plot.py <numéro d'exercice>
```

Cela générera un graphique des temps d'exécution pour différentes tailles de tableaux et nombres de threads, sauvegardé dans le répertoire `results/` avec un nom de fichier basé sur l'exercice.

## Dépendances

Avant d'exécuter le script, assurez-vous d'avoir installé les dépendances suivantes :

- Compilateur GCC avec support OpenMP pour la compilation des exercices
- Python 3 et Matplotlib pour générer les graphiques (si vous souhaitez utiliser `plot_execution_time.py`)

Pour installer Matplotlib, vous pouvez utiliser la commande suivante :

```sh
pip install matplotlib
```

Si vous rencontrez des problèmes pour installer des paquets Python à l'échelle du système, vous pouvez utiliser `pipx` ou `virtualenv` pour isoler l'environnement Python.
