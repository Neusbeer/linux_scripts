#!/bin/bash
outputdir='images'
if [ -z "$1" ]
  then
    echo -e "No percentage given,\neg: image-crop-percentage 50\n"
    exit
fi

[ ! -d "$outputdir" ] && mkdir -p "$outputdir"

for f in *.jpg; do
  echo $f
  size=`identify -format "%wx%h" $f`
  width=`echo $size | cut -f 1 -d "x"`
  height=`echo $size | cut -f 2 -d "x"`
  width=$(($width * 10))
  height=$(($height * 10))
  newwidth=$(($width-($width/100)*$1))
  newheight=$(($height-($height/100)*$1))
  diffwidth=$((($width-$newwidth)))
  diffheight=$((($height-$newheight)))
  width=$(($width/10))
  height=$(($height/10))
  newwidth=$(($newwidth/10))
  newheight=$(($newheight/10))
  diffwidth=$(($diffwidth/10))
  diffheight=$(($diffheight/10))
  echo -e "\t\twidth:\t\t$width \theight:\t\t$height"
  echo -e "\t\tnew width:\t$newwidth \tnew height:\t$newheight"
  echo -e "\t\tdifference:\t$diffwidth \tdifference:\t$diffheight"
  convert $f -gravity Center -crop "$newwidth"x"$newheight"+0+0 +repage "$outputdir"/"$f"
done
