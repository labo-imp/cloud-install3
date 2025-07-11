#!/bin/bash
# fecha revision   2025-06-22  03:48

logito="ins_crear_repos.txt"
# si ya corrio esta seccion, exit
# [ -e "/home/$USER/log/$logito" ] && exit 0


# requiero que buckets este instalado
[ ! -e "/home/$USER/log/ins_buckets.txt" ] && exit 0
[ ! -e "/home/$USER/log/ins_secrets.txt" ] && exit 0


source  /home/$USER/cloud-install/sh/common.sh
source  /home/$USER/install/secrets.sh

/home/$USER/cloud-install/direct/clonar_usuario.sh

/home/$USER/cloud-install/sh/verificar_repo.sh
if [ ! $? -eq 0 ]; then
  fecha=$(date +"%Y%m%d %H%M%S")
  echo $fecha > /home/$USER/log/ins_crear_repo_ERROR.txt
  exit 1
fi

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/ins_crear_repo_usuario.txt


#--------------------------------------

# repo oficial de la catedra "de cero"
# corre durante instalacion

/home/$USER/cloud-install/direct/clonar_catedra.sh
if [ ! $? -eq 0 ]; then
  fecha=$(date +"%Y%m%d %H%M%S")
  echo $fecha > /home/$USER/log/clonar_catedra_ERROR.txt
  exit 1
fi


source  /home/$USER/cloud-install/sh/common.sh
bitacora "crear_repos"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito

exit 0
