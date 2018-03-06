/*
PMPC website
Copyright (C) 2018 FSFE

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

function selectOrgType(type) {
    let li_orgs = document.getElementsByClassName('org');

    for (i = 0; i < li_orgs.length; i++) {
        if (li_orgs[i].getAttribute('orgtype') !== type) {
            li_orgs[i].style.display = "none";
        } else {
            li_orgs[i].style.display = "inline-block";
        }
    }

    // Hide the 'expand' arrow if there is no need for it
    if (countOrgsToDisplay(li_orgs, type) < 27) {
        document.getElementsByClassName('expand')[0].style.visibility = 'hidden';
    } else {
        document.getElementsByClassName('expand')[0].style.visibility = 'visible';
    }
}

function showAllOrgs() {
    let li_orgs = document.getElementsByClassName('org');

    for (i = 0; i < li_orgs.length; i++) {
        li_orgs[i].style.display = "inline-block";
    }

    // The expand arrow must always be visible if we show all organisations
    document.getElementsByClassName('expand')[0].style.visibility = 'visible';
}

function countOrgsToDisplay(orgs, type) {
    return Array.from(orgs).filter(function(element) {
        return element.getAttribute('orgtype') === type;
    }).length;
}
