FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root_pass
ENV MYSQL_DATABASE=suitecrm
ENV MYSQL_USER=suitecrm
ENV MYSQL_PASSWORD=suitecrm_pass

WORKDIR /usr/src/app

EXPOSE 3306


CMD ["mysqld"]
