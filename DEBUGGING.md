# Layer 1 Switch Shell Debugging

This guide is a short review of Python Layer 1 (L1) shell debugging process.


## Run PyCharms as SYSTEM
To attach PyCharms debugger to the driver process called by CloudShell, it should be run as SYSTEM.
An easy way to get a CMD prompt as SYSTEM is to grab [PSEXEC](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec) from Microsoft Sysinternals:

1. Download [PSEXEC](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec) and unzip to some folder.
2. Open an elevated CMD prompt as an administrator.
3. Navigate to the folder where you unzipped PSEXEC.EXE
4. Run:
    ```cmd
         PSEXEC -i -s -d CMD
    ```
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You will have a new CMD prompt open, as SYSTEM.

6. Run PyCharm in the opened CMD:
    ```cmd
    C:\Program Files (x86)\JetBrains\PyCharm Community Edition 2016.1.4\bin\pycharm.exe
    ```

## Open the shell as a Project in PyCharm and configure the interpreter 
1. Click **Open** and select the shell's root folder. For example, *C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers\cloudshell-L1-driver_example*.
2. Specify the Project interpreter from the shell's virtualenv. Set the python executable from the shell's folder, for example, *C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers\cloudshell-L1-driver_example\Scripts\python.exe*


## Run the shell in debug mode
1. Edit the shell's **Runtime Configuration** - *C:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers\cloudshell-L1-driver_example\driver_example_RuntimeConfig.yml*
2. Specify *DEBUG_ENABLED* option to *TRUE*
    ```yaml
    DEBUG_ENABLED: TRUE
    ```
3. Kill the shell's python process. Find the PID (process id) of the shell's driver process in the commands log and kill it in Task Manager.

## Attach PyCharm's debugger to the driver process
1. Specify breakpoints in the shell project's source files.
2. Use CloudShell to call one of the shell's commands. For example, call *Autoload* in Resource Manager Client. 
3. In the shell's commands log, find the PID of the driver process.
4. Attach PyCharms debugger to the driver process. In PyCharm, click **Run>Attach to LocalProcess** and select the process with the same PID you found in the commands log.
5. Wait until it stops on the breakpoint.
