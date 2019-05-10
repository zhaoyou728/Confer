%#!pdflatex test-ssjiss
% #!ptex2pdf -l -u -ot '-synctex=1' test-ssjiss
\NeedsTeXFormat{LaTeX2e}[1995/12/01]%
%% on LaTeX2e 2011/06/27 v1.0m LaTeX Kernel
\ProvidesClass{ssjiss}
%% based on 2016/01/01 v2.1 Green Cherry Ltd. B5 article pLaTeX class
%% based on ujarticle.cls 2011/05/07 v1.6_u00 Standard upLaTeX class
  [2016/10/31 v1.0  SSJ/ISS LaTeX class]

%% fixes to LaTeX2e for TL14 or lower version
\RequirePackage{fix-cm}[2006/09/13 v1.1m]
\RequirePackage{fixltx2e}[2006/09/13 v1.1m]

% \RequirePackage{keyval}

\def\grnchry@error{\ClassError{ssjiss}}
\def\grnchry@warning{\ClassWarning{ssjiss}}
\def\grnchry@warningnoline{\ClassWarningNoLine{ssjiss}}
\def\grnchry@info{\ClassInfo{ssjiss}}

\long\def\@ifempty#1{\@xifempty#1@@..\@nil}
\long\def\@xifempty#1#2@#3#4#5\@nil{%
  \ifx#3#4\expandafter\@firstoftwo\else\expandafter\@secondoftwo\fi}
\long\def\@ifnotempty#1{\@ifempty{#1}{}}
\newcommand\@nonmath[1]{\toks@\@emptytoks
  \expandafter\@skipmath\expandafter\@empty#1$$%
  \edef#1{{\noexpand\protect\the\toks@}}%
}
\newcommand{\@skipmath}{}
\long\def\@skipmath#1$#2${%
  \@xskipmath#1\(\)%
  \@ifnotempty{#2}{\toks@\expandafter{\the\toks@$#2$}\@skipmath\@empty}}%
\newcommand{\@xskipmath}{}
\long\def\@xskipmath#1\(#2\){%
  \toks@\expandafter\expandafter\expandafter{\expandafter\the\expandafter\toks@#1}%
  \@ifnotempty{#2}{\toks@\expandafter{\the\toks@\(#2\)}\@xskipmath\@empty}}%
\newtoks\@emptytoks

\let\inhibitglue\relax

\newif\if@hanmen \@hanmenfalse
\newif\if@restonecol
\DeclareOption{hanmen}{\@hanmentrue}
\DeclareOption{twoside}{\@twosidetrue \@mparswitchtrue}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
    \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
    \renewcommand\newblock{\par}}%
}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% \DeclareOption*{\grnchry@setkey}
% \def\grnchry@setkey{\expandafter\@grnchry@setkey\expandafter{\CurrentOption}}
% \def\@grnchry@setkey{\setkeys{grnchry}}
\def\grnchry@Qnum{14}%Q; 14Q=10pt
%\def\grnchry@Wnum{}
\def\grnchry@Lnum{55}%%(17.5H*(55L -1) +14Q)*.25 = 239.75mm
\def\grnchry@Hnum{17.5}

\ExecuteOptions{twoside,twocolumn,final}
\ProcessOptions\relax

\hoffset\z@ \voffset\z@
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}

%% we load specified fonts package in the preamble
% \RequirePackage[T1]{fontenc}\RequirePackage{textcomp}%T1/TS1
% \RequirePackage{lmodern}%[2009/10/30 v1.6]
% \RequirePackage{newtxtext}%[2016/01/31 v1.465]%requires T1/TS1 (fontenc, textcomp)
% \RequirePackage{newtxmath}%[2016/01/31 v1.465]
\AtBeginDocument{%
\def\ntx@scaled{s*[0.926]}%1/1.08
}

\newdimen\j@Q
\j@Q=0.25mm\relax\let\j@H\j@Q\relax

%% obsolete some old font commands for LaTeX 2.09
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

%% modified ursfs.fd 1998/03/24 rsfs font definition file (jk)
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{%
   <5> <6> rsfs5
   <7> rsfs7
   <8> <9> <10> <10.95> <12> <14.4> <17.28> <20.74> <24.88> rsfs10
   <-> rsfs10
}{}


