#region NavigationBar
#* ************************************** SIDE NAVIGATION BAR ***************************************
$sideNavigation = @"
<div class="sidenav">
    <a class="disabled" onclick="activeLink('bioslink')" id="bioslink" href="#biosInfo">BIOS</a>
    <a class="disabled" onclick="activeLink('cpulink')" id="cpulink" href="#CPUInfo">Processor</a>
    <a class="disabled" onclick="activeLink('ramlink')" id="ramlink" href="#RAMInfo">RAM</a>
    <a class="disabled" onclick="activeLink('oslink')" id="oslink" href="#OSInfo">Operating System</a>
    <a class="disabled" onclick="activeLink('pslink')" id="pslink" href="#PSInfo">PowerShell</a>
    <a class="disabled" onclick="activeLink('driveslink')" id="driveslink" href="#diskInfo">Drives</a>
    <a class="disabled" onclick="activeLink('netlink')" id="netlink" href="#NICInfo">Network</a>
    <a class="disabled" onclick="activeLink('hostslink')" id="hostslink" href="#hostsInfo">Hosts File</a>
    <a class="disabled" onclick="activeLink('serviceslink')" id="serviceslink" href="#servicesInfo">Services</a>
    <a class="disabled" onclick="activeLink('appslink')" id="appslink" href="#appsInfo">Applications</a>
</div>
<script type="text/javascript" src="$jsBaseFolder\SideNavigation.js"></script>
<div class='main'>
"@
#! ************************************** SIDE NAVIGATION BAR ***************************************
#endregion