touch merge_file.txt
#get all mp4 files generated and write is name to a file merged_file.txt
ls *.mp4 >>merge_file.txt
#add 'file ' prefix to each filename
sed -i -e 's/^/file /' merge_file.txt

#merge
ffmpeg -f concat -safe 0 -i merge_file.txt -c copy mergedfile.mp4
shopt -s extglob
rm !(createVideo.sh|mergeVideo.sh|mergedfile.mp4)
#ls | grep -v mergedfile.mp4 | xargs rm
