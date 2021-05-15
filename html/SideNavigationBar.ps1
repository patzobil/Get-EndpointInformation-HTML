#region NavigationBar
#* ************************************** SIDE NAVIGATION BAR ***************************************
$sideNavigation = @"
<div class="sidenav">
    <a class="inactive" onclick="activeLink('bioslink')" id="bioslink" href="#biosInfo">BIOS</a>
    <a class="inactive" onclick="activeLink('cpulink')" id="cpulink" href="#CPUInfo">Processor</a>
    <a class="inactive" onclick="activeLink('ramlink')" id="ramlink" href="#RAMInfo">RAM</a>
    <a class="inactive" onclick="activeLink('oslink')" id="oslink" href="#OSInfo">Operating System</a>
    <a class="inactive" onclick="activeLink('pslink')" id="pslink" href="#PSInfo">PowerShell</a>
    <a class="inactive" onclick="activeLink('driveslink')" id="driveslink" href="#diskInfo">Drives</a>
    <a class="inactive" onclick="activeLink('netlink')" id="netlink" href="#NICInfo">Network</a>
    <a class="inactive" onclick="activeLink('hostslink')" id="hostslink" href="#hostsInfo">Hosts File</a>
    <a class="inactive" onclick="activeLink('serviceslink')" id="serviceslink" href="#servicesInfo">Services</a>
    <a class="inactive" onclick="activeLink('appslink')" id="appslink" href="#appsInfo">Applications</a>
</div>
<script>
function activeLink(id) {
    var linksArray = ['bioslink', 'cpulink', 'ramlink','oslink', 'pslink', 'driveslink','netlink', 'hostslink', 'serviceslink', 'appslink'];
    linksArray.forEach(
        function (elemIds) {
        document.getElementById(elemIds).setAttribute("class", "inactive");
        }       
    );

    var elem = document.getElementById(id);
    elem.setAttribute("class", "active");
}
</script>
<div class='main'>
"@
#! ************************************** SIDE NAVIGATION BAR ***************************************
#endregion