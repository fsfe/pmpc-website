# Editing mep data
To flag the position of an meps one must add information to meps.json in this folder
If they support free software please add
"supportsFs": "yes",
If they are against free software please add
"supportsFs": "no",
If they have no position either add no supportsFs value, or add
When adding or changing a supportsFs tag please add a supportsFs-source tag as well.
For example:
"supportsFsSources": [ { "href": "https://docs.fsfe.org/", "text": "docs"},{ "href": "https://fsfe.org/", "text": "main"} ],
