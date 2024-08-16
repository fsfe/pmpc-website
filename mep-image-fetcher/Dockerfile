# SPDX-FileCopyrightText: 2024 Free Software Foundation Europe <https://fsfe.org>
#
# SPDX-License-Identifier: CC0-1.0

FROM python:3-alpine
WORKDIR /mep-image-fetcher

COPY mep-image-fetcher/requirements.txt ./
COPY mep-image-fetcher/mep-image-fetcher.py ./
COPY site/data/budget/meps.json ./

RUN pip install -r requirements.txt --root-user-action=ignore

CMD python3 ./mep-image-fetcher.py ./meps.json ./meps 
