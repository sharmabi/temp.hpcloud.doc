
permalink=" " 
id=" "
echo test
for i in `find . -name "*.dita"` 
do 
#echo " " 
#echo $i

sed -i 'N;s/<title>\n/<title> /'  $i
sed -i  's|<title> <!\-\- |<title |g' $i
sed -i 's|\(<title id[^>]*\) \-\->|\1>|g'  $i

	permalink=`grep permalink $i |sed 's|.* /|/|' | sed 's|/-->.*|/|' | sed 's/-->.*//'`
	id=`echo $permalink | sed 's|/|_|g' | sed 's|^_||' | sed 's|_$||' |sed 's|\.|_|g'`

	#echo "permalink $permalink"
	#echo "id        $id"
	
	
	level=`echo $i | sed 's|\/|\n|g' | wc -l`

	#sed -i "s|id=\"topic.*\"|id=\"$id\"|" $i 

	#sed -i 's|link href\=|xref href\=|g' $i
	#sed -i 's|xref href\="http|link href\="http|g' $i
	sed -i 's|format="html"||g' $i
	sed -i 's|scope="external"|scope="external" format="html"|g' $i
	 
	echo $level
	
 
	if [ $level = "1" ]; then
	echo "ERROR1"
	fi

	if [ $level = "2" ]; then
	mediaPath="ERROR2/"
	fi
	
	if [ $level = "3" ]; then
	mediaPath="media/"
	docPath="../"
	fi
	
	if [ $level = "4" ]; then
	mediaPath="../media/"
	docPath="../../"
	fi	
		
	if [ $level = "5" ]; then
	mediaPath="../../media/"
	docPath="../../../"
	fi
			
	if [ $level = "6" ]; then
	mediaPath="../../../media/"
	docPath="../../../../"
	fi
				
	if [ $level = "7" ]; then
	mediaPath="../../../../media/"
	docPath="../../../../../"
	fi
				
	if [ $level = "8" ]; then
	mediaPath="../../../../../media/"
	docPath="../../../../../../"
	fi
				
	if [ $level = "9" ]; then
	mediaPath="../../../../../../media/"
	docPath="../../../../../../../"
	fi
				
	if [ $level = "10" ]; then
	mediaPath="../../../../../../../media/"
	docPath="../../../../../../../../"
	fi

echo $mediaPath	


 

sed -i 's|/content/documentation/media/|/media/|g' $i 
sed -i "s|image href=\"/.*media/|image href=\"../$mediaPath|g" $i 	
sed -i "s|href=\"\./\(.*\)\.dita/\"|href=\"$docPath\1\.dita\"|g" $i
sed -i 's|\.\./||g' master-toc.dita
sed -i  '/<related-links>/,/<\/related-links>/d' $i
sed -i 's|format=\"html\" *format=\"pdf\"|format=\"pdf\"|' $i 
	
	
done

find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
find . -type d -empty -exec rmdir {} \; || true
