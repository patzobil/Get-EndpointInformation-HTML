function findActive(){
    var linksArray = ['bioslink', 'cpulink', 'ramlink','oslink', 'pslink', 'driveslink','netlink', 'hostslink', 'serviceslink', 'appslink'];
    linksArray.forEach(
        function (elemIds) {
        document.getElementById(elemIds).setAttribute("class", "inactive");
        }       
    ); 
}

function activeLink(id) {
    findActive();
    var elem = document.getElementById(id);
    elem.setAttribute("class", "active");
}