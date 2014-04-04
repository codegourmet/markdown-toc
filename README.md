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

Usage: markdown-toc.rb [options] input.md [output.md]

Specific options:
    -s, --strip                      remove generated TOC content
    -i, --ignore-root                ignore root heading (e.g. project name)
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

## "strip" option
Implement option to strip out TOC and all generated TOC anchor refs.

## "replace" option
Implement option to replace file (already possible, but --replace flag would be nice).

## "ignore-root" option
Often, everything is inside <h1>ProjectName</h1>. This results in the undesirabler behaviour of every subheading being prefixed with "1."

## tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.
