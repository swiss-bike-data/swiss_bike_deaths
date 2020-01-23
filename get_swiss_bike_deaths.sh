#!/bin/bash

# download zip 
FYLE=swiss_bike_deaths.geojson

#typ as1 is fatalities, as2 is serious injuries, as3 is light injuries
TYP=as1

wget -q https://data.geo.admin.ch/ch.astra.unfaelle-personenschaeden_alle/data.zip -O data.zip
    
# unzip the metadata and print the timestamp
unzip -p data.zip metadata.pdf > metadata.pdf && pdftotext -layout metadata.pdf - | grep 'Date stamp'
    
    # unzip just the relevant json file with data
unzip -p data.zip RoadTrafficAccidentLocations.json | \
    jq -r --arg TYP "$TYP" '.features |= map(select( .properties.AccidentInvolvingBicycle == "true" and .properties.AccidentSeverityCategory == $TYP ))' > $FYLE

# cleanup
rm -fr data.zip metadata.pdf

echo $FYLE