\newdimen\Cht\newdimen\Cdp\newdimen\Cwd\newdimen\Cvs\newdimen\Chs
\renewcommand{\normalsize}{%10pt
  \@setfontsize\normalsize{\grnchry@Qnum\j@Q}{\grnchry@Hnum\j@H}%
  \abovedisplayskip .5\Cvs \@plus.125\Cvs \@minus.25\Cvs
  \abovedisplayshortskip \z@ \@plus.15\Cvs
  \belowdisplayshortskip .3\Cvs \@plus.15\Cvs \@minus.15\Cvs
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize

\setbox0\hbox{M}
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}

\newcommand{\small}{%9pt
  \@setfontsize\small{12\j@Q}{15\j@H}%
  \abovedisplayskip .4\Cvs \@plus.15\Cvs \@minus.2\Cvs
  \abovedisplayshortskip \z@ \@plus.1\Cvs
  \belowdisplayshortskip .2\Cvs \@plus.1\Cvs \@minus.1\Cvs
  \def\@listi{\leftmargin\leftmargini
              \topsep .2\Cvs \@plus.1\Cvs \@minus.1\Cvs
              \parsep .1\Cvs \@plus.05\Cvs \@minus.05\Cvs
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\newcommand{\footnotesize}{%8pt
  \@setfontsize\footnotesize{11\j@Q}{13.75\j@H}%
  \abovedisplayskip .3\Cvs \@plus.1\Cvs \@minus.2\Cvs
  \abovedisplayshortskip \z@ \@plus.05\Cvs
  \belowdisplayshortskip .15\Cvs \@plus.05\Cvs \@minus.1\Cvs
  \def\@listi{\leftmargin\leftmargini
              \topsep .15\Cvs \@plus.05\Cvs \@minus.1\Cvs
              \parsep .1\Cvs \@plus.05\Cvs \@minus.05\Cvs
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\setlength\topskip{\Cht}
\setlength\headheight{15\j@H}
\setlength\headsep{28\j@H}
\setlength\footskip{40\j@H}
\setlength\maxdepth{.5\topskip}

\setlength\textwidth{175mm}%84mm*2 + 7mm
\setlength\textheight{\grnchry@Lnum\Cvs}
\addtolength\textheight{-\Cvs}\addtolength\textheight{\topskip}
\addtolength\textheight{1\j@H}

\setlength\marginparsep{\z@}
\setlength\marginparwidth{\z@}
\setlength\marginparpush{\z@}

\setlength\oddsidemargin\paperwidth
\addtolength\oddsidemargin{-\textwidth}
\setlength\oddsidemargin{.5\oddsidemargin}
\addtolength\oddsidemargin{-1in}
\setlength\evensidemargin\oddsidemargin

\setlength\topmargin\paperheight
\addtolength\topmargin{-\textheight}
\setlength\topmargin{.5\topmargin}
\addtolength\topmargin{-1in}
\addtolength\topmargin{-\headheight}\addtolength\topmargin{-\headsep}

\setlength\footnotesep{9.8\j@H}%14H*0.7 = 9.8H
\setlength{\skip\footins}{\Cvs \@plus .3333\Cvs \@minus .3333\Cvs}
\setlength\floatsep    {\Cvs \@plus\Cdp \@minus\Cdp}%
\setlength\textfloatsep{1.5\Cvs \@plus\Cdp \@minus\Cdp}%
\setlength\intextsep   {1.5\Cvs \@plus\Cdp \@minus\Cdp}%
\setlength\dblfloatsep    {\Cvs \@plus\Cdp \@minus\Cdp}%
\setlength\dbltextfloatsep{1.5\Cvs \@plus\Cdp \@minus\Cdp}%
\setlength\@fptop{\z@ \@plus 1fil}
\setlength\@fpsep{\z@ \@plus 2fil}
\setlength\@fpbot{\z@ \@plus 1fil}
\setlength\partopsep{\z@}
\def\@listi{\leftmargin\leftmargini
  \topsep\medskipamount \parsep\medskipamount
  \itemsep\parsep}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep \z@ \parsep \z@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep \z@ \parsep \z@
   \itemsep\parsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\let\clone@underline\underline

\setlength\columnsep{7mm}
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\setlength\lineskiplimit{1\p@}
\setlength\normallineskiplimit{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip\z@%default: 0\p@ \@plus \p@}
\setlength\parindent{1.5em}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\renewcommand{\topfraction}{.9}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.85}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\dblfloatpagefraction}{.85}

\if@hanmen
  \def\hanmen@TL{\llap{\smash{%
    \rule[-\headsep]{5mm}{.1\p@}\rule[-\headsep]{.1\p@}{5mm}}}}
  \def\hanmen@TR{\rlap{\smash{%
    \rule[-\headsep]{.1\p@}{5mm}\rule[-\headsep]{5mm}{.1\p@}}}}
  \def\hanmen@BL{\llap{\smash{%
    \raisebox{\footskip}{\rule{5mm}{.1\p@}\rule[-5mm]{.1\p@}{5mm}}}}}
  \def\hanmen@BR{\rlap{\smash{%
    \raisebox{\footskip}{\rule[-5mm]{.1\p@}{5mm}\rule{5mm}{.1\p@}}}}}
\else
  \let\hanmen@TL\relax \let\hanmen@TR\relax
  \let\hanmen@BL\relax \let\hanmen@BR\relax
\fi

\def\ps@plain{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@plain
  \def\@oddhead{\hanmen@TL\hfil\hanmen@TR}%
  \def\@oddfoot{\hanmen@BL\hfil{\ps@nombre@font\thepage}\hfil\hanmen@BR}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot}
\let\ps@jpl@in\ps@plain
\def\ps@empty{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@empty
  \def\@oddhead{\hanmen@TL\hfil\hanmen@TR}%
  \def\@oddfoot{\hanmen@BL\hfil\hanmen@BR}%
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot}
\def\ps@headnombre{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\hanmen@TL{\ps@nombre@font\thepage}\hfil\hanmen@TR}%
  \def\@oddhead{\hanmen@TL\hfil{\ps@nombre@font\thepage}\hanmen@TR}%
  \def\@oddfoot{\hanmen@BL\hfil\hanmen@BR}%
  \let\@evenfoot\@oddfoot}
\def\ps@footnombre{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@footnombre
  \def\@evenfoot{\hanmen@BL{\ps@nombre@font\thepage}\hfil\hanmen@BR}%
  \def\@oddfoot{\hanmen@BL\hfil{\ps@nombre@font\thepage}\hanmen@BR}%
  \def\@oddhead{\hanmen@TL\hfil\hanmen@TR}%
  \let\@evenhead\@oddhead}

\newcommand{\ps@nombre@font}{\reset@font
  \sffamily\small}
\newcommand{\ps@header@font}{\reset@font
  \small}

\def\ps@issbothstyle{\let\@mkboth\@gobbletwo
  \let\ps@jpl@in\ps@plain
  \def\@oddhead{\hanmen@TL\hfil
    {\ps@header@font\rightmark}\hfil\hanmen@TR}%
  \def\@evenhead{\hanmen@TL\hfil
    {\ps@header@font\leftmark}\hfil\hanmen@TR}%
  \def\@oddfoot{\hanmen@BL\hfil{\ps@nombre@font\thepage}\hfil\hanmen@BR}%
  \let\@evenfoot\@oddfoot
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}

\let\ps@issstyle\ps@empty
\let\ps@titlepage\ps@issstyle

\let\title\relax\let\author\relax\let\date\relax
\let\@title\relax\let\@author\relax\let\@date\relax

\newcommand*{\titleen}[2][]{%
  \gdef\@titleen{#2}%
  \gdef\shorttitleen{#1}%
}
\edef\titleen{\noexpand\@dblarg
  \expandafter\noexpand\csname\string\titleen\endcsname}
\let\title\titleen\relax

\newcommand*{\subtitleen}[1]{\gdef\@subtitleen{#1}}
\let\@subtitleen\@empty
\let\subtitle\subtitleen\relax

\newenvironment{author}{%
  \let\name\nameen\relax
  \ifx\@empty\@addresses
    \g@addto@macro\@addresses{\c@footnote\z@}%
  \else
    \g@addto@macro\@addresses{}%
  \fi
  \ifx\@empty\@emails
    \g@addto@macro\@emails{\c@fnopt\z@}%
  \else
    \g@addto@macro\@emails{}%
  \fi
}{}
\let\@addresses\@empty
\let\@emails\@empty

\newcounter{fnopt}
\def\thefnopt{\expandafter\@fnoptsymbol\csname c@fnopt\endcsname}
\def\@fnoptsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\newcommand*{\nameen}[2][]{%
  \ifx\@empty\namesen
    \gdef\namesen{\mbox{#2}}%
  \else
    \g@addto@macro\namesen{\and\hbox{#2}}%
  \fi
  \@ifnotempty{#1}{%
    \ifx\@empty\shortauthorsen
      \gdef\shortauthorsen{#1}%
    \else
      \g@addto@macro\shortauthorsen{\and#1}%
    \fi
  }%
}
\edef\nameen{\noexpand\@dblarg
  \expandafter\noexpand\csname\string\nameen\endcsname}
\let\namesen\@empty
\let\shortauthorsen\@empty

\newcommand*\address[2]{%
  \g@addto@macro\namesen{\address{#1}{#2}}%
}

\newcommand*{\email}[2]{%
  \g@addto@macro\namesen{\email{#1}{#2}}%
}

\newcommand*\addressref[1]{%
  \g@addto@macro\namesen{\addressref{#1}}%
}

\newcommand*\emailref[1]{%
  \g@addto@macro\namesen{\emailref{#1}}%
}

\newcommand*{\namelinebreak}{%
  \g@addto@macro\namesen{\namelinebreak}}

\newcommand{\xandlist}[4]{\@andlista{{#1}{#2}{#3}}#4\and\and}
\def\@andlista#1#2\and#3\and{\@andlistc{#2}\@ifnotempty{#3}{%
  \@andlistb#1{#3}}}
\def\@andlistb#1#2#3#4#5\and{%
  \@ifempty{#5}{%
    \@andlistc{#2#4}%
  }{%
    \@andlistc{#1#4}\@andlistb{#1}{#3}{#3}{#5}%
  }}
\let\@andlistc\@iden

\newcommand{\nxandlist}[4]{%
  \def\@andlistc##1{\toks@\expandafter{\the\toks@##1}}%
  \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
  \the\expandafter\toks@#4\and\and
  \edef#4{\the\toks@}%
  \let\@andlistc\@iden}

\def\@@and{and}

\newcommand{\andify}{%
  \nxandlist{\unskip, }{\unskip{} \@@and~}{\unskip, \@@and~}}
\def\and{\unskip{ }\@@and{ }\ignorespaces}
\def\nameen@andify{%
  \nxandlist {\unskip ,\penalty-1 \space\ignorespaces}%
    {\unskip {} \@@and~}%
    {\unskip ,\penalty-2 \space \@@and~}%
}

\newcommand{\maketitle}{\par
  \@topnum\z@%
  \thispagestyle{titlepage}%
  \let\shorttitle=\shorttitleen
  \let\shortauthors=\shortauthorsen
  \@nonmath\shorttitle
  \ifx\@empty\shortauthors
    \let\shortauthors\shorttitle
  \else
    \andify\shortauthors
  \fi
  \twocolumn[\@maketitle]%
  \begingroup
    \def\@makefnmark{\hbox{}\hbox{%
      \@textsuperscript{\footnotemark@font\@thefnmark}}\hbox{}}%
    \@addresses
    \@emails
  \endgroup
  \markboth{\expandafter{\shortauthors}}{\expandafter{\shorttitle}}%
  \c@footnote\z@
  \@cleartopmattertags
}

\def\@cleartopmattertags{%
  \def\do##1{\let##1\relax}%
  \do\maketitle \do\@maketitle
  \do\titleen \do\@titleen \do\subtitleen \do\@subtitleen
  \do\nameen \do\@xnameen
  \do\address \do\@xaddress \do\addressref
  \do\email \do\@xemail \do\emailref
}

\def\@maketitle{\null\begingroup
  \def\namelinebreak{%
    ,\penalty-\@lowpenalty%%add a comma and break a line
    \@gobbletwo%%remove \and
    }%
  \def\@makefnmark{\hbox{}\hbox{%
    \@textsuperscript{\footnotemark@font\@thefnmark}}\hbox{}}%
  %%
  \def\address##1##2{\footnotemark%
    \g@addto@macro\@addresses{%
      \advance\c@footnote\@ne\relax
      \footnotetext{\label{addr@##1}##2}}}%
  \def\email##1##2{\kern\z@
    \advance\c@fnopt\@ne\relax
    \@textsuperscript{\footnotemark@font\thefnopt}%
    \g@addto@macro\@emails{%
      \advance\c@fnopt\@ne\relax
      \let\thefootnote\thefnopt
      \footnotetext{\label{email@##1}E-mail address: ##2}}}%
  \def\addressref##1{\kern\z@
    \@textsuperscript{\footnotemark@font\ref{addr@##1}}}%
  \def\emailref##1{\kern\z@
    \@textsuperscript{\footnotemark@font\ref{email@##1}}}%
  %%
  \parindent\z@
  \boxmaxdepth\z@
  \lineskiplimit\z@
  \lineskip\z@
  \reset@font
  \nameen@andify\namesen
  \setbox\@tempboxa\vbox\bgroup
    \begingroup
      \trivlist
        \centering\item\relax
        \vskip\Cvs
        \bgroup
          \let\\\endgraf \let\newline\endgraf \let\par\endgraf%%a line-break trick
          \titleen@font\expandafter\expandafter\expandafter
            \MakeUppercase\expandafter{\@titleen}\@@par%%
        \egroup
        \ifx\@empty\@subtitleen\else
          \vskip.25\Cvs
          \bgroup
            \let\\\endgraf \let\newline\endgraf \let\par\endgraf%%a line-break trick
            \subtitleen@font\expandafter\expandafter\expandafter
              \MakeUppercase\expandafter{---\relax\@subtitleen\relax---}\@@par%%
          \egroup
        \fi
        \vskip\Cvs
        {\nameen@font\namesen\par}%
      \endtrivlist
    \endgroup
    \vspace*{.5\Cvs}%
    \begingroup
      \trivlist
        \leftskip4em \rightskip\leftskip
        \abstract@font
        \item\relax
        \unhbox\abstract@box
        \vskip.5\baselineskip
        \unhbox\keywords@box
      \endtrivlist
    \endgroup
  \egroup
  \@tempdima\ht\@tempboxa
  \advance\@tempdima\dp\@tempboxa \divide\@tempdima\Cvs
  \@tempcnta\@tempdima \advance\@tempcnta\thr@@
  \vbox to \@tempcnta\Cvs{%
    \vskip-\topskip
    \box\@tempboxa
  \vss}%
\endgroup\nobreak}

\def\titleen@font{\reset@font
  \bfseries\large\selectfont\mathversion{bold}%
}
\def\subtitleen@font{\reset@font
  \bfseries\selectfont\mathversion{bold}%
}
\def\nameen@font{\reset@font}

\def\abstract@font{\reset@font
  \small\selectfont}

\newbox\abstract@box
\newenvironment{abstract}{%
  \global\setbox\abstract@box\hbox\bgroup
    \abstract@font
    {\bfseries\abstractname.}%
    \hspace*{.5em}%
    \ignorespaces
}{\egroup}

\newbox\keywords@box
\newenvironment{keywords}{%
  \global\setbox\keywords@box\hbox\bgroup
    \abstract@font
    {\bfseries\keywordsname.}%
    \hspace*{.5em}%
    \ignorespaces
}{\egroup}

\setcounter{secnumdepth}{3}

\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
  \thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{%
  \thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{%
  \theparagraph.\@arabic\c@subparagraph}

%% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindentfalse
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty
    \ifdim \@tempskipa >\z@
      \ifnum#2=\@ne
        \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
        \advance\@tempskipa-2\Cvs
        \vspace{\Cvs}%
        \vspace*{\@tempskipa}%
      \else\ifnum#2=\tw@
        \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
        \advance\@tempskipa-2\Cvs
        \vspace{\Cvs}%
        \vspace*{\@tempskipa}%
      \else\ifnum#2=\thr@@
        \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
        \advance\@tempskipa-2\Cvs
        \vspace{\Cvs}%
        \vspace*{\@tempskipa}%
      \else
        \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
        \advance\@tempskipa-\Cvs
        \vspace*{\@tempskipa}%
      \fi\fi\fi
    \fi
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\@seccntformat#1{\csname the#1\endcsname.\quad}

%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      \interlinepenalty\@M
      #6{%
         \@hangfrom{\hskip #3\relax\@svsec}%
         \ifnum#2=\@ne
           \MakeUppercase{\inhibitglue #8}\@@par
         \else
           \inhibitglue #8\@@par
         \fi
        }%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%% \@xsect{AFTERSKIP}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}

%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \interlinepenalty\@M
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
        \inhibitglue #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}

\def\newpage{%
  \if@noskipsec
    \ifx \@nodocument\relax
      \leavevmode
      \global \@noskipsecfalse
    \fi
  \fi
  \if@inlabel
    \leavevmode
    \global \@inlabelfalse
  \fi
  \if@nobreak
    \@nobreakfalse
    \everypar{%
      %default: (none)
    }%
  \fi
  \par
  \vfil
  \penalty -\@M}

\def\@doendpe{%
  \@endpetrue
  \def\par{%
    \@restorepar
    \everypar{%
      \if@nobreak\else
        \clubpenalty\@clubpenalty%\z@, \@clubpenalty
      \fi
      %default: (none)
    }%
    \par\@endpefalse}%
  \everypar{%
    {\setbox\z@\lastbox}%
    \if@nobreak \else
      \clubpenalty\@clubpenalty%\z@, \@clubpenalty
    \fi
    \everypar{%
      %default: (none)
    }%
    \@endpefalse
    %default: (none)
  }%
}

\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\@clubpenalty%\z@, \@clubpenalty; default: \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}}

\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\@clubpenalty%\z@, \@clubpenalty; default: \@M
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces
  \inhibitglue%default: (none)
}

\def\secthead@font{\reset@font
  \bfseries\fontsize{15\j@Q}{\Cvs}\mathversion{bold}}

\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {1.6\Cvs \@plus\z@ \@minus.4\Cdp}%
   {.4\Cvs \@plus\z@ \@minus.2\Cdp}%
   {\reset@font\secthead@font}}

\def\subsecthead@font{\reset@font
  \bfseries\mathversion{bold}}

\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {\Cvs \@plus\z@ \@minus.2\Cdp}%
   {.00001\Cvs \@plus\z@ \@minus.1\Cdp}%
   {\reset@font\subsecthead@font}}

\def\subsubsecthead@font{\reset@font
  \bfseries\mathversion{bold}}

\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {\Cvs \@plus\z@ \@minus.2\Cdp}%
   {.00001\Cvs \@plus\z@ \@minus.1\Cdp}%
   {\reset@font\subsubsecthead@font}}

\def\parahead@font{\reset@font
  \bfseries\mathversion{bold}}

\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {.5\Cvs \@plus\z@ \@minus.2\Cdp}%
   {-1em}%
   {\reset@font\parahead@font}}

\def\subparahead@font{\reset@font
  \sffamily}

\newcommand{\subparagraph}{\@startsection{paragraph}{5}{\z@}%
   {.5\Cvs \@plus\z@ \@minus.2\Cdp}%
   {-1em}%
   {\reset@font\subparahead@font}}

\newcommand{\appendix}{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand{\thesection}{\@Alph\c@section}%
}

\setlength\leftmargini {2em}
\setlength\leftmarginii  {2em}
\setlength\leftmarginiii {2em}
\setlength\leftmarginiv  {2em}
\setlength\leftmarginv {1em}
\setlength\leftmarginvi{1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty\z@ %default: -\@lowpenalty
\@endparpenalty\z@   %default: -\@lowpenalty
\@itempenalty\z@     %default: -\@lowpenalty

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
         \ifnum\@enumdepth=\@ne
           \topsep\smallskipamount \parsep\z@
         \else
           \topsep\z@ \parsep\z@
         \fi
         \parskip\z@ \itemsep\z@
         %\settowidth\labelwidth{\csname label\@enumctr\endcsname}
         \labelwidth2em \labelsep.5em
         \leftmargin\labelwidth
         \listparindent\z@
         \clubpenalty\z@
         \widowpenalty\z@
         \@itempenalty\z@
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newcommand{\labelitemi}{\leavevmode
  \hbox to 1.5em{\hss\textbullet\hss}%
}
\newcommand{\labelitemii}{\leavevmode
  \hbox to 1.5em{\hss\textendash\hss}%
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}

\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \list{\csname \@itemitem\endcsname}{%
         \ifnum\@itemdepth=\@ne
           \topsep\smallskipamount \parsep\z@
         \else
           \topsep\z@ \parsep\z@
         \fi
         \parskip\z@ \itemsep\z@
         \labelwidth1.5em
         \leftmargin1.5em
         \listparindent1.5em
         \labelsep\z@
         \clubpenalty\z@
         \widowpenalty\z@
         \@itempenalty\z@
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newenvironment{description}
  {\list{}{%
     \topsep\smallskipamount \parsep\z@
     \parskip\z@ \itemsep\z@
     \labelwidth\z@ \itemindent-\leftmargin
     \let\makelabel\descriptionlabel
  }}{\endlist}

\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}

\newenvironment{verse}
  {\let\\\@centercr
   \list{}{%
     \itemindent2em
     \listparindent\itemindent
     \rightmargin\leftmargin
     \advance\leftmargin2em
  }%
  \item\relax}{\endlist}

\newenvironment{quotation}
  {\list{}{%
     \topsep\smallskipamount \parsep\z@
     \parskip\z@ \itemsep\z@
     \listparindent1em
     \itemindent\listparindent
     \rightmargin\z@
     \leftmargin2em
  }%
  \item\relax}{\endlist}

\newenvironment{quote}
  {\list{}{%
     \topsep\smallskipamount \parsep\z@
     \parskip\z@ \itemsep\z@
     \rightmargin\z@
     \leftmargin2em
  }%
  \item\relax}{\endlist}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\kern.33333em\thefigure}
\newenvironment{figure}
  {\float@setup
   \abovecaptionskip4\j@H \belowcaptionskip2\j@H \captionwidth\hsize
   \@float{figure}}
  {\end@float}
\newenvironment{figure*}
  {\float@setup
   \abovecaptionskip4\j@H \belowcaptionskip2\j@H \captionwidth\textwidth
   \@dblfloat{figure}}
  {\end@dblfloat}

\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\kern.33333em\thetable}
\newenvironment{table}
  {\float@setup
   \abovecaptionskip2\j@H \belowcaptionskip4\j@H \captionwidth\hsize
   \@float{table}}
  {\end@float}
\newenvironment{table*}
  {\float@setup
   \abovecaptionskip2\j@H \belowcaptionskip4\j@H \captionwidth\textwidth
   \@dblfloat{table}}
  {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\newlength\captionwidth

\def\float@setup{%
  \let\center\float@center \let\endcenter\endfloat@center
}

\def\float@center{%
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
  \trivlist \centering\item\relax}
\def\endfloat@center{\endtrivlist}

\long\def\@caption#1[#2]#3{%
  \par
  % \addcontentsline{\csname ext@#1\endcsname}{#1}%
  %   {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \small
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\def\@floatboxreset{%
  \reset@font
  \small
  \setlength\tabcolsep{.5em}%
  \@setminipage
}

\def\caption@font{\reset@font
  \small\selectfont}

\def\captionnum@font{\reset@font
  \bfseries\small\selectfont}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \def\caption@z@one@skip{1em}%
  \caption@font
  \setbox\z@=\hbox{\let\newline\cr\relax
    {\captionnum@font #1}\hskip\caption@z@one@skip%
    \shortstack[l]{\inhibitglue #2}}%
  \setbox\@ne=\hbox{{\captionnum@font #1}\hskip\caption@z@one@skip}%
  \@tempdima\ht\z@ \advance\@tempdima\dp\z@
  \@tempdimb\wd\z@\relax
  \ifdim\wd\z@ > \captionwidth
    \@tempdimb\captionwidth\relax
  \fi
  \ifdim\@tempdima > \baselineskip
    \hfil
    \parbox[t]{\@tempdimb}{%
      \hangindent\wd\@ne
      {\captionnum@font #1}\hskip\caption@z@one@skip\inhibitglue #2}\par
  \else
    \ifdim\wd\z@ > \captionwidth
      \hfil
      \parbox[t]{\@tempdimb}{%
        \hangindent\wd\@ne
        {\captionnum@font #1}\hskip\caption@z@one@skip\inhibitglue #2}\par
    \else
      \hbox to\hsize{\hss\box\z@\hss}\par
    \fi
  \fi
  \vskip\belowcaptionskip
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{.5em}
\setlength\arrayrulewidth{.12mm}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}

\skip\@mpfootins = \skip\footins

\setlength\fboxsep{.5em}
\setlength\fboxrule{.12mm}

\renewcommand{\theequation}{\@arabic\c@equation}

\newdimen\bibindent
\setlength\bibindent{2em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}

\def\bibl@font{\reset@font\small}

\newenvironment{thebibliography}[1]{%
  \section*{\refname}%
  \bibl@font
  \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

\let\@openbib@code\@empty

\def\@biblabel#1{[#1]}%

\AtBeginDocument{\@ifundefined{c@NAT@ctr}{}{%
  \let\citeasnoun\cite
  \let\cite\citep
  \setlength{\bibhang}{2em}%
  \setlength{\bibsep}{\z@}%
  \renewcommand*{\bibfont}{\reset@font\small}%
}}

\newcommand\footnotemark@font{\reset@font}

\def\footnote@font{\reset@font\footnotesize}

\let\clone@footnote\footnote
\let\clone@footnotemark\footnotemark
\def\footnote{\unskip\inhibitglue\penalty\@M\clone@footnote}
\def\footnotemark{\unskip\inhibitglue\penalty\@M\clone@footnotemark}

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}

\renewcommand\@makefnmark{\hbox{}\hbox{%
  \@textsuperscript{\footnotemark@font\lower.5ex\hbox{*}\@thefnmark}}\hbox{}}

\newcommand\@makefntext[1]{%
  \clubpenalty\@M
  \widowpenalty\@M
  \noindent
  \footnote@font
  \setbox\@tempboxa\hbox{\let\@textsuperscript\relax\@makefnmark}%
  \@tempdima 1.25em\relax
  \ifdim\wd\@tempboxa>1em \advance\@tempdima 1em\relax
  \else\ifdim\wd\@tempboxa>.75em \advance\@tempdima .75em\relax
  \fi\fi
  \@hangfrom{\hbox to \@tempdima{\box\@tempboxa\hss}}#1}

\newcommand{\refname}{References}
\newcommand{\figurename}{Fig.}
\newcommand{\tablename}{Table}
\newcommand{\appendixname}{Appendix}
\newcommand{\abstractname}{Abstract}
\newcommand{\keywordsname}{Keywords}


\smallskipamount=.25\Cvs \@plus.3\Cdp \@minus.1\Cdp
\medskipamount  =.5\Cvs \@plus.3\Cdp \@minus.1\Cdp
\bigskipamount  =\Cvs \@plus.3\Cdp \@minus.1\Cdp
\newcommand\halflineskip{\par\vspace*{.5\baselineskip}\par}
\newcommand\onelineskip{\par\vspace*{\baselineskip}\par}


\def\sloppy{%
  \tolerance9999
  \hbadness9999
  \emergencystretch 3em
  \hfuzz .5\p@
  \vfuzz\hfuzz}

\tolerance5000%5000; default: 200
\hbadness5000 %5000; default: 1000
\pretolerance\m@ne%\m@ne; default: 100
\vbadness10001%10001; default: 1000
\clubpenalty\z@ %\z@; default: 150
\widowpenalty\z@%\z@; default: 150


\pagestyle{issstyle}
\pagenumbering{arabic}
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
  \raggedbottom
\fi

%% \AtEndOfClass{%
%% }

%% \AtBeginDocument{%
%% }

%% \AtEndDocument{%
%% }

%% \AtBeginDvi{%
%% }

%% \AtBeginShipout{%
%% }

\listfiles
\endinput
%%
%% End of file `ssjiss.cls'.
