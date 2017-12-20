# SKTV API
Este repositorio es la base para toda la administracion deL backend de SKTV

## Requisitos

* **Ruby** >= 2.3.1

* **Postgresql** >= 9.4

## Instalación

Para proceder a instalar este servicio en una maquina local primero se debe asegurar un entorno.
Para ello debemos instalar ruby, postgres, crear las bases de datos, y cargar las variables de entorno con Figaro.

### Entorno (si no posees rvm ni postgres)

	brew install postgres
	curl -sSL https://get.rvm.io | bash -s stable --ruby
	rvm install ruby-2.3.1
	gem install bundler
	rvm use ruby-2.3.1@orange --create

### Instalación de Gemfile
	bundle install

### Instalación DB desde Cero
	rake db:create
	rake db:migrate
	rake db:seed


### Voilà! Ya puedes correr el servidor con
	rails s

### Deploy a via Codeship
	git add . -A
	git commit -m "Deploy Message"
	git push origin master


## Desarrollador
* Sebastián Schuchhardt ([schgressive@gmail.com](mailto: schgressive@gmail.com))

