#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
 # No Color
RESET='\033[0m'


if [ $# -ne 0 ]
then
    IMAGES=$@
else
    IMAGES="Image1 Image2 Image2"
fi

for image in ${IMAGES}
do
    echo -e "${GREEN}Building image: project-${image}${RESET}"

    path="registry.gitlab.com/<your account>/<you repo>/project-${image,,}:latest"

    start=$SECONDS

	sudo docker build -t ${path} ./ELE-${image}/ || exit $?

    duration=$(( SECONDS - start ))

    size=$(sudo docker inspect -f {{.Size}} ${path})

    formatted=$(echo ${size} | numfmt --to=si)

    echo -e "${GREEN}Built image: project-${image} | Size: ${formatted} | Duration: ${duration}s${RESET}"
done

echo -e "${GREEN}Built images${RESET}"
