# Layer 1 Switch Shell Standard

In this guide, we will guide you on how to create your L1 switch shell, implement its automation commands, test and use it in CloudShell.

In this guide:

* [Creating a new shell and installing the shell's environment](#CreateNewDriver)
* [Implementing the shell in CloudShell](#ImplementDriver)
* [Testing the shell in CloudShell](#TestNewDriver)
* [Building and installing the shell's package on CloudShell](#BuildInstallDriver)

<a name="CreateNewDriver"></a>

## Creating a new shell and installing the shell's environment

1. Start a new project with <a href="https://github.com/QualiSystems/shellfoundry" target="_blank">shellfoundry</a>. We recommend to do that in CloudShell's *Drivers* folder (usually at *C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers* on the Quali Server machine):

    `shellfoundry new ShellName --template layer-1-switch`

2. To install the shell's environment and dependencies defined in the shell's *requirements.txt* file, in command-line, navigate to the shell's root folder and run the appropriate command:
 
    * If you're using Quali's default python interpreter, which resides at *~\QualiSystems\CloudShell\Server\python*, run the following:

        `install_driver.bat`

    * If you want to use a different python interpreter, do the following:
        1. Install the *virtualenv* package by running:
        
            `<interpreter-path>\python.exe -m pip install virtualenv` using your python interpreter
        
        2. And then run:
        
            `install_driver.bat "<interpreter-path>\python.exe"`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The shell is installed on CloudShell.

3. To verify, return to the *\Drivers* folder at *~\QualiSystems\CloudShell\Server\Drivers*, and run the new shell exe file.
<a name="ImplementDriver"></a>

A command-line output similar to this should be displayed:

```
Starting driver shellname
""C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers\cloudshell-L1-sh
ellname\Scripts\python.exe" "C:\Program Files (x86)\QualiSystems\CloudShell\Serv
er\Drivers\cloudshell-L1-shellname\main.py" 4000 "C:\Program Files (x86)\QualiSy
stems\CloudShell\Server\Drivers\..\Logs""
Listen address 0.0.0.0:4000
```

## Implementing the shell in CloudShell

Now that you have a new shell, it is time to implement the shell's commands. Note that at this point, the L1 shell includes the command structure but no working commands.

1. Implement methods of the *DriverCommands* class in *<project_slug>/driver_commands.py*. 

    * Follow the <a href="https://github.com/QualiSystems/shell-L1-standard/blob/dev/DEVGUIDE.md" target="_blank">DEVGUIDE</a> and docstrings with description, as an example of an L1 shell with CLI usage you can refer to the <a href="https://github.com/QualiSystems/cloudshell-L1-mrv" target="_blank">cloudshel-L1-mrv</a> project.
    * To debug the driver, use the <a href="https://github.com/QualiSystems/shell-L1-template/blob/dev/DEBUGGING.md" target="_blank">DEBUGGING GUIDE</a>.

2. Update the shell's version in the *version.txt* file.
<a name="TestNewDriver"></a>

## Testing the shell in CloudShell

Do the following in Resource Manager Client.

1. Import the new data model. 
    1. In the **Resource Families** explorer, right-click **Resource Families** and selct **Import**.
    2. In the driver package's *datamodel* folder, select the *ResourceConfiguration.xml* file (for example *shellname_ResourceConfiguration.xml*) and click **Open**.
2. Create an L1 resource. 
    1. In **Resource Explorer**, right click **Root** and create a new resource.
    2. Give it a **Name**, and the device's **Address**. 
    3. Select the L1 Switch **Family** and make sure the correct **Model** and **Driver** are selected.
    4. Click **OK**.
    
3. <a href="http://help.quali.com/Online%20Help/9.0/Portal/Content/Admn/Cnct-Ctrl-L1-Swch.htm" target="_blank">Follow this guide</a> to set the timeout period (for L1 shell drivers in CloudShell), autoload and configure your L1 resource's physical connections.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Autoload and any other commands executed on the L1 resource are logged at *~\QualiSystems\CloudShell\Server\Logs*.

4. After validating Autoload, you can validate the mapping functions either in Resource Manager Client (in the L1 resource's **Settings>Mappings** page, or in CloudShell Portal, by <a href="http://help.quali.com/Online%20Help/9.0/Portal/Content/CSP/LAB-MNG/Rsc-Cnct/Phys-Ntwrk-Crt.htm" target="_blank">creating a blueprint</a> with 2 resources and a route, then reserving this blueprint and connecting the route.
<a name="BuildInstallDriver"></a>

## Building and installing the shell's package on CloudShell

Once you’ve finished implementing and testing the shell, it’s time to create the shell package and install it in your CloudShell production environment. Note that you can skip this stage altogether if you developed your shell in the production environment.

1. From the shell's root folder, run the following command:
    
    `Scripts\build_driver.exe`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The L1 shell package is created in the shell project's *dist* folder, bearing the shell's name and version.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For example: *dist\cloudshell-L1-DriverName-1.0.1.zip*

2. In the *dist* folder, extract the shell package.

3. Open the extracted folder and copy the shell folder to the *\Drivers* folder at *C:\\Program Files (x86)\\QualiSystems\\CloudShell\\Server\\Drivers*.


4. Install the shell's environment and dependencies, as explained in step 2 in section [Creating a new driver and installing the driver's environment](#CreateNewDriver).

4. Install the shell on CloudShell, as explained in steps 1-3 in section [Testing the driver in CloudShell](#TestNewDriver).


