ct_id=
IFS="
"
for file in $(ls -dtr -1 $PWD/1/*)
do       
	echo "______________________________"
	echo  "$file"
	echo "______________________________"
	
	curl --request POST --url http://127.0.0.1:8081/bot/sendAudio --header 'Content-Type: multipart/form-data' --form chat_id=$ct_id  --form duration="$(ffprobe -i $file -show_entries format=duration -v quiet -of csv=p=0)" --form performer="$(ffprobe 2> /dev/null -show_format $file | grep TAG:artist= | cut -d '=' -f 2)" --form audio=@"$file" --form caption=" <b> $(echo $file | sed 's:/root/1/1/: :g ; s:.mp3::g') </b> "  -F parse_mode='HTML'
	echo "#############_end_############"
	sleep 10
done
