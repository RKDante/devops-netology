#!/bin/bash
# display command line options

count=1
for param in "$*"; 
     doecho"\$* Parameter #$count = $param"
