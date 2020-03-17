#Original
yum list
yum install -y binutils*
yum install -y compat-db*
yum install -y control-center*
yum install -y gcc*
yum install -y gcc-c*
yum install -y gcc-c++*
yum install -y glibc*
yum install -y glibc-common*
yum install -y gnome-libs*
yum install -y libstdc*
yum install -y libstdc++-devel*
yum install -y make*
yum install -y pdksh*
yum install -y sysstat
yum install -y xscreensaver
yum install -y libaio-devel*
yum install -y libaio*
yum install -y setarch*
yum install -y openmotif*
yum install -y compat-gcc*
yum install -y compat-libstdc*
yum install -y gnome*

#Extended
yum install -y compat-libstdc++-33*
yum install -y elfutils-libelf*
yum install -y elfutils-libelf-devel*
yum install -y expat*
yum install -y glibc-devel*
yum install -y glibc-headers*
yum install -y libgcc*
yum install -y libstdc++*
yum install -y libstdc++-devel*
yum install -y unixODBC*
yum install -y unixODBC-devel*

rpm -q binutils compat-db control-center gcc gcc-c gcc-c++ glibc glibc-common gnome-libs libstdc libstdc++-devel make pdksh sysstat xscreensaver libaio-devel libaio setarch openmotif compat-gcc compat-libstdc gnome compat-libstdc++-33 elfutils-libelf elfutils-libelf-devel expat glibc-devel glibc-headers libgcc libstdc++ libstdc++-devel unixODBC unixODBC-devel | grep "not install"
