echo "桌面将会创建【vagrant_download】的文件夹，并将文件下载到此目录中:"
mkdir C:\Users\admin\Desktop\vagrant_download
bitsadmin /transfer myDownLoadJob /download /priority normal "https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Win.exe" "C:\Users\admin\Desktop\vagrant_download\VirtualBox-6.1.16-140961-Win.exe"
bitsadmin /transfer myDownLoadJob /download /priority normal "https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi" "C:\Users\admin\Desktop\vagrant_download\vagrant_2.2.10_x86_64.msi"

echo "下载完毕，请先安装virtualbox,再安装vagrant"