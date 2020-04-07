FROM python:2.7
LABEL version="1.0" description="python2.7 增加mysql-python" by="sai.chen"
LABEL mail "ace.chan.j@gmail.com"

RUN sed '/st_mysql_options options;/a unsigned int reconnect;' /usr/include/mysql/mysql.h -i.bkp
RUN pip install mysql-python