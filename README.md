## swiss bike deaths

bash script to download and parse switzerland bicycle deaths

## running

from a unix-based terminal:

    sh get_swiss_bike_deaths.sh

output is the timestamp of the data (meaning the last data refresh)

    Date stamp    01-03-2019 09:32:35

and the name of the output geojson file

    swiss_bike_deaths.geojson

## requirements

+ [wget](http://manpages.ubuntu.com/manpages/bionic/man1/wget.1.html)
+ [pdftotext](http://manpages.ubuntu.com/manpages/bionic/man1/pdftotext.1.html) (comes with poppler-utils)
+ [unzip](https://askubuntu.com/a/86852/104223)
+ [jq](https://stedolan.github.io/jq/download/) (json parsing)

With Ubuntu/Debian, you can install all requirements:

    sudo apt install wget poppler-utils unzip jq

It's also possible with homebrew on Mac OSX

    brew install wget poppler jq

(`unzip` should already be available.)

## license

The script is open to the public domain. The data is separately licensed by the owner and I do not claim to own or provide this data.
