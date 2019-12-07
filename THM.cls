\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{THM}[2018/10/10 THM LaTeX class]


\RequirePackage{scrextend}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xkeyval}
\RequirePackage[colorinlistoftodos,prependcaption]{todonotes}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass{report}

\onehalfspacing{}
\geometry{paper=a4paper,left=40mm,right=15mm,top=20mm,bottom=20mm}

% Set header
\pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{%
	\markboth{#1}{}}
\fancyhf{}
\fancyfoot{}
\rhead{\nouppercase{\rightmark}}
\lhead{\nouppercase{\leftmark}}
\rfoot{\thepage}

% Redefine for toc and chapter pages
\fancypagestyle{plain}{%
	\fancyhf{}%
	\rfoot{\thepage}
	\renewcommand{\headrulewidth}{0mm}%
}   

% Remove the chapter keyword
\def\@makechapterhead#1{%
	{\parindent \z@ \raggedright \normalfont
		\interlinepenalty\@M
		\Large \bfseries {\huge\thechapter\hskip 20\p@#1}\par\nobreak
		\vskip 20\p@
}}

% Define custom commands

\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}

\def\@documentType{Praxisphasenbericht}
\def\@documentTypeDescription{}
\newcommand{\documentType}[2]{
	\def\@documentType{#1}
	\def\@documentTypeDescription{#2}
}


\def\@companysupervisor{}
\newcommand{\companysupervisor}[1]{
	\def\@companysupervisor{#1}
}


\def\@unisupervisor{}
\newcommand{\unisupervisor}[1]{
	\def\@unisupervisor{#1}
}

\def\@companyName{}
\def\@companyPlz{}
\def\@companyPlace{}
\def\@companyStreet{}
\def\@companyLogo{}
\newcommand{\company}[5]{
	\def\@companyName{#1}
	\def\@companyPlz{#2}
	\def\@companyPlace{#3}
	\def\@companyStreet{#4}
	\def\@companyLogo{#5}
}

\def\@authorPlz{}
\def\@authorPlace{}
\def\@authorStreet{}
\def\@authorMat{}
\renewcommand{\author}[5]{
  \def\@author{#1}
  \def\@authorPlz{#2}
  \def\@authorPlace{#3}
  \def\@authorStreet{#4}
  \def\@authorMat{#5}
}

\def\@signature{}
\newcommand{\signature}[3]{
	\def\@signature{#1}
	\def\@signature@top{#2}
	\def\@signature@left{#3}
}


\newcommand{\logoTHM}{resources/thm.jpg}
\newcommand{\logoSTP}{resources/sp.jpg}


\renewcommand{\maketitle}{
	\thispagestyle{plain}
	\begin{titlepage}
	  \begin{addmargin}[-0.5cm]{0cm}
			\thispagestyle{empty} %% ohne Kopf- und Fusszeile, Seitennummer etc.
			
			\begin{figure}[h]
				\centering
				\includegraphics[height=1.5cm,keepaspectratio]{\logoTHM}
				\hfill
				\includegraphics[height=1.79cm,keepaspectratio]{\logoSTP}
			\end{figure}
			
			\begin{center}	
				
				\vspace{15mm}		
				\large
				\textbf{\@documentType}
				\large
				
				\@documentTypeDescription
			\end{center}
			
			\vspace{1.0cm}
			
			
			Thema:
			
			\begin{center}
				
				\large
				
				\@title
				
				\large
				
				\normalsize
				
				
				\vspace{10mm}
				
				\small
				
			\end{center}
			
			\begin{tabular}[h]{ll}
				Vorgelegt von: 	&	\@author	\\
				&	\@authorStreet	\\
				&	\@authorPlace	\\
				%  								&
				Matrikelnummer: &  	\@authorMat	\\
				
				Eingereicht bei:&	\\
				Hochschulbetreuer:	&	\@unisupervisor	\\
				Fachbetreuer:	&	\@companysupervisor	\\
				Unternehmen:	& 	\@companyName \\
				& 	\@companyStreet \\
				& 	\@companyPlz \ \@companyPlace \\
				\\
				Eingereicht am:	& 	\@date
		
			\end{tabular}
			
			
			\vspace{10mm}
			
			
			\begin{flushright}
				\includegraphics[height=1.5cm,keepaspectratio]{\@companyLogo}
			\end{flushright}
			
			
		\end{addmargin}
	
	\end{titlepage}
}

\newcommand{\makeinsurance}{
	\chapter*{Versicherung}
	\addcontentsline{toc}{chapter}{Versicherung}
	
	\thispagestyle{empty}
	
	Ich, \@author, Matrikel-Nr.\ \@authorMat, versichere hiermit, dass ich meinen \@documentType\ mit dem Thema
	
	\begin{quote}
		\textit{\@title}
	\end{quote}
	
	selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe, wobei ich alle wörtlichen und sinngemäßen Zitate als solche gekennzeichnet habe. Die Arbeit wurde bisher keiner anderen Prüfungsbehörde vorgelegt und auch nicht veröffentlicht.
	
	\vspace{8ex}
	
	\@companyPlace, den \@date
	
	\vspace{6ex}
	
	\@ifundefined{\@signature}
	{%
		% \foo not defined
	}
	{%
		\hspace{\@signature@left}

		\includegraphics[width=5cm]{\@signature}
		
		\vspace{\@signature@top}
	}%

	\rule[-0.2cm]{5cm}{0.5pt}
	
	\textsc{\@author} 
	
}

\newcommand{\lockMark}{
	\chapter*{Sperrvermerk}
	\thispagestyle{empty}
	Der vorliegende Praxisphasenbericht beinhaltet interne vertrauliche Informationen
	der \@companyName. Die Weitergabe des Inhaltes der Arbeit
	und eventuell beiliegender Zeichnungen und Daten im Gesamten oder in Teilen ist
	grundsätzlich untersagt. Es dürfen keinerlei Kopien oder Abschriften - auch in digitaler
	Form - gefertigt werden. Ausnahmen bedürfen der schriftlichen Genehmigung der
	\@companyName.
	\newpage
}

\newcommand{\commonAcronyms}{
	Allgemeine Abkürzungen, wie „z.B.“, „etc.“, „usw.“ oder gängige Abkürzungen in Fußnoten, wie z.B. „vgl.“, usw. wurden explizit nicht im Abkürzungsverzeichnis aufgeführt.
}

