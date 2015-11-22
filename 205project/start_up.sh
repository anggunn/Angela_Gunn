#!/bin/bash

#Make directories for project
mkdir accident_project


mkdir raw_data
cd raw_data
wget ftp://ftp.nhtsa.dot.gov/GES/GES13/GES13_Flatfile.zip 
wget ftp://ftp.nhtsa.dot.gov/GES/GES12/GES12_Flatfile.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES11/GES11_Flatfile.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES10/GES10_flatfile.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES09/GES09%20FlatFile.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES08/GES2008_flat.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES07/ges2007_flat.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES06/ASCII/ges06flat.zip
wget ftp://ftp.nhtsa.dot.gov/GES/GES05/ASCII/ges05flat.zip


#rename the files
mv GES13_Flatfile.zip GES13.zip
mv GES12_Flatfile.zip GES12.zip
mv GES11_Flatfile.zip GES11.zip
mv GES10_flatfile.zip GES10.zip
mv "GES09 FlatFile.zip" GES09.zip
mv GES2008_flat.zip GES08.zip
mv ges2007_flat.zip GES07.zip
mv ges06flat.zip GES06.zip
mv ges05flat.zip GES05.zip


