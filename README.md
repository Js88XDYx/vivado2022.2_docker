# Vivado 2022.2 Docker image

This repository contains a Vivado 2022.2 docker image based on Ubuntu 20.04.

## Usage

1. Download the `Xilinx Unified Installer 2022.2: Linux Self Extracting Web Installer`
   and place into the directory.
2. Adapt `install_config.txt` to your likings, or regenerate
   `install_config.txt` by running
   `./Xilinx_Unified_2022.1_0420_0327_Lin64.bin -- --batch ConfigGen` and
   copying the generated file into the directory.
3. Build the docker image by running `./build.sh`.
4. At the beginning of the `./build.sh` script you need to log in with your
   Xilinx credentials in order to create a authenication token for the web
   installer.
5. Adjust the `PROJECT_PATH` variable in `run.sh` to mount your project folder
   and run the docker image with `./run.sh`.
6. Run the following commands (fixes are added to Dockerfile but currently untested on initial-testing branch):
   ```
   export _JAVA_AWT_WM_NONREPARENTING=1 # fixes empty white window when Vivado is launched
   export NO_AT_BRIDGE=1                # possibly not necessary but may help prevent dbind warning in Vitis
   sudo chmod 666 /dev/ttyUSB1          # allows access to serial port for Vitis serial link
   sudo apt install gcc dbus-x11 xterm make -y # missing dependencies
   ```
7. Start Vivado from the docker terminal with `vivado`.

## Sources
Hardware access changes follow [arthurfprecht/vivado2025.1_docker](https://github.com/arthurfprecht/vivado2025.1_docker/tree/master).

Other sources referenced for fixes:
* https://stackoverflow.com/questions/24225647/docker-a-way-to-give-access-to-a-host-usb-or-serial-device
* https://adaptivesupport.amd.com/s/question/0D52E00006lNCntSAG/how-to-connect-to-vitis-serial-terminal?language=en_US
