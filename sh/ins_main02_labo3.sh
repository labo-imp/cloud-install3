#!/bin/bash
# fecha revision   2025-06-22  03:48

# abort on any subprocess error
set -eo pipefail

# verifico el repo de la catedra
/home/$USER/cloud-install/sh/ins_common.sh


# lo minimo necesario antes de secrets
/home/$USER/cloud-install/sh/ins_architecture.sh
/home/$USER/cloud-install/sh/ins_services_recrear.sh
/home/$USER/cloud-install/sh/ins_buckets.sh

/home/$USER/cloud-install/sh/ins_secrets.sh

/home/$USER/cloud-install/sh/ins_crear_repos_labo3.sh
/home/$USER/cloud-install/sh/ins_autoexec.sh

# instalacion pesada
/home/$USER/cloud-install/sh/ins_system.sh
/home/$USER/cloud-install/sh/ins_gnome.sh

# tonterias
/home/$USER/cloud-install/sh/ins_halfswap.sh
/home/$USER/cloud-install/sh/ins_sysstat.sh
/home/$USER/cloud-install/sh/ins_expshared.sh
/home/$USER/cloud-install/sh/ins_datasets.sh
/home/$USER/cloud-install/sh/ins_zulip.sh

# los lenguajes y sus paquetes
/home/$USER/cloud-install/sh/ins_pyworld_inicial.sh
/home/$USER/cloud-install/sh/ins_jlworld_inicial.sh
/home/$USER/cloud-install/sh/ins_rworld_inicial.sh

# utilidades
/home/$USER/cloud-install/sh/ins_memcpu.sh
/home/$USER/cloud-install/sh/ins_mlflow.sh
/home/$USER/cloud-install/sh/ins_kaggle_labo3.sh


# extensa instalacion de paquetes de los lenguajes
/home/$USER/cloud-install/sh/ins_pyworld_final.sh
/home/$USER/cloud-install/sh/ins_jlworld_final.sh
/home/$USER/cloud-install/sh/ins_rworld_final.sh


/home/$USER/cloud-install/sh/ins_jupyterlab.sh
/home/$USER/cloud-install/sh/ins_kernels.sh

/home/$USER/cloud-install/sh/ins_cambiar_claves.sh

/home/$USER/cloud-install/sh/ins_gnome_apps.sh
/home/$USER/cloud-install/sh/ins_gnome_menus.sh


sudo adduser $USER sudo

sudo  DEBIAN_FRONTEND=noninteractive   apt-get  --yes  update
sudo  DEBIAN_FRONTEND=noninteractive   apt-get  --yes  dist-upgrade
sudo  DEBIAN_FRONTEND=noninteractive   apt-get  --yes  autoremove

bitacora   "update upgrade"

echo "Ha finalizado la parte  desatendida  de la instalacion"
