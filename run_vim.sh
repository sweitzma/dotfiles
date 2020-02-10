docker run \
  --mount type=bind,source=$PWD,target=/mnt,consistency=consistent \
  --interactive \
  --tty \
  dockervim $@

# docker run \
#   --volume "$(pwd)":/mnt \
#   -it dockervim $@

clear -x
