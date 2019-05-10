if [ $# -eq 1 ]; then

    platex   -kanji=utf8 $1.tex
    dvipdfmx             $1.dvi 

else

    platex   -kanji=utf8 $1.tex
    dvipdfmx             $1.dvi 
    open -a Preview      $1.pdf

fi
