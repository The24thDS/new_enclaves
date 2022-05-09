#!/usr/bin/env bash

case "$(uname -s)" in
   Linux)
     os="linux"
     ;;
   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     os="windows"
     ;;
   *)
     echo 'Unsupported OS'
     exit
     ;;
esac

echo -n "Image name: "
read imageName

# generate the small version of the flag (gold)
if [[ "$os" == "windows" ]]; then
	magick convert new_enclaves/flags/enclaves/$imageName -resize 24x24 new_enclaves/flags/enclaves/small/$imageName
else
	convert new_enclaves/flags/enclaves/$imageName -resize 24x24 new_enclaves/flags/enclaves/small/$imageName
fi

echo "Generated new_enclaves/flags/enclaves/small/$imageName"

# generate the map version of the flag (white)
if [[ "$os" == "windows" ]]; then
	magick convert new_enclaves/flags/enclaves/$imageName -resize 128x128 -fill "#FFFFFF" +opaque none new_enclaves/flags/enclaves/map/$imageName
else
	convert new_enclaves/flags/enclaves/$imageName -resize 128x128 -fill "#FFFFFF" +opaque none new_enclaves/flags/enclaves/map/$imageName
fi

echo "Generated new_enclaves/flags/enclaves/map/$imageName"
