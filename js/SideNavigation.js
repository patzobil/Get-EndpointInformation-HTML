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