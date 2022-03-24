#!/bin/bash

file_exists() {
    if [ -e "$1" ]; then
        return 0
    else
        return 1
    fi
}

PREFIX=${HOME}/.conky/ConkySatMap/
RSAT=${PREFIX}radar-sat
OUTPUT=${PREFIX}sat-alt.png
tailleRSAT=80
#tailledecoupe=763x663
tailledecoupe=763x663
tailledecoupe_ir=563x513
tailledecoupe_ir=692x692
################################
################################
#Annotation pour vérifier si l'image est actualisée ##HelveticaLTStd-BlkCond
#jour=$(date +%d.%m.%y); 
heuremodif=$(date +%H); minmodif=$(date +%M)
#fonte=Open-Sans-Bold
libelle=""
#TXT=${PREFIX}updated.png
#################################################################
H=$(date +%-H)

if (( 7< H && H < 23))
then
echo ""
   adrS="http://www.sat24.com/image.ashx?country=eu"
else
echo ""
	adrS="http://www.sat24.com/image.ashx?country=eu"
   #adrS="https://neige.meteociel.fr/satellite/latest-ir-color.gif"
fi
wget -qO "${RSAT}" "${adrS}"

if (( 7< H && H < 23))
then
convert ${RSAT} -filter Lanczos -crop $tailledecoupe+0+0\! ${RSAT}.png
else

convert ${RSAT} -filter Lanczos -crop $tailledecoupe_ir+31+57\! ${RSAT}.png
fi



#########################################################
convert ${RSAT}.png -resize ${tailleRSAT}% ${RSAT}.png
convert  ${RSAT}.png \
\( +clone  -alpha extract \
       -draw 'fill black polygon 0,0 0,5 5,0 fill white circle 5,5 5,0' \
        \( +clone -flip \) -compose Multiply -composite \
        \( +clone -flop \) -compose Multiply -composite \
     \) -alpha off -compose CopyOpacity -composite $RSAT.png

#convert ${RSAT}.png -background transparent -fill blue -font HelveticaLTStd-BlkCond -pointsize 17 -gravity center label:"${libelle} ${jour} @ ${heuremodif} : ${minmodif}"  \

#\( +clone -background skyblue  -shadow 100x1 -channel A -level 0,6% +channel \) +swap +repage -gravity center -composite $TXT



convert $RSAT.png  -background  black \( +clone -shadow 70x4+4+4 \) +swap -background none -flatten ${OUTPUT}

#composite -geometry +255+10 ${TXT} ${OUTPUT} ${OUTPUT}

if file_exists "${HOME}"/.conky/ConkySatMap/radar-sat-*; then
    rm "${HOME}"/.conky/ConkySatMap/radar-sat-* "${RSAT}" "${RSAT}.png"
else
    rm "${RSAT}" "${RSAT}.png"
fi

if file_exists "${HOME}"/.conky/label:*; then
    rm "${HOME}"/.conky/label* 

 fi
exit
 