# Projeto_ASA-2
# Projeto ASA - Infraestrutura Automatizada (IaC)

Este projeto implementa um ambiente de infraestrutura como código (IaC) para hospedar uma aplicação **WordPress** completa, utilizando **Vagrant** para virtualização, **Ansible** para provisionamento e **Docker** para orquestração de containers.

O diferencial desta arquitetura é a inclusão de um **Load Balancer Nginx** personalizado operando na Camada 4 (TCP), servindo como proxy para a aplicação.

## 🚀 Tecnologias Utilizadas

* **Vagrant:** Gerenciamento da Máquina Virtual (Debian Bookworm).
* **VirtualBox:** Provider de virtualização.
* **Ansible:** Automação da configuração do ambiente e instalação do Docker.
* **Docker & Docker Compose:** Containerização dos serviços.
* **Nginx:** Proxy TCP (Stream Context).
* **WordPress & MySQL:** Aplicação e Banco de Dados.

## 🏗️ Arquitetura

O ambiente é provisionado automaticamente em uma VM. Dentro desta VM, o Docker Compose orquestra três serviços principais:

1.  **webproxy (Nginx):**
    * Configurado como Load Balancer de Camada 4 (TCP/UDP) através do bloco `stream`.
    * Escuta na porta **8080** e encaminha tráfego para o servidor web.
    * Construído a partir de uma imagem personalizada (`Dockerfile`) baseada no `nginx:latest`.
2.  **webserver (WordPress):**
    * Imagem oficial do WordPress.
    * Acessível apenas via rede interna ou através do proxy.
3.  **database (MySQL):**
    * Versão 5.7 (estável para WP).
    * Persistência de dados via volumes Docker.

## 📋 Pré-requisitos

Certifique-se de ter instalado em sua máquina host:

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (Obrigatório para o provisionamento do Vagrant)

## 🔧 Instalação e Execução

1.  **Clone este repositório:**
    ```bash
    git clone <https://github.com/0hugoantonio83/Projeto_ASA-2>
    cd <Projeto_ASA-2>
    ```

2.  **Suba o ambiente:**
    Execute o comando abaixo na raiz do projeto. O Vagrant irá criar a VM, e o Ansible irá instalar o Docker e subir os containers automaticamente.
    ```bash
    vagrant up
    ```

3.  **Acesse a Aplicação:**
    Uma vez finalizado o processo, a aplicação estará disponível no IP estático definido:

    👉 **URL:** `http://192.168.56.118:8080`

## 📂 Estrutura do Projeto

* `Vagrantfile`: Define a VM com IP `192.168.56.118` e 1GB de RAM.
* `playbook_ansible.yml`: Playbook que instala o Docker Engine, cria diretórios e executa o `docker compose up`.
* `docker-compose.yml`: Define a stack (MySQL, WordPress, Nginx Proxy).
* `nginx.conf`: Configuração do Nginx para encaminhamento de tráfego TCP na porta 8080.
* `Dockerfile`: Script de build para a imagem do proxy.

## 🔐 Credenciais (Ambiente de Desenvolvimento)

Conforme definido no arquivo `docker-compose.yml`:

* **Banco de Dados:** `wordpress`
* **Usuário do Banco:** `wordpress_user`
* **Senha do Banco:** `wordpress_password`
* **Senha Root (DB):** `senha_root_secreta`

## 🛠️ Comandos Úteis

* **Acessar a VM via SSH:**
    ```bash
    vagrant ssh
    ```
* **Parar a VM:**
    ```bash
    vagrant halt
    ```
* **Destruir o ambiente (remover VM):**
    ```bash
    vagrant destroy
    ```

---
**Disciplina:** ASA
