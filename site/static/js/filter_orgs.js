function selectOrgType(type) {
    let li_orgs = document.getElementsByClassName('org');

        for (i = 0; i < li_orgs.length; i++) {
            if (li_orgs[i].getAttribute('orgtype') !== type) {
                li_orgs[i].style.display = "none";
            } else {
                li_orgs[i].style.display = "inline-block";
            }
        }
}

function showAllOrgs() {
    let li_orgs = document.getElementsByClassName('org');

    for (i = 0; i < li_orgs.length; i++) {
        li_orgs[i].style.display = "inline-block";
    }
}
