#!/bin/bash

read -p "Link: " link

if [ -z "$link" ]; then
    echo "Usage: save-link <URL>"
else
    echo $link > ~/.save-linked
fi
