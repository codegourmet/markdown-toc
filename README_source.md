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

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.

# Example
This file has been generated from `README_source.md`

# Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

# TODO

## tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.
