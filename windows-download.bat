echo "D will create dirname 'vagrant_download'"
mkdir D:\vagrant_download
bitsadmin /transfer myDownLoadJob /download /priority normal "https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Win.exe" "D:\vagrant_download\VirtualBox-6.1.16-140961-Win.exe"
bitsadmin /transfer myDownLoadJob /download /priority normal "https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi" "D:\vagrant_download\vagrant_2.2.10_x86_64.msi"
bitsadmin /transfer myDownLoadJob /download /priority normal "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7.box" "D:\vagrant_download\CentOS-7.box"
mkdir d:\vagrant_project
echo "下载完毕，请先安装virtualbox,再安装vagrant"