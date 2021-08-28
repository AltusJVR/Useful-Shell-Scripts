#!/usr/bin/bash
baseURL="$HOME/bin/html-start"
starterhtml="$baseURL/index.html"
startercss="$baseURL/style.css"
starterjs="$baseURL/app.js"

if [ -f "$starterhtml" ]; then   
  cat $starterhtml >> "index.html"
fi

if [ -f "$startercss" ]; then 
  cat $startercss >> "style.css"
fi

if [ -f "$starterjs" ]; then 
  cat $starterjs >> "app.js"
fi