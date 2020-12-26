d:
mkdir d:\vagrant_virtual
vagrant box add centos D:\vagrant_download\CentOS-7.box
vagrant init centos
xcopy  d:\vagrant_project\vagrant\Vagrantfile d:\vagrant_virtual\Vagrantfile /Y
xcopy  d:\vagrant_project\vagrant\Vagrantfile\启动虚拟机.bat C:\Users\admin\Desktop\启动虚拟机.bat
vagrant reload
vagrant ssh

