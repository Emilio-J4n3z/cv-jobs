\ProvidesClass{moderncurriculum}[2019/09/2019 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
% REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontawesome5}
\RequirePackage{mathptmx}
\RequirePackage[11pt]{moresize}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
% COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{darkblue}{RGB}{31, 78, 121}
\definecolor{mediumblue}{RGB}{68, 114, 196}
\definecolor{lightblue}{RGB}{217, 225, 242}
\definecolor{sidecolor}{RGB}{217, 225, 242}
\definecolor{mainblack}{RGB}{31, 78, 121}
\definecolor{textgray}{RGB}{80, 80, 80}
\definecolor{maingray}{RGB}{180, 180, 180}

\colorlet{fillheader}{darkblue}
\colorlet{headercolor}{darkblue}

%----------------------------------------------------------------------------------------
% MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\renewcommand{\bfseries}{\color{darkblue}}
\pagestyle{empty}
\setlength{\parindent}{0pt}

%----------------------------------------------------------------------------------------
% SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength}
\newlength{\SectionTitleLength}
\newcommand{\profilesection}[1]{%
    \setlength\TotalSectionLength{\linewidth}%
    \settowidth{\SectionTitleLength}{\huge #1 }%
    \addtolength\TotalSectionLength{-\SectionTitleLength}%
    \addtolength\TotalSectionLength{-2.22221pt}%
    \vspace{8pt}%
    {\color{darkblue} \huge #1
\rule[0.15\baselineskip]{\TotalSectionLength}{2pt}}%
}

% Custom commands for new sections
\newcommand{\technicaltools}[1]{\renewcommand{\technicaltools}{#1}}
\newcommand{\technicalskills}[1]{\renewcommand{\technicalskills}{#1}}
\newcommand{\softsklls}[1]{\renewcommand{\softsklls}{#1}}
\newcommand{\linkedin}[1]{\renewcommand{\linkedin}{#1}}

\newcommand{\birth}[1]{\renewcommand{\birth}{#1}}
\newcommand{\mail}[1]{\renewcommand{\mail}{#1}}
\newcommand{\phonenumber}[1]{\renewcommand{\phonenumber}{#1}}
\newcommand{\address}[1]{\renewcommand{\address}{#1}}
\newcommand{\site}[1]{\renewcommand{\site}{#1}}
\newcommand{\profile}[1]{\renewcommand{\profile}{#1}}
\newcommand{\languages}[1]{\renewcommand{\languages}{#1}}
\newcommand{\skills}[1]{\renewcommand{\skills}{#1}}

% Command for printing icons with accessible colors
\newcommand*\icon[1]{%
    \tikz[baseline=(char.base)]{%
        \node[ shape=circle,
              draw,
              inner sep=1pt,
              fill=mediumblue,
              mediumblue,
              text=white
             ] (char) {#1};%
    }%
}

% Command for printing knowledge text (FORMATO COMPACTO)
\newcommand\knowledge[1]{
    \renewcommand{\knowledge}{
        \begin{flushleft}
            \normalsize
            % Imprime todo el texto de conocimiento como un solo párrafo
            #1
        \end{flushleft}
    }
}

%----------------------------------------------------------------------------------------
% SIDEBAR LAYOUT - POSICIÓN OPTIMIZADA
%----------------------------------------------------------------------------------------

\newcommand{\sidebar}{
    \begin{tikzpicture}[remember picture,overlay]
        \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.5cm,
minimum height=\paperheight+1cm] (box) at (-5cm,0.15cm){};
    \end{tikzpicture}
    
    % POSICIÓN VERTICAL OPTIMIZADA - Sube el sidebar 1.5cm
    \begin{textblock}{6}(0.5, 2.5) 
        \profilesection{Información}\newline
        
        \renewcommand{\arraystretch}{1.6}
        \footnotesize 
        \begin{tabular}{p{0.5cm} @{\hskip 0.2cm}p{5.3cm}} 
            \ifthenelse{\equal{\birth}{}}{}{\textsc{\Large\icon{\Info}} &
\birth\\}
            \ifthenelse{\equal{\phonenumber}{}}{}{\textsc{\Large\icon{\Telefon}}
& \phonenumber\\}
            \ifthenelse{\equal{\site}{}}{}{\textsc{\Large\icon{\Mundus}} &
\href{\site}{\site}\\}
            \ifthenelse{\equal{\linkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}}
& \href{\linkedin}{\linkedin}\\}
            \ifthenelse{\equal{\mail}{}}{}{\textsc{\large\icon{@}} &
\href{mailto:\mail}{\mail}\\}
            
\ifthenelse{\equal{\address}{}}{}{\vspace{-7pt}\textsc{\Large\icon{\faGithub}}
& \href{\address}{\address}\\}
        \end{tabular}
        
        \ifthenelse{\equal{\profile}{}}{}{
            \newline\newline
            \profilesection{Perfil}
            \justify
            \profile
        }%
        
        % INICIO CONOCIMIENTOS (FORMATO COMPACTO)
        \begin{flushleft}
            \profilesection{Conocimientos}
        \end{flushleft}
        \knowledge
        % FIN CONOCIMIENTOS
        
        \ifthenelse{\equal{\technicaltools}{}}{}{
            \begin{flushleft}
                % ESPACIO REDUCIDO ENTRE CONOCIMIENTOS Y HERRAMIENTAS
                \profilesection{Herramientas}
                \newline\newline
                \normalsize{\technicaltools}
            \end{flushleft}
        }
        
        % SECCIÓN HABILIDADES TÉCNICAS ELIMINADA
        
        % SECCIÓN SOFT SKILLS MANTENIDA
        \ifthenelse{\equal{\softsklls}{}}{}{
            \begin{flushleft}
                \vspace{0.3cm}
                \profilesection{Soft Skills}
                \newline\newline
                \normalsize{\softsklls}
            \end{flushleft}
        }

        \ifthenelse{\equal{\languages}{}}{}{
            \begin{flushleft}
                \vspace{0.3cm}
                \profilesection{Idiomas}
                \newline\newline
                \normalsize{\languages}
            \end{flushleft}
        }
        
    \end{textblock}
}

%----------------------------------------------------------------------------------------
% COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\newcommand*\round[2]{%
    \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle,
    line width=1mm, inner xsep=10pt, minimum size=5.2mm, minimum width=13cm,
    minimum height=0.3cm, text height=0.3cm, text width=13cm,
    fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
    {%
        \round{#1}{
            \ifcase\value{colorCounter}%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\or%
            darkblue\else%
            darkblue\fi%
        }%
    }%
    \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
    {%
        \color{darkblue}%
        \Large\sectioncolor{#1}%
    }
}

\renewcommand{\subsection}[1]{
    \par\vspace{.5\parskip}{%
        \large\color{darkblue} #1%
    }
    \par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
% LIST ENVIRONMENTS
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

\newenvironment{biglist}{%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
    \end{tabular*}
}

\newcommand{\biglistitem}[4]{%
    #1&\parbox[t]{0.83\textwidth}{%
        \textbf{\MakeUppercase{#2}}%
        \hfill%
        {\footnotesize#3}\\%
        #4\vspace{2pt}%
    }\\[2pt]
}

\newenvironment{shortlist}{%
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
    \end{tabular*}
}

\newcommand{\shortlistitem}[4]{%
    #1&\parbox[t]{0.83\textwidth}{%
        \textbf{\MakeUppercase{#2}}%
        \hfill%
        {\footnotesize#3}\\%
        #4\vspace{\parsep}%
    }\\
}

%----------------------------------------------------------------------------------------
% MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
% HEADER - ALTURA OPTIMIZADA (Reducida de 4cm a 3cm)
%----------------------------------------------------------------------------------------

\newcommand{\header}[2]{%
    \begin{tikzpicture}[remember picture,overlay]
        \node [rectangle, fill=fillheader, anchor=north, minimum
width=\paperwidth, minimum height=2.5cm] (box) at (current page.north){};
        \node [rectangle, line width=1mm, minimum height=1.1cm, inner
xsep=20pt, draw=white, anchor=south] (name) at (box) {%
            \vspace{20pt}
            \color{white}%
            {\HUGE #1}
        };
        \node [anchor=north] (sub) at (name.south) {%
            \color{white}%
            \Large \MakeUppercase{#2}%
        };
    \end{tikzpicture}
    % Espacio vertical optimizado - Reducido de 4.5cm a 3.2cm
    \vspace{2cm} 
    \vspace{-2\parskip}
}