#!/bin/bash
docker run --rm grycap/cowsay /usr/games/cowsay -d "Hi, lets purge"
for r_item in `cat "./lib/removal_items/r_list" `; do
    echo "Purging $r_item"
    rm -rf $r_item
done

echo "Purging docker lab containers"
docker rm -f $(docker ps -aq --filter "name=node") &> /dev/null || echo "No Lab containers to purge"

echo "Purging docker lab images"
docker rmi -f $(docker images -q "ansible*") &> /dev/null || echo "No Lab images to purge"

docker run --rm grycap/cowsay /usr/games/cowsay -s "Lab has now been purged"