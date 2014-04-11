# Markdown-TOC
Heading manager for markdown documents.

# Table of Contents
[TOC]

# What it does

## Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## Generate a TOC
If there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.
Also, any existing TOC generated with this tool will be updated.

# Usage

    markdown-toc.rb [options] input.md [output.md]

Specific options:
    -s, --strip                      remove generated TOC content
    -a, --no-anchors                 e.g. gitlab mode: no hrefs for chapters
    -r, --replace                    replace input file

Common options:
    -h, --help                       Show this message

If `OUTFILE` is omitted, the result will be printed to stdout.

You can also symlink this file for easier use:
    sudo ln -s PATH_TO_THIS_REPO/markdown-toc.rb /usr/bin/markdown-toc

# Example
This file has been generated from `README_source.md`

# Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

# TODO

## `&nbsp;` hack
I couldn't get nested lists with depth > 2 to work with all markdown flavors (github, gitlub, markdown1).
The only way to enforce the indentation was to hardcode multiple `&nbsp;`s. I might want to give this another try, because the way it's done now seems a bit WTF-y to me.

## "ignore-root" option
Often, everything is inside `<h1>ProjectName</h1>`. This results in the undesirable behaviour of every subheading being prefixed with "1."

## tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.

## code documentation
document in main file how code is organized internally

## tests
it's really not a quick hack anymore

## refactor main script file
toc handling and chapter numbers handling should become two distinct classes, called from main
