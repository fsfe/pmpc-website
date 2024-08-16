# SPDX-FileCopyrightText: 2024 Free Software Foundation Europe <https://fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

############### IMPORTS
# stdlib
import argparse
import datetime
import pathlib

# third party
import typeguard
import requests
import ijson.backends.yajl2_c as ijson


################ MAIN FUNCTION
@typeguard.typechecked
def main():
    parser = argparse.ArgumentParser(description="Fetch mep images for pmpc website")
    parser.add_argument("meps_json", help="json file to parse for mep ids")
    parser.add_argument("target", help="Folder to place images in")

    args = parser.parse_args()
    print(
        "----------------------",
        "\nRunning program mep-image-fetcher",
        "\ntime     :",
        f"{datetime.datetime.now()}",
        "\nmeps_json :",
        args.meps_json,
        "\ntarget   :",
        args.target,
    )

    print("Start parsing json")
    ids = parse_json(args)
    print("Finished parsing json!")
    pathlib.Path(args.target).mkdir(parents=True, exist_ok=True)
    print("Start making sure images available")
    for id in ids:
        if pathlib.Path(f"{args.target}/{id}.jpg").exists():
            # print(f"File {args.target}/{id}.jpg exists.")
            continue
        else:
            # print(f"File {args.target}/{id}.jpg does not exist, downloading")
            url = f"https://www.europarl.europa.eu/mepphoto/{id}.jpg"
            r = requests.get(url)
            with open(f"{args.target}/{id}.jpg", "wb") as f:
                f.write(r.content)
    print("Images all available")
    print("Finished!")


# Other functions
@typeguard.typechecked
def parse_json(args: argparse.Namespace) -> list:
    with open(args.meps_json) as file:
        ids = list(map(lambda item: item["UserID"], ijson.items(file, "item")))

    return ids


if __name__ == "__main__":
    main()
