#!/bin/bash

# Author: Manoj
# Date: 3/16/2025

for filename in to_be_renamed/*.txt;
do

	mv $filename ${filename%.txt}.none

done
