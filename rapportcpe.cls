%% rapportcpe.cls -- classe de rapport pour CPE Lyon
%% Copyright (C) 2017  Mayeul Cantan <mayeul.cantan@gmail.com>

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapportcpe}[2017/07/18 Rapport de stage pour CPE Lyon]

% Passe toutes les options à la classe "article" et la charge
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

% Packets utilisés
\usepackage{xstring} % Comparaison de chaînes de caractères
\usepackage{amsfonts} % Pour symboles supplémentaires (cases à cocher: \checkmark)
\usepackage{makecell} % Rend plus facile le saut de ligne dans un tableau
\usepackage{graphicx} % Pour inclure les logos
\usepackage{environ} % \NewEnviron donne plus facilement accès au corps avec \BODY

% Variables qui seront modifiables par l'utilisateur:
\newtoks\anneestage
\newtoks\specialite
\newtoks\debutstage
\newtoks\finstage
\newtoks\titre
\newtoks\entreprise
\newtoks\ville
\newtoks\pays
\newtoks\maitrestage
\newtoks\maitrestagefonction
\newtoks\typestage % EXP, EXE, INGE, CES, CES1, CES2 ou PFE

\def\logo#1{\def\@logo{#1}}
\newif\ifconfidential

\renewcommand\cellalign{{p{200pt}}c} %TODO: pourquoi cela est-ce nécessaire pour que le tableau foncionne?

% Raccourcis pour les cases à cocher
\def\ticked{\mbox{\rlap{\square}\checkmark}} % mbox prévient le retour à la ligne. case et "V" supperposés.
\def\untick{\square}

\def\isstagexp{\IfStrEq{\the\typestage}{EXP}{\ticked}{\untick}}
\def\isstagexe{\IfStrEq{\the\typestage}{EXE}{\ticked}{\untick}}
\def\isstageeleveinge{\IfStrEq{\the\typestage}{INGE}{\ticked}{\untick}}
\def\isstagecesunan{\IfStrEq{\the\typestage}{CES}{\ticked}{\untick}}
\def\isstagecessemun{\IfStrEq{\the\typestage}{CES1}{\ticked}{\untick}}
\def\isstagecessemdeux{\IfStrEq{\the\typestage}{CES2}{\ticked}{\untick}}
\def\isstagepfe{\IfStrEq{\the\typestage}{PFE}{\ticked}{\untick}}



\def\contenuresumestage{}
\gdef\contenuresumestage{
	Utilisez l'environnement "resumestage" pour inclure votre résumé en français ici:
	\textbackslash begin \textbraceleft resumestage \textbraceright
	Texte ici
	\textbackslash end \textbraceleft resumestage \textbraceright
}

\NewEnviron{resumestage}{
	\expandafter\gdef\expandafter\contenuresumestage\expandafter{\BODY}
	% Redéfinit globalement resumestagecontent pour être \BODY après une expansion
	%TODO: remplacer par quelque chode de plus clair comme:

}

\usepackage{geometry} %utiliser [showframe] pour montrer les marges.

\usepackage{fancyhdr}
\fancyhf{}
\fancyhead[R]{\thepage} % Marque le numéro de page à droite
\renewcommand{\headrulewidth}{0pt} % Retire la ligne horizontale de l'en-tête

\def\nomprenomformatte{\textbf{Nom et Prénom du stagiaire :} \@author} % Raccourci pour nom et prénom prêt à l'affichage
\def\specialitetabular{ % Raccourci pour insérer la spécialité. Doit être dans un tabular lll
	Spécialité : &
	\IfStrEq{\the\specialite}{CGP}{\ticked}{\untick} CGP % coché si CGP
	&
	\IfStrEq{\the\specialite}{ETI}{\ticked}{\untick} ETI \\
}
\def\tableau{ % Raccourci pour le tableau d'en-tête
\begin{tabular}{|p{0.25\textwidth}|p{0.5\textwidth}|@{}c@{}|}
	\hline
	\makecell{\vskip0.5ex\includegraphics[width=0.25\textwidth]{logoCPE.pdf}} &
	\makecell{
		\textbf{Stage d'exépérience} \isstagexp{} \\
		\textbf{Stage d'exécution} \isstagexe{} \\
		\textbf{Stage élève-ingénieur} \isstageeleveinge{}\\
		\textbf{Stage année en entreprise :}\\
			\isstagecesunan{} \textbf{12 mois}
			\isstagecessemun{} \textbf{1\textsuperscript{er} semestre}
			\isstagecessemdeux{} \textbf{2\textsuperscript{ème} semestre}\\
		\textbf{Stage projet de fin d’études} \isstagepfe{}
		\vskip0.5ex
	}
	&
	\begin{tabular}{>{\centering\arraybackslash}p{0.25\textwidth}} % Le "field format" > permet de spécifier l'alignement. \arraybackslash est nécessaire pour restaurer l'alignement original
		%TODO: vérifier alignement
		\makecell{
			\\
			Date du stage \\
			du \the\debutstage\\
			au \the\finstage
			\vskip0.5ex
		}\\
		\hline
		\makecell{
			\\
			Année \\
			\the\anneestage
			\vskip0.5ex
		}
	\end{tabular}
	\\
	\hline
\end{tabular}
}

\fancypagestyle{firststyle}
{
	\fancyhf{}
	\newgeometry{top=5.2cm,headheight=4.2cm}
	\fancyhead[C]{
		\begin{flushright}
			\thepage
		\end{flushright}
		\tableau
	}
}

\pagestyle{fancy}

\AtBeginDocument {
	\sffamily\setlength\extrarowheight{4pt} %TODO: trouver le mode d'action et décider sur son inclusion
	\thispagestyle{firststyle} % En-têtes dans le style de la première page

	% Dessous le cadre supérieur:
	\noindent
	\nomprenomformatte

	\begin{tabular}{lll}
	\specialitetabular

	Confidentialité du rapport : &
	\ifconfidential \ticked{} \else \untick{} \fi OUI &
	\ifconfidential \untick{} \else \ticked{} \fi NON
	\end{tabular}
	\\\\

	\noindent
	\textbf{Titre du rapport en français :}

	\the\titre
	\\\\
	\noindent
	\textbf{Titre du rapport en anglais :}

	\@title

	\topskip0pt
	\vspace*{\fill} % S'étend pour remplir l'espace vertical

	\ifdefined\@logo
	\includegraphics[width=\textwidth]{\@logo}
	\fi

	\vspace*{\fill}

	\noindent
	\textbf{Nom de l'entreprise/organisme : } \the\entreprise
	\\\\
        \noindent Ville : \the\ville \hfill Pays : \the\pays

        \noindent Nom et Prénom du maître de stage : \the\maitrestage

        \noindent Fonction : \the\maitrestagefonction

	\pagebreak
	\restoregeometry
}
\AtEndDocument {

	\pagebreak
	\thispagestyle{firststyle}
	\nomprenomformatte

	\begin{tabular}{lll}
		\specialitetabular
	\end{tabular}

\section*{Résumé du stage}
%TODO: au moins vérifier le critère des 300 mots mini automatiquement
	\contenuresumestage

}

\endinput
