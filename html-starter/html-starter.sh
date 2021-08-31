#!/usr/bin/bash
baseURL="$HOME/bin/html-starter"
starterhtml="$baseURL/index.html"
startercss="$baseURL/style.css"
starterjs="$baseURL/app.js"

if  [ -f "$starterhtml" ]; then   
  cat "$starterhtml" > "index.html" &&
  echo "created index.html"
fi

if [ -f "$startercss" ]; then 
  cat "$startercss" > "style.css" &&
  echo "created style.css"
fi
&&
if [ -f "$starterjs" ]; then 
  cat "$starterjs" > "app.js" &&
  echo "created app.js"
fi