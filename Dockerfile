FROM ubuntu:16.04
MAINTAINER Prasad Domala <mpr.marcos@hotmail.com>

#update repository
RUN apt-get update -y

#install apache
RUN apt-get install -y apache2

#install PHP modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#copy Aplication Files
RUN rm -rf /var/www/html/*
ADD demo2 /var/www/html

#Configure Apache (Optional)
RUN chown -R www-data:www-data /var/www
ENV APA_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

#Open port 85
EXPOSE 85

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
