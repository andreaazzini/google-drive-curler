id=$1
driveURL='https://drive.google.com/uc?export=download'
filename="$(curl -sc /tmp/gcokie "${driveURL}&id=${id}" | grep -o '="uc-name.*</span>' | sed 's/.*">//;s/<.a> .*//')"  
getcode="$(awk '/_warning_/ {print $NF}' /tmp/gcokie)"  
curl -Lb /tmp/gcokie "${driveURL}&confirm=${getcode}&id=${id}" -o "${filename}"
