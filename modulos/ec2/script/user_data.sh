#!/bin/bash

# Actualizar paquetes e instalar dependencias necesarias
sudo apt update
sudo apt install -y openjdk-11-jdk wget apt-transport-https ca-certificates curl gnupg jq git bash unzip zip lsb-release

# Agregar la clave GPG de Jenkins
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

# Configurar el repositorio de Jenkins
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Actualizar paquetes nuevamente después de agregar el repositorio de Jenkins
sudo apt update

# Instalar Jenkins
sudo apt install -y jenkins

# Instalar extensiones de Jenkins usando jenkins-plugin-cli
sudo jenkins-plugin-cli --plugins \
    blueocean \
    docker-workflow \
    pipeline-build-step \
    pipeline-github-lib \
    pipeline-rest-api \
    pipeline-stage-view \
    timestamper \
    file-operations \
    branch-api \
    workflow-support \
    pam-auth \
    sshd \
    ws-cleanup \
    ssh-agent \
    pipeline-utility-steps

# Reiniciar Jenkins para que reconozca las nuevas extensiones
sudo systemctl restart jenkins

# Instalación de Docker (si es necesario)
sudo apt install -y docker-ce
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins  # Reinicia Jenkins para reconocer al nuevo miembro del grupo Docker

# Finalizar con cualquier otra configuración necesaria
