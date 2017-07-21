# Classe LaTeX pour rapports demandés lors de la scolarité à CPE Lyon
Un modèle de rapport est founi aux étudiants, avec une première et une
quatrième de couverture à insérer dans les rapports.

Malheureusement, celles-ci peuvent être complexes à reproduire sous LaTeX,
complexifiant l'utilisation de cet outil typographique pour les rapports
scolaires.

# Utilisation
## Prérequis
La classe est prévue pour fonctionner (et a été testée) avec lualatex,
veuillez donc utiliser ce moteur. Les modifications permettant une plus
grande compatibilité sont les bienvenues, merci d'ouvrir une
"pull request".

## Inclusion de la classe
Ces instructions supposent que vous êtes un minimum familiarisés avec
l'environnement LaTeX, mais devraient pouvoir être suivies facilement par
un débutant (à qui je recommande TeXstudio, aux pro aussi, d'ailleurs).

Tout d'abbord, la classe `rapportcpe` doit être incluse. Pour cela, le
plus simple est de créer votre fichier `.tex` dans le même dossier, puis
d'ajouter la ligne suivante en haut du fichier:

```latex
\documentclass{rapportcpe}
```

Des options peuvent être fournies à la classe, qui les partage avec la
classe `article`.

## Utilisation des raccourcis proposés par la classe
La classe `rapportcpe` propose plusieurs commandes qui permettent de
régler le contenu des champs de la première page. Il est conseillé de
toutes les utiliser.

```latex
\anneestage{20xx-20xx}  % Année du stage
\specialite{ETI}        % ETI ou CGP
\debutstage{jj/mm/aaaa} % Date du début de stage
\finstage{jj/mm/aaaa}   % Date de fin de stage
\typestage{CES}         % EXP = Stage d'expérience
                        % EXE = Stage d'exécution
                        % INGE = Stage élève ingénieur
                        % CES = Année de césure (12 mois)
                        % CES1 = Premier semestre d'année de césure
                        % CES2 = Deuxième semestre d'année de césure

\logo{logoCPE.pdf}      % Nom du fichier contenant le logo de l'entreprise
\entreprise{Nom}        % Dénomination de l'entreprise
\ville{Nom}             % Ville de l'entreprise
\pays{Nom}              % Nom du pays de l'entreprise
\maitrestage{Nom}       % Nom complet du maître de stage
\maitrestagefonction{N} % Fonction complète du maître de stage

\title{English title}   % Intitulé du stage en anglais
\titre{Titre français}  % Intitulé du stage en français

\confidentialfalse      % Confidentialité: \confidentialfalse si non
                        % confidentiel, \confidentialtrue sinon.

\author{Nom}            % Nom de l'étudiant
```

Il est bien sûr conseillé d'expérimenter par vous-mêmes, avec le fichier
d'exemple. Vous pouvez aussi jeter un œuil au fichier `.cls`, qui n'est
pas si complexe.

## Liste des fichiers

- `exemple.tex` : un exemple d'utilisation de la classe
- `rapportcpe.cls` : le fichier de la classe rapportcpe
- `logoCPE.svg` : Logo de CPE Lyon, vectorisé manuellement
- `logoCPE.pdf` : export du logo vectorisé au format pdf, pour intégration
facile
- `.gitignore` : fichier .gitignore de git, pour ignorer certains types de
fichiers
- `README.md` : vous êtes en train de le lire

# Contribtions
Les contributions sont acceptées, vous pouvez ouvrir une "Pull Request"
sur GitHub, ou envoyer vos fichiers modifiés à quelqu'un.

## Licence
Le code est sous license GPLv3. Vous avez donc le droit de le
redistribuer, modifier, à des fins commerciales ou non, tant qu'il
conserve (ainsi que les travaux dérivés) la même license. Il est fourni
sans garanties.

## Liste d'améliorations possibles
Il reste encore fort à faire sur la classe pour qu'elle soit entièrement
compatible avec les consignes:

- [ ] Aligner les cases à cocher dans le tableau
- [ ] Changer la couleur du tableau en gris clair
- [ ] Corriger l'alignement de la colone de droite du tableau
- [ ] Définir une police plus compatible
- [ ] Donner la possibilité d'insérer des fiches d'interview facilement
- [ ] Afficher l'aide lors de l'utilisation de la classe dans TeXstudio
- [ ] Affichage des erreurs lorsque des informations sont manquantes

Le code peut être considéré comme actuellement prêt à l'emploi, même si
ces améliorations mineures restent à implémenter.
