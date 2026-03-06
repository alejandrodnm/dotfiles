#!/bin/sh
# With Paragon NTFS it will be /Volumes/Untitled
# With mounty it will be /System/Volumes/Data/Users/adn/.mounty/Untitled
# OpenMTP to copy Android files.
# the-media-organizer --media-src ~/DCIM/ --photos-dst ~/Amazon\ Drive/adn/ --videos-dst ~/Movies/
rsync --exclude='.DS_Store' -av ~/dev/adn/notes ~/Pictures ~/Movies ~/Books ~/Amazon\ Drive /System/Volumes/Data/Users/adn/.mounty/Untitled/adn/
