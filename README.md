## swiss bike deaths

This is a bash script to download and parse switzerland bicycle deaths. The data is available visually ([geo.admin.ch](https://s.geo.admin.ch/86fcf4641c)) but in the default view you can select with an OR clause, but can't select fatalities that were involving ONLY bicylce accidents.

The  [data is available in this repository as a geojson](https://github.com/philshem/swiss_bike_deaths/blob/master/swiss_bike_deaths.geojson) to view, interact with, and download.

![screenshot of geojson viewer](https://raw.githubusercontent.com/philshem/swiss_bike_deaths/master/geojson_snapshot.png)


## running

From a unix-based terminal:

    sh get_swiss_bike_deaths.sh

<s>The output is the timestamp of the data (meaning the last data refresh)

    Date stamp    01-03-2019 09:32:35
</s>

(The date stamp corresponds to the metadta and not the actual *data.zip* file.)

and the name of the output geojson file

    swiss_bike_deaths.geojson

### stats

You can see the yearly distributions

    grep AccidentYear swiss_bike_deaths.geojson | awk '{print $2}' | sed 's/"//g' | sed 's/,//g' | sort | uniq -c | awk '{print $2,$1}'

gives this yearly time series

```
2011 40
2012 37
2013 25
2014 35
2015 41
2016 34
2017 39
2018 42
2019 27
```

Note that despite the file date, the data is for the previous year.

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

Or with conda

    conda install -c conda-forge jq wget poppler

## license

The script is open to the public domain. The data is separately licensed by the owner and I do not claim to own or provide this data.
