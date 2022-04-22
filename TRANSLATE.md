# How to translate publiccode.eu

Translating the publiccode.eu website isn't really hard but may be a bit
different from what you worked with before. Before starting, please read the
[README.md](https://git.fsfe.org/pmpc/website/src/master/README.md) file which
will give you an overview of how this website is structured and built.

## Coordination

We experienced a large amount of people willing to contribute translations for
the campaign. While this is great, it requires a lot of coordination. So before
starting a translation:

- Please become member of FSFE's [translators mailing
  list](https://lists.fsfe.org/mailman/listinfo/translators).
- Write to the list that you'd like to start a translation to language
  XY. Please use [XY] in the mail's subject so members can filter the
  languages they need
- Please check whether there are already ongoing translations in your
  language by reading the latest mails in the [list's
  archive](https://lists.fsfe.org/mailman/private/translators/) or
  checking [open Pull
  Requests](https://git.fsfe.org/pmpc/website/pulls).

More information about FSFE's translators team can be found on its [general information page](https://fsfe.org/contribute/translators/).

## Preparations

You should already have cloned the Git repository to your computer and be
familiar with working with Git. You find the necessary instructions and links
to tutorials in the aforementioned README file. Don't be afraid: you don't have
to be a programmer to get Git working for you :)

What you should have:

- An account on git.fsfe.org (see [README.md#contribute](https://git.fsfe.org/pmpc/website/src/master/README.md#contribute))
- Know how to clone, pull, commit, and push with Git (read the [general
  Git guides](https://wiki.fsfe.org/TechDocs/Git) and the [typical
  Git workflow](https://wiki.fsfe.org/TechDocs/Git/Workflow))
- Optional: Hugo installed on your computer
- Optional: The ability to run Bash scripts from command line

## Translatable files

There are a few locations where you find translatable files. All of them are
inside the `site/` directory. Please note that we can only accept complete
translations of the website for technical reasons, except for the video
subtitles.

### Content/

In `content/` are the sub-pages like [/privacy](https://publiccode.eu/privacy).
All files are written in the [Markdown
syntax](https://en.wikipedia.org/wiki/Markdown) which is very easy to learn and
much more comfortable to write and translate than HTML.

Note that there is also a sub-directory called `openletter` which files should
be translated as well!

In all files you'll find a *header* which starts and ends with `---` (three
dashes). In this header, all you have to translate is the `title:` value which
defines the title and headline of the page. The other values like `type` and
`layout` stay the same over all languages.

The majority of the file is just text with very little markdown syntax. You
should keep markup like `**`, `>`, `[fs]`, or `{{< fsdefinition >}}`. For
hyperlinks like `[TEXT](http://link)`, please only translate the content inside
the quare brackets (TEXT), the link has to stay the same obviously.

### data/share/

In `data/share/en/`, `data/share/it/` and so on there are tiny *.yaml* files
for each share service we're offering (e.g. GNU Social or Diaspora).

There are only a few strings to translate. `titleBefore` is the text in front
of the service's name, `titleAfter` the one behind. You can fill both fields to
translate it. In English, this may be *Share on XYZ*, in German it is *Auf XYZ
teilen*. There's also `customText` sometimes where you can find instructions
how to translate it.

### i18n/

Here you can find one file for each language – e.g. `en.toml` for English,
`de.toml` for German. For each language we use [ISO 3166-1 alpha2
codes](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements).

If your language isn't present, copy the file `en.toml` and
rename it according to your two-letter language code. Then open it and
translate all strings you find (there are only a few marked which you cannot
translate).

Some strings contain the Markdown links you already know (`[TEXT](LINK)`).
Again, please just translate the TEXT part, not the LINK.

At some occasions you'll find a variable like `$INDS`. Leave them as is, they
will automatically replaced by numbers or similar auto-generated content.

Regarding the campaign name *Public Money, Public Code*. In the past we haven't
made good experiences with translating such campaign names. All our graphics,
logos, and other communication is using this brand. So if you can, just stick
to the English term.

For information about these translation strings, please go to [the official Hugo
documentation](https://gohugo.io/content-management/multilingual/#translation-of-strings).

### static/video-subs/

In this folder you can find the time-coded subtitles for the PMPC video. They
exist in the WebVTT format. Unlike the other files, you don't necessarily need
to provide a translation of the subtitles in order to allow us to localise the
website.

### config.toml

To activate your new language, please add it to
[config.toml](https://git.fsfe.org/pmpc/website/src/branch/master/site/config.toml).
Please do not change any existing content here. Your entry could look
like this:

```
[Languages.sv]
  languageCode  = "sv"        # <-- two letter code
  languageName  = "Svenska"   # <-- name of your language in your language
```

## Where to upload the translations?

**Before submitting** the translations you can test them locally if you
have Hugo installed and are able to execute Bash scripts on your command
line. Please refer to [build section in
README.me](https://git.fsfe.org/pmpc/website/src/master/README.md#build)
for instructions.

You're welcome to work with the Git repository to upload your
translations. If you feel confident enough with Git, please open a pull
request of a separate branch in this repository or your fork. @max.mehl
can help you if you have questions or lack permissions.

For Git, there are three ways which are explained in the aforementioned
build README section:
1. Git Pull Requests from your repository forks
2. Git pushes to the central master branch (requires write access)
3. Edit the files directly in the git.fsfe.org web interface (requires
   write access)

If you are unsure, you can also send the translations to [FSFE's translators
list](https://lists.fsfe.org/mailman/listinfo/translators) to let them
proofread by other speakers of your language.

## How to show missing translations?

If a string in your language isn't translated, the default English
version will be used. To find out which parts are missing, you need
`hugo` installed on your computer.

Please navigate to the `site/` subdirectory and execute `hugo
--i18n-warnings | grep i18n`. This shows a list of all missing
translations of all languages. Please look out for your language code
in the third column. The fourth column shows the name of the string
which is missing in your i18n file.
