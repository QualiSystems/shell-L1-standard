# Shell L1 Driver Standard

**Create a new driver and install the driver's environment:**

1. Start a new project with [shellfoundry](https://github.com/QualiSystems/shellfoundry), better to do that in the *Drivers* folder of QualiServer installation, usually this is *C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers*:
```bash
shellfoundry new DriverName --template layer-1-switch
```
2. Install the driver's environment and dependencies from requirements.txt. Enter to the driver's folder and run script *install_driver.bat*
```bash
install_driver.bat
```
You can specify the driver's python interpreter by adding it as a first argument to the script.
```bash
install_driver.bat "c:\Python27\python.exe"
```

**Implementation:**

1. Implement methods of the DriverCommands class in <project_slug>/driver_commands.py. Follow the [DEVGUIDE](https://github.com/QualiSystems/shell-L1-standard/blob/dev/DEVGUIDE.md) and docstrings with description, as an example of an L1 driver with CLI usage you can reffer to the [cloudshel-L1-mrv](https://github.com/QualiSystems/cloudshell-L1-mrv) project.
To debug the driver use the [DEBUGGING GUIDE](https://github.com/QualiSystems/shell-L1-template/blob/dev/DEBUGGING.md).

2. Update the driver version in version.txt

**Test in CloudShell:**
1. [Follow this guide](http://help.quali.com/Online%20Help/8.1.0.4291/Portal/Content/Admn/Cnct-Ctrl-L1-Swch.htm) to import the new datamodel, create a resource, set the timeout period, auto load it and configure its physical connections
  * When you execute the auto load (or any other command later), the log files will get created under the Server\\Logs folder
2. After validating the auto load, you can validate the mapping functions either from Resource Manager or in the CloudShell Portal, [build a blueprint](http://help.quali.com/Online%20Help/8.1.0.4291/Portal/Content/CSP/LAB-MNG/Rsc-Cnct/Phys-Ntwrk-Crt.htm) with 2 resources and a route, then reserve this blueprint and connect the route.


**Build the driver package:**

* In the driver's folder run command *build_driver*. It will create a zip package *dist\cloudshell-L1-DriverName-1.0.1.zip*
    
```bash
    Scripts\build_driver.exe
```
 
    
**Install the driver package:**
* Extract the driver package to the Drivers folder *C:\\Program Files (x86)\\QualiSystems\\CloudShell\\Server\\Drivers*
* In the driver's folder *C:\\Program Files (x86)\\QualiSystems\\CloudShell\\Server\\Drivers\\cloudshell-L1-DriverName* run *install_driver.bat*
```bash
    install_driver.bat
```

