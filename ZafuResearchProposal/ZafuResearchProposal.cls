

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ZafuResearchProposal}[Thesis for Zafu By myh]
%12pt表示正文字号大小,ctexbook、ctexart文档类默认会将章节标题以及目录居中排版
\LoadClass[10.5pt, a4paper, UTF8]{ctexart}

%页面设置：上：2.54；下：2.54；左：3.17；右：3.17；页眉：0；页脚：0
\RequirePackage[top=3.1cm, bottom=2.54cm,outer=2.78cm, inner=2.96cm, headheight=0 cm, footskip=0 cm, heightrounded]{geometry}

%正文字体宋体五号，对映10.5pt
\setmainfont{Times New Roman}
\setCJKmainfont{宋体}

%=================================↓↓封面↓↓=================================%

\newtoks \academy
\newtoks \session
\newtoks \studentNumber
\newtoks \myClass
\newcommand{\teacher}[2]{\def\@teacher{#1}\def\@position{#2}}

\RequirePackage{makecell}
\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage{booktabs} %调整表格线与上下内容的间隔
\RequirePackage{fontspec}

\RequirePackage{graphicx}
\RequirePackage{calc} %支持计算的宏包

\def\Zafu@underline[#1]#2{\underline{\hbox to #1{\hfill#2\hfill}}}
\def\Zafuunderline{\@ifnextchar[\Zafu@underline\underline}

%开题报告封面
\newcommand{\proposalCover}
{
    {
        \clearpage
        \thispagestyle{empty}
        \newgeometry{top=1.37cm, bottom=0.83cm, outer=2.5cm, inner=2.5cm}
        \graphicspath{{../thesis/figures/}}
    
        \raisebox{1.3cm}{}
        \begin{figure}[htbp]
            \centering\includegraphics[width=2.8cm]{zafuLogo}
            \raisebox{0.5cm}
            {
                \centering\includegraphics[height=1.8cm]{zafu}
            }
        \end{figure}
    
    
        \centering
        \raisebox{0.45cm}{}
        \heiti\zihao{-1}\bfseries 本\hspace{0.18em} 科\hspace{0.18em} 生\hspace{0.18em} 毕\hspace{0.18em} 业\hspace{0.18em} 论\hspace{0.18em} 文\hspace{0.18em} （\hspace{0.18em} 设\hspace{0.18em} 计\hspace{0.18em} ）\\
        \raisebox{1.9cm}{}
        \heiti\zihao{-1}{开题报告（含文献综述）}\\
        \raisebox{1.9cm}{}
        (\hspace{0.18em} \the\session\hspace{0.18em} 届\hspace{0.18em})\\
        \raisebox{2.8cm}{}
        
    
        \newcounter{title_str_number}
    
        %将单元格的间距设为0
        \setlength{\tabcolsep}{0pt}
        \renewcommand{\arraystretch}{0.8}
        {
            \begin{tabular}{p{3.5cm} p{7cm}}
                \forloop{title_str_number}{1}{\value{title_str_number}<6}
                {
                    %首先将 title_str_number 转换为字符串
                    \StrGobbleRight{\arabic{title_str_number}}{0}[\titleStrNumString]
                    \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]    
        
                    \IfStrEq{\titleStrNumString}{1}
                    {
                        \IfStrEq{\mygroup}{}{}
                        {
                            \centering
                            {\songti\bfseries\zihao{3} 题\qquad 目：}&
                            {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\Zafuunderline[320pt]{\songti \zihao{3}\mygroup}}\\[0.40cm]
                        } 
                        
                    }
                    {
                        \IfStrEq{\mygroup}{}{}
                        {
                            {}&
                            {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\Zafuunderline[320pt]{\songti \zihao{3}\mygroup}}\\[0.40cm]
                        } 
                    }                    
                    
                }
        
                \centering
                {\songti\bfseries\zihao{3} 学生姓名：}&
                {\Zafuunderline[320pt]{\songti\zihao{3}\@author}} \\[0.40cm]
        
                \centering
                {\songti\bfseries\zihao{3} 学\qquad 号：}&
                {\Zafuunderline[320pt]{\fontspec{Times New Roman}\zihao{3}\the\studentNumber}} \\[0.40cm]
                
                \centering
                {\songti\bfseries\zihao{3} 专业班级：}&
                {\Zafuunderline[320pt]{\songti\zihao{3}\the\myClass}} \\[0.40cm]
        
                \centering
                {\songti\bfseries\zihao{3} 指导教师：}&
                    \multicolumn{1}{@{}c@{}}
                    {                
                        \begin{tabular}{p{125pt}p{50pt}p{145pt}}            
                            \centering\Zafuunderline[125pt]{\songti\bfseries\zihao{3}\@teacher}
                            &\centering\songti\bfseries\zihao{3} 职称：
                            &\centering\songti\bfseries\zihao{3} \centering\Zafuunderline[145pt]{\songti\bfseries\zihao{3}\@position}
                        \end{tabular}
                    }
            \end{tabular}
        }
    
        \vspace{66pt}
        \songti\bfseries\zihao{3}\@date    
        \restoregeometry
        }        
}

%=================================↓↓正文↓↓=================================%
%开题报告正文样式
\RequirePackage{fancyhdr}  % 页眉页脚
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}

\fancypagestyle{mainmatterstyle}
{
    \clearpage
    \restoregeometry
    \pagestyle{empty}

}
\appto\mainmatter{\pagestyle{mainmatterstyle}}

%正文行间距约为20pt，字体宋体五号
\appto\mainmatter{\setlength{\baselineskip}{20pt}\selectfont}

%=================================↓↓章节↓↓=================================%

\RequirePackage{titlesec}
\RequirePackage{fontspec}
\RequirePackage{longtable}

% 将secnumdepth计数器设置为四以获得段落的编号
\setcounter{secnumdepth}{4}

% 定义 \section 命令
\titleformat{\section}{\raggedright\zihao{5}\bfseries\heiti}
{\hspace{0em}\thesection}{0em}{、}
\titlespacing{\section}{0pt}{6.2pt}{0pt}

% 定义 \subsection 命令
\titleformat{\subsection}{\raggedright\zihao{-4}\bfseries\heiti}
{\hspace{0em}\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6.2pt}{0pt}

% 定义 \subsubsection 命令
\titleformat{\subsubsection}{\raggedright\zihao{5}\bfseries\heiti}
{\hspace{0em}\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6.2pt}{0pt}

% 定义 \paragraph 命令,10号字体约等于small
\titleformat{\paragraph}{\small\bfseries\songti}
{\hspace{0em}\theparagraph}{0.5em}{}
\titlespacing{\paragraph}{0pt}{6.2pt}{0pt}

% 重新定义新命令
\let\MyParagraph\paragraph
\renewcommand{\paragraph}[1]{%
    % 在新命令前面添加垂直空白
    \vspace{2.4pt}%
    % 调用原始的 \paragraph 命令
    \MyParagraph{#1}%
}

\RequirePackage[most]{tcolorbox}
\newenvironment{RPSectionBox}{%
  \vspace{-2pt}
  \setlength{\baselineskip}{20pt}\selectfont
  \begin{tcolorbox}%
  [%  
    colframe=black,
    colback=white,
    width=\textwidth,
    boxrule=1pt,
    left=6pt,
    right=6pt,
    top=6pt,
    bottom=6pt,
    before skip=0pt,
    after skip=0pt,
    breakable,
    arc=0pt,
  ]%
  \setlength{\parskip}{0cm}
  \setlength{\parindent}{1.8em}
  \setlength{\baselineskip}{20pt}
}{%
  \end{tcolorbox}%
}