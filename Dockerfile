FROM ubuntu:20.04

ENV DOCKER_BUILDKIT_PROGRESS=plain
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y tzdata

#setting the time zone
ENV TZ=Africa/Johannesburg
RUN echo "Africa/Johannesburg" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata    
 
 #installing softwares
RUN apt-get update && \
    apt-get install -y apache2 php mysql-server php-mysql netcat net-tools nano python curl 

EXPOSE 80

#install

# Start services
CMD service mysql start && \
    service apache2 start && \
    tail -f /var/log/apache2/access.log 
#Database things and creating user

COPY loan_db.sql /usr/local/bin/loan_db.sql
COPY loandb.sh /usr/local/bin/loandb.sh
RUN chmod +x /usr/local/bin/loandb.sh
RUN chmod +x /usr/local/bin/loan_db.sql
RUN /usr/local/bin/loandb.sh


WORKDIR /var/www/html



#======================================================== Creating a user====================================================================================

# Create user and set password
RUN useradd -m -s /bin/bash Sifundo && \
    echo 'Sifundo:SifuSifu@123' | chpasswd

#====================== trying couchDB again =========================================








