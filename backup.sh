#!/bin/sh

# With Paragon NTFS it will be /Volumes/Untitled
# With mounty it will be /System/Volumes/Data/Users/adn/.mounty/Untitled
rsync -av ~/dev/adn/notes ~/Pictures ~/Movies ~/Books ~/Amazon\ Drive /System/Volumes/Data/Users/adn/.mounty/Untitled/adn/
