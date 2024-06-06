\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ZafuThesis}[Thesis for Zafu By myh]
%12pt表示正文字号大小,ctexbook、ctexart文档类默认会将章节标题以及目录居中排版
\LoadClass[10.5pt, a4paper, UTF8]{ctexart}
%页面设置：上：2.7；下：2.7；左：2.7；右：2.7；页眉：1.8；页脚：1.85
\RequirePackage[top=2.7cm, bottom=2.7cm,outer=2.7cm, inner=2.7cm, headheight=0.9cm, footskip=0.85cm, heightrounded]{geometry}

\renewcommand{\refname}{\kaishu\zihao{4}\bfseries 参考文献}
%===============================↓↓页面样式↓↓===============================%
\RequirePackage[sort]{gbt7714}%参考文献
\RequirePackage{fancyhdr}  % 页眉页脚
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}

\fancypagestyle{frontmatterstyle}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}

    \fancyfoot{} % clear all footer fields
    \cfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}


\fancypagestyle{abstactstyle}
{
    \clearpage
    \fancyhf{}
    \chead{\songti\bfseries\zihao{-5}浙江农林大学本科生毕业论文（设计）}%
    % Footers    
    \fancyfoot{} % clear all footer fields
    % 页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码
    \cfoot[C]{\zihao{5}\thepage}
    \renewcommand\headrule{ \kern 0.8pt \hrule width \hsize height 0.3pt}
    %改变页眉页脚中的页码样式，改为阿拉伯字体
    \pagenumbering{Roman}
}
\appto\frontmatter{\pagestyle{abstactstyle}}

%正文样式
\RequirePackage{fontspec}
\fancypagestyle{mainmatterstyle}
{
    \clearpage
    \fancyhf{}
    \chead{\songti\bfseries\zihao{-5}浙江农林大学本科生毕业论文（设计）}%
    % Footers    
    \fancyfoot{} % clear all footer fields
    % 页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码
    \cfoot[C]{\zihao{5}\thepage}
    \renewcommand\headrule{ \kern 0.8pt \hrule width \hsize height 0.3pt}
    
    %改变页眉页脚中的页码样式，改为阿拉伯字体
    \pagenumbering{arabic}
}
\appto\mainmatter{\pagestyle{mainmatterstyle}}

%正文行间距20pt，字体宋体五号
\appto\mainmatter{\setlength{\baselineskip}{20pt}\selectfont}

%目录样式
\fancypagestyle{mulu}
{
    \clearpage
    \fancyhf{}
    \chead{\songti\bfseries\zihao{-5}浙江农林大学本科生毕业论文（设计）}%
    % Footers    
    \fancyfoot{} % clear all footer fields
    % 页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码
    \renewcommand\headrule{ \kern 0.8pt \hrule width \hsize height 0.3pt}
}


%=================================↓↓引用↓↓=================================%
\RequirePackage{hyperref}
\hypersetup{CJKbookmarks=true,hidelinks,breaklinks=true,bookmarksopen=false}

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


