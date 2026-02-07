# Projeto ASA - Infraestrutura Automatizada (IaC)

  

Este projeto implementa uma infraestrutura completa para rodar uma aplicação WordPress containerizada, utilizando **Vagrant** para virtualização, **Ansible** para provisionamento e **Docker Compose** para orquestração dos serviços.

---

## 🏗️ Arquitetura do Projeto

O ambiente é constituído por uma Máquina Virtual (VM) Debian que hospeda três containers principais:

1.  **Database:** MySQL 5.7 (Persistência de dados).
2.  **Webserver:** WordPress Latest (Aplicação).
3.  **Webproxy:** Nginx (Proxy Reverso/Load Balancer Camada 4).

### Detalhes Técnicos
* **IP da VM:** `192.168.56.118`
* **Sistema Operacional:** Debian Bookworm (64-bit)
* **Memória Alocada:** 1024 MB
* **Porta de Acesso:** 8080 (Mapeada via Proxy)

---

## 🚀 Pré-requisitos

Para executar este projeto, certifique-se de ter instalado:
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [Ansible](https://docs.ansible.com/) (Necessário na máquina host)

---

## 🛠️ Instalação e Execução

1.  **Clone o repositório** para sua máquina local.

2.  **Inicie o ambiente** executando o comando abaixo na raiz do projeto:

    ```bash
    vagrant up
    ```

    *O Vagrant irá:*
    * Baixar a box `debian/bookworm64`.
    * Configurar a rede privada.
    * Acionar o **Ansible** automaticamente para instalar o Docker e subir os containers.

3.  **Acesse a aplicação** no navegador:

    ```
    (http://192.168.56.118:8080)
    ```

---

## 🔐 Credenciais e Configurações

As credenciais abaixo foram definidas no arquivo `docker-compose.yml`:

| Serviço | Variável | Valor |
| :--- | :--- | :--- |
| **MySQL** | `MYSQL_ROOT_PASSWORD` | `senha_root_secreta` |
| **MySQL** | `MYSQL_DATABASE` | `wordpress` |
| **MySQL** | `MYSQL_USER` | `wordpress_user` |
| **MySQL** | `MYSQL_PASSWORD` | `wordpress_password` |
| **WordPress** | `WORDPRESS_DB_HOST` | `database:3306` |

---

## 📂 Estrutura dos Arquivos

* **`Vagrantfile`**: Define a VM, IP fixo e chama o provisionador Ansible.
* **`playbook_ansible.yml`**: Instala Docker, Docker Compose e sobe a aplicação.
* **`docker-compose.yml`**: Orquestra os serviços `database`, `webserver` e `webproxy`.
* **`nginx.conf`**: Configuração de stream (TCP) do Nginx para proxy na porta 8080.
* **`Dockerfile`**: Constrói a imagem do proxy (`0hugoantonio83/webproxy:v1`).

---

## 📝 Comandos Úteis

```bash
# Acessar a VM via SSH
vagrant ssh

# Parar a VM
vagrant halt

# Destruir o ambiente (remover VM e discos)
vagrant destroy

# Verificar status dos containers (dentro da VM)
docker compose ps
