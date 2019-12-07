#!/bin/bash
# By yongcong.wang @ 07/12/2019

# options
set -e
set -x

# vars
HOME=$(cd ~; pwd)
WALLPAPER_PATH=${HOME}/Pictures/bing
IMAGE_NAME="${WALLPAPER_PATH}/$(date +"%Y%m%d").jpg"

# functions
function get_image_url() {
  bing_api="https://www.bing.com/HPImageArchive.aspx?format=rss&idx=0&n=1&mkt=en-US"
  bing_url_header="http://www.bing.com"
  image_url="${bing_url_header}$(curl ${bing_api} | sed 's/.*src="\(.*\).*&amp;rf.*/\1/g')"
  echo ${image_url}
}

function save_image() {
  if [[ ! -d ${WALLPAPER_PATH} ]]; then
    mkdir ${WALLPAPER_PATH}
  fi

  curl -o ${IMAGE_NAME} $1
}

function set_wallpaper() {
  if [[ -L ${WALLPAPER_PATH}/wallpaper.jpg ]]; then
    rm ${WALLPAPER_PATH}/wallpaper.jpg
  fi
  ln -s ${IMAGE_NAME} ${WALLPAPER_PATH}/wallpaper.jpg
  gsettings set org.gnome.desktop.background picture-uri file://${IMAGE_NAME}
}

function main() {
  if [[ -f ${IMAGE_NAME} ]]; then
    echo "Iamge exists, no need to download again."
    exit 0
  fi

  image_url=$(get_image_url)

  echo ${image_url}
  save_image ${image_url}

  set_wallpaper
}

# start
main
