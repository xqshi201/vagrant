#!/bin/bash

#判断安装包是否成功
is_created(){
  if ! type $1 >/dev/null 2>&1;
  then
    echo "no";
  else
    echo "yes";
  fi
}

#安装nginx
create_nginx(){
  is_create=$(is_created nginx);
  if [ "$is_create" = "yes" ];
  then
    echo "nginx is already created";
  return 0
  fi
  #第一次尝试安装
  yum -y install nginx >/dev/null 2>&1
  is_create=$(is_created nginx);
  if [ "$is_create" = "no" ];
  then
    cat>/etc/yum.repos.d/nginx.repo<<EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF
  fi
  #第二次尝试安装
  yum -y install nginx >/dev/null 2>&1
  is_create=$(is_created nginx);
  if [ "$is_create" = "yes" ];
  then
  echo "nginx is success created";
  else
  echo "nginx is fail created"
  fi
}

#安装mysql
create_mysql(){
is_create=$(is_created mysql);
if [ "$is_create" = "yes" ];
then
  echo "mysql is already created";
  return 1
fi
yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm >/dev/null 2>&1
yum -y install mysql-community-server >/dev/null 2>&1
is_create=$(is_created mysql);
if [ "$is_create" = "yes" ];
then
  echo "mysql is success created";
else
  echo "mysql is fail created"
fi
}

#安装PHp
create_php(){
  is_create=$(is_created php);
  if [ "$is_create" = "yes" ];
  then
    echo "php is already created";
  return 1
  fi
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm >/dev/null 2>&1

  rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm >/dev/null 2>&1
  yum search php71w >/dev/null 2>&1
  yum -y install php71w php71w-fpm php71w-cli php71w-common php71w-devel php71w-gd php71w-pdo php71w-mysql php71w-mbstring php71w-bcmath >/dev/null 2>&1
  is_create=$(is_created php);
  if [ "$is_create" = "no" ];
  then
    echo "php is fail created";
  return 1
  fi
  yum -y install  php-redis >/dev/null 2>&1
  echo "php is success created"
}


echo "begin create nginx"
nginx_result=$(create_nginx)
if [ "$nginx_result" = "nginx is success created" ] || [ "$nginx_result" = "nginx is already created" ];
then
echo $nginx_result
else
echo $nginx_result
exit 1
fi


echo "begin create mysql"
mysql_result=$(create_mysql)
if [ "$mysql_result" = "mysql is success created" ] || [ "$mysql_result" = "mysql is already created" ];
then
echo $mysql_result
echo "view first mysql password:"
echo "service mysqld start"
echo "grep 'temporary password' /var/log/mysqld.log"
echo "change mysql password:"
echo "mysql -uroot -p "
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '#818VKa0au3#';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '#818VKa0au3#' WITH GRANT OPTION;"
echo "after exec that,new password is '#818VKa0au3#'"
else
echo $mysql_result
exit 1
fi

echo "begin create php"
php_result=$(create_php)
if [ "$php_result" = "php is success created" ] || [ "$php_result" = "php is already created" ];
then
echo $php_result
else
echo $php_result
exit 1
fi