%毕业设计说明/论文封面
\newcommand{\customCover}
{
    {
    \clearpage
    \thispagestyle{empty}
    \newgeometry{top=1.37cm, bottom=0.83cm, outer=2.5cm, inner=2.5cm}
    \graphicspath{{figures/}}


    \raisebox{2.2cm}{}
    \begin{figure}[htbp]
        \centering\includegraphics[width=2.8cm]{zafuLogo}
        \raisebox{0.5cm}
        {
            \centering\includegraphics[height=1.8cm]{zafu}
        }
    \end{figure}


    \centering
    \raisebox{1.65cm}{}
    \heiti\zihao{-1}\bfseries 本\hspace{0.18em} 科\hspace{0.18em} 生\hspace{0.18em} 毕\hspace{0.18em} 业\hspace{0.18em} 论\hspace{0.18em} 文\hspace{0.18em} （\hspace{0.18em} 设\hspace{0.18em} 计\hspace{0.18em} ）\\
    \raisebox{1.9cm}{}
    (\hspace{0.18em} \the\session\hspace{0.18em} 届\hspace{0.18em})\\
    \raisebox{2cm}{}
    \heiti\zihao{-1}\the\academy\\
    \raisebox{2cm}{}
    

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

    \vspace{45pt}
    \songti\bfseries\zihao{3}\@date

    \restoregeometry
    }    
}
%===============================↓↓诚信承诺书↓↓===============================%
% 导入图片
\newtoks \mysignature
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
\graphicspath{{figures/}}
\newcommand\makestatement
{   
    {
    \clearpage    
    \newgeometry{top=1.37cm, bottom=0.83cm, outer=2.7cm, inner=2.7cm}
    \pagestyle{empty}
    \vbox to 4cm {}
    \centering\includegraphics{zafu}\\
    \vspace{10pt}
    \songti\bfseries\zihao{2} 本科生毕业论文（设计）诚信承诺书
    \heiti\bfseries\zihao{-2}\vspace{4ex}\par
    \songti\raggedright\zihao{4}\mdseries
    \setlength{\baselineskip}{35pt}\hspace{2em}\justifying
    我谨在此承诺：本人所写的毕业论文（设计）《\@title》均系本人独立完成，没有抄袭行为，凡涉及其他作者的观点和材料，均作了引用注释，如出现抄袭及侵犯他人知识产权的情况，后果由本人承担。
    \vspace{6.66cm}\par
    \setlength{\baselineskip}{35pt}

    \centering\songti\zihao{-3}\bfseries\hspace{-3.5cm} 承诺人（签名）： \the\mysignature \\
    \vspace{0.4cm}
    \centering\songti\zihao{-3}\bfseries\@date

    \restoregeometry
    }
}

%=================================↓↓章节↓↓=================================%

%一级标题为段前、段后6磅（或1行）
%其他标题段前、段后均为3磅（或0.5行）
% 一级标题采用楷体加粗四号居中，序号与文字间空1个汉字字符，段前、段后6磅（或1行）；
% 编写为1、2…（理工科类）
% 二级标题采用黑体加粗小四，段前空两个汉字字符，序号与文字间空1个汉字字符，段前、段后3磅（或0.5行）；
% 编写为1.1、1.2…，2.1、2.2…（理工科类）
% 三级标题采用黑体五号，段前空两个汉字字符，序号与文字间空1个汉字字符，段前、段后3磅（或0.5行）；
% 编写为1.1.1、1.1.2…，2.1.1、2.1.2…（理工科类）
% 三级以下标题采用宋体五号，段前空两个汉字字符，序号与文字间空1个汉字字符，段前、段后3磅（或0.5行）；


\RequirePackage{titlesec}

%段落标题的设定
\titlespacing*{\paragraph}{2em}{1pt}{0.5ex plus 0.2ex}

