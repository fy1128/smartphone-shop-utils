#!/bin/bash
work_dir="/e/Documents/WDJDownload/Apps"
pin_dir="/e/Fuying/studio/web/htdocs/店员推荐"
SAVEIFS="$IFS"
IFS='
'
echo "应用更新..."
echo ""
cd $work_dir
rm -f ./*.wdj
new_files=`find . -type f |grep "[0-9+]\.apk$" -i`
for nf in $new_files
do
	cf=`echo $nf | tr -d "[0-9]"`
	if [ -f "$cf" ]
	then
		if [ "$nf" -nt "$cf" ]
		then
			name=`echo "${cf##*/}"`
			echo "更新「$name」..."
			rm -f "$cf"
			mv "$nf" "$cf"
		fi
	fi
done
echo "应用更新完成。"
echo ""
echo "准备店员推荐内容..."
echo ""
cd $pin_dir
pins=`find . -type f -name "*.apk"`
for apk in $pins
do
	if [ -f "$work_dir/$apk" -a "$work_dir/$apk" -nt "$apk" ]
	then
		name=`echo "${apk##*/}"`
		echo "更新「$name」..."
		cp -p "$work_dir/$apk" "./$apk"
		echo ""
	fi
done
IFS="$SAVEIFS"
echo "操作完成"

