/*
PMPC website
Copyright (C) 2024 FSFE

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

function filterMeps() {
  let li_meps = document.getElementsByClassName("mep");
  const supportsFs = document.querySelector("#supportsFs").value;
  const country = document.querySelector("#country").value;
  const group = document.querySelector("#group").value;
  for (i = 0; i < li_meps.length; i++) {
    if (
      li_meps[i].getAttribute("supportsFs") !== supportsFs &&
      supportsFs !== "All"
    ) {
      li_meps[i].style.display = "none";
    } else if (
      li_meps[i].getAttribute("country") !== country &&
      country !== "All"
    ) {
      li_meps[i].style.display = "none";
    } else if (
      li_meps[i].getAttribute("group") !== group &&
      group !== "All"
    ) {
      li_meps[i].style.display = "none";
    } else {
      li_meps[i].removeAttribute("style");
    }
  }
}