%一级标题；若标题格式中没有指定对齐方式，默认是左对齐
% \def\CTEX@section@format{\kaishu\centering\bfseries\zihao{4}}
\titleformat{\section}{\centering\zihao{4}\bfseries\CJKfamily{zhkai}}
{\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{9.75pt}{9.75pt}
% \def\CTEX@section@beforeskip{6pt}
% \def\CTEX@section@afterskip{6pt}

%二级标题；若标题格式中没有指定对齐方式，默认是左对齐
% \def\CTEX@subsection@format{\heiti\bfseries\zihao{-4}}
\titleformat{\subsection}{\raggedright\zihao{-4}\bfseries\heiti}
{\hspace{1.8em}\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{6.2pt}{4.875pt}
% \def\CTEX@subsection@beforeskip{3pt}
% \def\CTEX@subsection@afterskip{3pt}

%三级标题；若标题格式中没有指定对齐方式，默认是左对齐
% \def\CTEX@subsubsection@format{\heiti\zihao{5}}
\titleformat{\subsubsection}{\raggedright\zihao{5}\mdseries\heiti}
{\hspace{2em}\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{6.2pt}{4.875pt}
% \def\CTEX@subsubsection@beforeskip{3pt}
% \def\CTEX@subsubsection@afterskip{3pt}

%四级标题；若标题格式中没有指定对齐方式，默认是左对齐
% \def\CTEX@subsubsubsection@format{\songti\zihao{5}}
% \titleformat{\subsubsubsection}{\raggedright\small\mdseries\songti}{\thesubsubsubsection}{1em}{}
% \def\CTEX@subsubsubsection@beforeskip{3pt}
% \def\CTEX@subsubsubsection@afterskip{3pt}



% %=================================↓↓目录_学校要求↓↓=================================%
% %“目录”字体修改
% \renewcommand{\contentsname}{\fontsize{22pt}{\baselineskip}\selectfont\textbf{\songti 目\quad 录}}
% \RequirePackage{tocloft}

% %类似的，report类中为chapter补上引导点
% %\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% %section加点
% %调整点的密度
% \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
% %虚线间隔
% \renewcommand\cftdotsep{0.5} 
% %虚线的长
% \renewcommand{\@pnumwidth}{1em}
% % \renewcommand{\@tocrmarg}{3em}
% %设置页码右对齐
% \renewcommand{\cftpnumalign}{r}

% %"目录"的段前段后,2.41倍行间距
% \setlength\cftbeforetoctitleskip{1.46\baselineskip}
% \setlength\cftaftertoctitleskip{1.46\baselineskip}

% %section之间是两倍行距;subsec与sec之间是一倍左右;sub之间是word的20pt
% \setlength{\cftbeforesecskip}{1.2\baselineskip}
% \setlength{\cftbeforesubsecskip}{0.6\baselineskip}
% \setlength{\cftbeforesubsubsecskip}{12pt}
% %\setlength{\cftbeforesubsubsubsecskip}{20pt}

% %目录各项的字体；sec是四号，其他都是小四
% \renewcommand\cftsecfont{\zihao{-4} \songti}
% \renewcommand\cftsubsecfont{\zihao{4} \songti}
% \renewcommand\cftsubsubsecfont{\zihao{4} \songti}            

% %定义目录各项的缩进
% % \RequirePackage{tocloft}
% % \setlength{\cftsecindent}{0cm}
% % \setlength{\cftsubsecindent}{2em}
% % \setlength{\cftsubsubsecindent}{3em}
% %目录序号与内容之间的间距
% \cftsetindents{section}{0em}{1em}
% \cftsetindents{subsection}{2em}{1em}
% \cftsetindents{subsubsection}{3em}{1em}

% \newcommand{\figlabel}{图}
% \newcommand{\tbllabel}{表}
% \newcommand{\customContent}
% {
%     {
%     %强制将所有未处理的浮动体（如图片、表格等）放置到当前页面的结束处，并开始新的一页
%     \clearpage
%     \newgeometry{top=2.37cm, bottom=2.37cm, outer=2.5cm, inner=2.5cm}
%     %设置章节编号的深度。章节编号的深度决定了哪些级别的章节标题会被编号。    
%         \setcounter{secnumdepth}{3}
%         {
%             %当前页面的页面样式设置为空白页，即不显示页眉页脚等内容
%             \pagestyle{empty}
%             \fancypagestyle{plain}
%             {
%                 \fancyhf{}
%                 \renewcommand{\headrulewidth}{0pt}
%                 \renewcommand{\footrulewidth}{0pt}
%             }
%             %将 \thispagestyle{empty} 添加到目录中。这样，在生成目录时，目录页也会应用空白页样式，从而确保目录页也没有页眉页脚
%             \addtocontents{toc}{\protect\thispagestyle{empty}}

%             \centering{\tableofcontents}
%             %当前页面的页面样式设置为空白页
%             \thispagestyle{empty}

%             % % 图表目录标题
%             % \CTEXoptions[listfigurename={图\quad 目\quad 录}]
%             % \CTEXoptions[listtablename={表\quad 目\quad 录}]

%             % % 插图目录
%             % \clearpage
%             % \renewcommand{\numberline}[1]{\figlabel~##1\hspace*{1em}}
%             % \listoffigures
%             % \thispagestyle{empty}

%             % % 表格目录
%             % \clearpage
%             % \renewcommand{\numberline}[1]{\tbllabel~##1\hspace*{1em}}
%             % \listoftables
%             % \thispagestyle{empty}

%         }
%     \restoregeometry
%     }   
% }

%=================================↓↓目录_园林学院要求↓↓=================================%
%“目录”字体修改
\renewcommand{\contentsname}{\fontsize{14pt}{\baselineskip}\selectfont\textbf{\songti 目录}}
\RequirePackage{tocloft}

%类似的，report类中为chapter补上引导点
%\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
%section加点
%调整点的密度
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
%虚线间隔
\renewcommand\cftdotsep{0.5} 
%虚线的长
\renewcommand{\@pnumwidth}{1em}
% \renewcommand{\@tocrmarg}{3em}
%设置页码右对齐
\renewcommand{\cftpnumalign}{r}

%"目录"的段前段后,单倍行间距
\setlength\cftbeforetoctitleskip{\baselineskip}
\setlength\cftaftertoctitleskip{0.35\baselineskip}

%section之间是两倍行距;subsec与sec之间是一倍左右;sub之间是word的20pt
\setlength{\cftbeforesecskip}{3.6pt}
\setlength{\cftbeforesubsecskip}{3.6pt}
\setlength{\cftbeforesubsubsecskip}{3.6pt}
%\setlength{\cftbeforesubsubsubsecskip}{20pt}

%目录各项的字体
\renewcommand\cftsecfont{\zihao{5} \songti}
\renewcommand\cftsubsecfont{\zihao{5} \songti}
\renewcommand\cftsubsubsecfont{\zihao{5} \songti}            



%目录序号与内容之间的间距、各项缩进
\cftsetindents{section}{0cm}{1em}
\cftsetindents{subsection}{2em}{1em}
\cftsetindents{subsubsection}{4em}{1em}


\newcommand{\figlabel}{图}
\newcommand{\tbllabel}{表}
\newcommand{\customContent}
{
    % 设置页眉和页脚
    \fancyhf{} % 清空所有默认页眉和页脚
    \thispagestyle{mulu}
    {
    %强制将所有未处理的浮动体（如图片、表格等）放置到当前页面的结束处，并开始新的一页
    \clearpage
    \newgeometry{top=2.37cm, bottom=2.37cm, outer=2.5cm, inner=2.5cm}
    %设置章节编号的深度。章节编号的深度决定了哪些级别的章节标题会被编号。  
        \setcounter{secnumdepth}{3}
        {
            \thispagestyle{mulu}
            \centering{\tableofcontents}
            \thispagestyle{mulu}
        }

    \restoregeometry
    }   
}

%=================================↓↓摘要↓↓=================================%
% 中文摘要以300-400字为宜。毕业论文（设计）题目字体为宋体，二号，加粗，段前24磅，段后18磅；“中文摘要”居中，字体为黑体，三号；摘要正文字体为宋体，小四号。行间距为固定值20磅。

\newcommand{\ZhAbstract}[2]
{
    {
    % 改变页眉页脚中的页码样式，改为大写罗马字体
    \pagenumbering{Roman}
    
    \clearpage
    \phantomsection
    %不懂。。。
    \newgeometry{top=2.7cm, bottom=2.7cm, outer=2.7cm, inner=2.7cm}

    \addcontentsline{toc}{section}{摘\quad 要}
    \thispagestyle{abstactstyle}

    {
        %22pt
        \setlength{\parskip}{13.3pt}
        \begin{center}
            \zihao{3}\heiti \@title \par
            \zihao{-4}\fangsong \the\myClass \@author \quad 指导老师：\@teacher \par
        \end{center}
    }


    {
        %行距20磅 http://blog.sina.com.cn/s/blog_5e16f1770100ly96.html
        % 空两个黑体字符的距离；摘要内容楷体五号 
        \vspace{-3pt}
        \setlength{\baselineskip}{20pt}
        \noindent\zihao{5}\heiti\hspace{2em}
        {\zihao{5}\heiti\bfseries 摘要：}
        \zihao{5}\kaishu #1
    }


    {
        % 空两个黑体字符的距离；关键词黑体加粗五号，内容楷书五号
        \vspace{12pt}
        \par
        \noindent\zihao{5}\heiti\hspace{2em}
        {\zihao{5}\heiti\bfseries 关键词：}
        \zihao{5}\kaishu #2  
    }



    \restoregeometry
    }
}

% =======english title=========
\newtoks\entitle
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

% 英文摘要实际单词在300个左右，应与中文摘要内容一致。毕业论文（设计）英文题目字体为Times New Roman，二号，段前24磅，段后18磅；“英文摘要”为“Abstract”，字体为Arial，三号，加粗居中；英文摘要正文每段开头空4个字符间隙，字体为Times New Roman，小四号。行间距为固定值20磅。
\newcommand{\EnAbstract}[2]
{
    {
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{ABSTRACT}
    {
        \begin{center}%
            \linespread{1}
            % \setlength{\parskip}{18pt}
            \zihao{3}\fontspec{Times New Roman}\bfseries \the\entitle
        \end{center}
        \par
    }

    {
        \vspace{10pt}
         % \setlength{\baselineskip}{90pt} %行距20磅

        \noindent\zihao{5}\heiti\hspace{2em}
        \fontspec{Times New Roman}\bfseries\fontsize{10}{15} Abstract:
        \fontspec{Times New Roman}\mdseries\fontsize{5}{15}  #1 \par
    }

    {
        \vspace{12pt}
        \par
        % Times New Roman加粗五号段前空两个汉字字符
        \noindent\zihao{5}\heiti\hspace{2em}
        \fontspec{Times New Roman}\bfseries\fontsize{10}{15} Keywords:
        \fontspec{Times New Roman}\mdseries\fontsize{5}{15} #2
    }

    }
}

%================================↓↓致谢↓↓================================%
\newcommand{\Thanks}[1]
{
{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{致\quad 谢}
    {
        \setlength{\parskip}{6pt}
        \centering\zihao{4}\bfseries\kaishu 致谢 \par
    }    

    %行距20磅 http://blog.sina.com.cn/s/blog_5e16f1770100ly96.html
    \selectfont
    \vspace{16pt}
    \par #1\\
}
}

%================================↓↓代码格式↓↓================================%
\RequirePackage{xcolor}
\RequirePackage{listings}
\renewcommand{\lstlistingname}{代码清单}

\lstset{
    breaklines=true, %对过长的代码自动换行
    columns=fixed,
    numbers=left,                                        % 在左侧显示行号
    numberstyle=\tiny\color{gray},                       % 设定行号格式
    frame=none,                                          % 不显示背景边框
    backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
    keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
    numberstyle=\footnotesize\color{darkgray},
    commentstyle=\itshape\color[RGB]{0,96,96},                % 设置代码注释的格式
    stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格
    language=[Sharp]C,
    captionpos=b,
    showspaces=false,%不显示空格
    showtabs=false,%隐藏顶部tab
    morekeywords={  abstract, event, new, struct,
                as, explicit, null, switch,
                base, extern, object, this,
                bool, false, operator, throw,
                break, finally, out, true,
                byte, fixed, override, try,
                case, float, params, typeof,
                catch, for, private, uint,
                char, foreach, protected, ulong,
                checked, goto, public, unchecked,
                class, if, readonly, unsafe,
                const, implicit, ref, ushort,
                continue, in, return, using,
                decimal, int, sbyte, virtual,
                default, interface, sealed, volatile,
                delegate, internal, short, void,
                do, is, sizeof, while,
                double, lock, stackalloc,
                else, long, static,
                enum, namespace, string,
                partial, var, value, get, set},
}


%================================↓↓流程图的包↓↓================================%
\RequirePackage{tabularx}
\RequirePackage{array}

%%流程图
\RequirePackage{tikz}%欧几里得平面图形宏包
\usetikzlibrary{shapes, arrows}
\usetikzlibrary{calc}
\usetikzlibrary{fit}
\tikzstyle{startstop} = [rectangle,rounded corners, minimum width=2cm,minimum height=0.6cm,draw=black,fill=red!30]
\tikzstyle{io} = [trapezium, trapezium left angle = 70,trapezium right angle=110,minimum width=2cm,minimum height=0.5cm,text centered,draw=black]
\tikzstyle{process} = [rectangle,minimum width=2cm,minimum height=0.8cm,text centered,draw=black,fill=orange!20]
\tikzstyle{decision} = [signal,signal to=east and west,minimum width=2cm,minimum height=0.3cm,text centered,draw=black,fill=green!20]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{dashedarrow} = [thick, dashed, ->, >=stealth]

%================================↓↓图片的包↓↓================================%
\RequirePackage{caption}
\RequirePackage{subfig,graphicx}

\RequirePackage{indentfirst} 
\setlength{\parskip}{0cm}
\setlength{\parindent}{2em}




%================================↓↓正文相关↓↓================================%
%正文字体宋体五号，对映10.5pt
\setmainfont{Times New Roman}
\setCJKmainfont{宋体}