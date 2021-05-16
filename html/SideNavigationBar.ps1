#region NavigationBar
#* ************************************** SIDE NAVIGATION BAR ***************************************
$sideNavigation = @"
<div class="sidenav">
    <a class="accordion" id="oslink" href="#OSInfo">Operating System</a>
    <a class="accordion" id="pslink" href="#PSInfo">PowerShell</a>
    <a class="accordion" id="hardwarelink" href="#biosInfo">Hardware</a>
    <div class="panel">
    <a class="" id="bioslink" href="#biosInfo">BIOS</a>
    <a class="" id="cpulink" href="#CPUInfo">Processor</a>
    <a class="" id="ramlink" href="#RAMInfo">RAM</a>
    </div>
    <a class="accordion" id="driveslink" href="#diskInfo">Drives</a>
    <a class="accordion" id="netlink" href="#NICInfo">Network</a>
    <div class="panel">
    <a class="" id="hostslink" href="#hostsInfo">Hosts File</a>
    </div>
    <a class="accordion" id="serviceslink" href="#servicesInfo">Services</a>
    <a class="accordion" id="appslink" href="#appsInfo">Applications</a>
</div>

<script type="text/javascript" src="$jsBaseFolder\SideNavigation.js"></script>
<div class='main'>
"@
#! ************************************** SIDE NAVIGATION BAR ***************************************
#endregion


<# 

<div class="sidenav">
    <a class="accordion" onclick="activeLink('oslink')" id="oslink" href="#OSInfo">Operating System</a>
    <a class="accordion" onclick="activeLink('pslink')" id="pslink" href="#PSInfo">PowerShell</a>
    <a class="accordion" onclick="activeLink('hardwarelink')" id="hardwarelink" href="#biosInfo">Hardware</a>
    <div class="panel">
    <a class="accordion" onclick="activeLink('bioslink')" id="bioslink" href="#biosInfo">BIOS</a>
    <a class="accordion" onclick="activeLink('cpulink')" id="cpulink" href="#CPUInfo">Processor</a>
    <a class="accordion" onclick="activeLink('ramlink')" id="ramlink" href="#RAMInfo">RAM</a>
    </div>
    <a class="accordion" onclick="activeLink('driveslink')" id="driveslink" href="#diskInfo">Drives</a>
    <a class="accordion" onclick="activeLink('netlink')" id="netlink" href="#NICInfo">Network</a>
    <div class="panel">
    <a class="accordion" onclick="activeLink('hostslink')" id="hostslink" href="#hostsInfo">Hosts File</a>
    </div>
    <a class="accordion" onclick="activeLink('serviceslink')" id="serviceslink" href="#servicesInfo">Services</a>
    <a class="accordion" onclick="activeLink('appslink')" id="appslink" href="#appsInfo">Applications</a>
</div>


#>