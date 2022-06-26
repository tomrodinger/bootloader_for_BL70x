echo "* * * CAREFUL! About to delete the build_essential directory. Make sure you don't have unsaved source files there * * *"
echo "Press CTRL-C now if you are in doubt"
sleep 1
rm -rf ../build_essentials
make clean
#find . -name "*cli_cmds.c" -exec touch {} \;
#find . -name "bas.c" -exec touch {} \;
#find . -name "crypto.h" -exec touch {} \;
find . -type d -name "cli_cmds" -exec touch {}/empty \;
find . -type d -name "services" -exec touch {}/empty \;
find . -type d -name "psa" -exec touch {}/empty \;
./build_script.sh
make clean
rm -rf ccc.sh
find . -type f -atime -2m | awk '{printf("gcp --parents %s ../build_essentials/\n", $0)}' > ./ccc.sh
chmod u+x ccc.sh
mkdir -p ../build_essentials
mkdir -p ../bootloader_bin_file_releases
./ccc.sh
rm -rf ccc.sh
echo "The required files for building are now located in the build_essentials directory"

cd ../build_essentials/bootloader_source/
./build_script.sh

