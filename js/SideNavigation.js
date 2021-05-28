function findActive(){
    var linksArray = ['hardwarelink', 'bioslink', 'cpulink', 'ramlink','oslink', 'pslink', 'driveslink','netlink', 'hostslink', 'serviceslink', 'appslink'];
    linksArray.forEach(
        function (elemIds) {
        document.getElementById(elemIds).setAttribute("class", "accordion");
        }       
    ); 
}

function activeLink(id) {
    findActive();
    var elem = document.getElementById(id);
    // elem.setAttribute("class", "active");
}

function openNav() {
    document.getElementById("sidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("sidenav").style.width = "0";
}


//Panel-like Items
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function () {
        findActive();
        // this.setAttribute("class", "active");
        this.classList.toggle("active");
        // this.classList.toggle("inactive");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }
    });
}