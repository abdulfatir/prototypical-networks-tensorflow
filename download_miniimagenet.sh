declare -a trainclasses=("n04509417" "n07697537" "n03924679" "n02113712" "n02089867" "n02108551" "n03888605" "n04435653" "n02074367" "n03017168" "n02823428" "n03337140" "n02687172" "n02108089" "n13133613" "n01704323" "n02165456" "n01532829" "n02108915" "n01910747" "n03220513" "n03047690" "n02457408" "n01843383" "n02747177" "n01749939" "n13054560" "n03207743" "n02105505" "n02101006" "n09246464" "n04251144" "n04389033" "n03347037" "n04067472" "n01558993" "n07584110" "n03062245" "n04515003" "n03998194" "n04258138" "n06794110" "n02966193" "n02795169" "n03476684" "n03400231" "n01770081" "n02120079" "n03527444" "n07747607" "n04443257" "n04275548" "n04596742" "n02606052" "n04612504" "n04604644" "n04243546" "n03676483" "n03854065" "n02111277" "n04296562" "n03908618" "n02091831" "n03838899")
declare -a testclasses=("n02110341" "n01930112" "n02219486" "n02443484" "n01981276" "n02129165" "n04522168" "n02099601" "n03775546" "n02110063" "n02116738" "n03146219" "n02871525" "n03127925" "n03544143" "n03272010" "n07613480" "n04146614" "n04418357" "n04149813")

token=<accesskey>
user=<username> 
DATADIR=data/mini-imagenet

# Create directories
mkdir $DATADIR/data
mkdir $DATADIR/data/train
mkdir $DATADIR/data/test

# Download train set
for i in "${trainclasses[@]}"
do
   wget -c --output-document=$DATADIR/data/train/$i.tar "http://www.image-net.org/download/synset?wnid=$i&username=$user&accesskey=$token&release=latest&src=stanford"
   mkdir $DATADIR/data/train/$i
   tar xf $DATADIR/data/train/$i.tar -C $DATADIR/data/train/$i/
done

# Download test set
for j in "${testclasses[@]}"
do
   wget -c --output-document=$DATADIR/data/test/$j.tar "http://www.image-net.org/download/synset?wnid=$j&username=$user&accesskey=$token&release=latest&src=stanford"
   mkdir $DATADIR/data/test/$j
   tar xf $DATADIR/data/test/$j.tar -C $DATADIR/data/test/$j/
done