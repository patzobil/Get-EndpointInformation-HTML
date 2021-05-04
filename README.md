# Get-EndpointInformation

Here's a little useful tool for SYSADMINS and Support Helpdesks, to collect various pieces of information from Windows Computers and Servers, using the WMI and CIM libraries.

Firstly the info is collected into fragments, it is then put together into one CSS formatted HTML Report.

#### Currently Collected Info

> * Hostname
> * Last Boot Time
> * Operating System
> * Hardware
>
>   * BIOS
>   * Chipset
>   * RAM
> * PSVersionTable
> * Logical Disks
> * Network Adapters
>
>   * Hosts File
> * Installed Applications
> * Windows Services

#### TO-DO

* [ ] Collect User Info, SID
* [ ] Capture LogonDomain Information
* [ ] Public IP is collected but not Displayed
* [ ] Route Print
* [ ] Collect Windows Event Logs (SYSTEM, Application)  - First 25 Errors/Warnings
* [ ] Collect local users and groups
* [ ] Check Java Versions
* [ ] Collect Startup Apps
