# Get-EndpointInformation

Here's a little script that collects various pieces of information from Windows Computers and Servers, using the WMI and CIM libraries.

Firstly the info is collected into fragments, it is then put together into one CSS formatted HTML Report.

Currently Showing Info about the below:

> * Hostname
> * Last Boot Time
> * Operating System
> * BIOS
> * Chipset
> * PSVersionTable
> * Logical Disks
> * Network Adapters
>   * Hosts File
> * Installed Applications
> * Windows Services


TODOs:

* [ ] Collect User Info, SID
* [ ] Public IP is collected but not Displayed
* [ ] Capture LogonDomain Information and Display it
* [ ] print route
* [ ] Collect Windows Event Logs (SYSTEM, Application)  - First 25 Errors/Warnings
* [ ] Collect local users and groups
