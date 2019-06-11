# Shutters (codename)
Operating System
Shutters is an operating system based on the linux kernel that can use any type of package management, along with unique hardware 
configurations.

***June 11th, 2019***

Shutters multi-distro package installer (for lack of a better name)
Working on configuring apt-get on CentOS 7 (x86_64)

Please note: These are only instructions to compile apt on CentOS. Successful builds and/or implementations have not yet been accomplished on a CentOS system, and there are problems I have yet to come across. 

CMake 3.15 is required to begin compiling apt. In CentOS, this package is not available, for whatever reason. 
To compile, start with 

./bootstrap --prefix=/usr

./configure

make

sudo make install 

You must set the path if you build CMake this way, otherwise you may get an error like "could not find CMAKE_ROOT"

To fix this, export the following path:

export CMAKE_ROOT=/path_to_install_dir/cmake_directory/share/cmake-3.15

Let me know if other errors persist, I cannot recall if there were any extra steps involved to getting it working properly

I recommend creating a build directory for apt, as the home directory gets far too cluttered when the apt source code gets built. Lets call it apt-build for now.

In the build directory, type cmake ../apt
You will get errors about dpkg-version or something similar. Apt is looking for debians package maintenance system, or dpkg.
Find the source for dpkg online, and go into its directory. Run the following commands to build:

./autogen

./configure

It will gripe about using an old version of perl, so the newest version needs to ALSO get built. I am not sure why these packages are so outdated in CentOS, especially after running yum update. Get Perl-5.30.0 or whatever the latest stable version is, and install it. I built from source, but I believe you can also download the .rpm for it. If not, I will include build instructions.

Now dpkg should be configured, and you can run make and make install.

Finally, another attempt at building apt can be made, but as of now, we are only greeted with:
-- Checking for module 'liblz4'
--   No package 'liblz4' found
-- Checking for module 'libzstd'
--   No package 'libzstd' found
-- Could NOT find ZSTD (missing: ZSTD_INCLUDE_DIRS ZSTD_LIBRARIES) 
-- Could NOT find Systemd (missing: SYSTEMD_INCLUDE_DIRS) 
-- Checking for module 'libseccomp'
--   No package 'libseccomp' found
-- Could NOT find SECCOMP (missing: SECCOMP_INCLUDE_DIRS SECCOMP_LIBRARIES)




