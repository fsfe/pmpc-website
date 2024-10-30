# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Build site
FROM klakegg/hugo:0.112.0-ext-debian-onbuild AS hugo

# Serve site
FROM pierrezemb/gostatic
COPY --from=hugo /target/ /srv/http/
