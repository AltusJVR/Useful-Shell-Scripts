#!/usr/bin/bash
starterhtml="$HOME/Documents/Dev/Useful-Shell-Scripts/html-starter/index.html"
startercss="$HOME/Documents/Dev/Useful-Shell-Scripts/html-starter/style.css"
starterjs="$HOME/Documents/Dev/Useful-Shell-Scripts/html-starter/app.js"

if [ -f "$starterhtml" ]; then   
  cat $starterhtml >> "index.html"
fi

if [ -f "$startercss" ]; then 
  cat $startercss >> "style.css"
fi

if [ -f "$starterjs" ]; then 
  cat $starterjs >> "app.js"
fi