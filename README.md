# Markdown-TOC
Heading manager for markdown documents.

# Table of Contents
[TOC] (TODO: make github flavor compatible!)

# What it does

## Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## Generate a TOC
Also, if there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.

# Usage

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.

## Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

Github: note that this tool is incompatible with github-flavored markdown.


## TODO

### replace whole TOC chapter, not via [TOC] marker
If there's a chapter named "Table of Contents", it's whole body should get replaced with the dynamic TOC. This
way, the processor can be run in overwrite mode, without manually replacing the existing TOC with the [TOC] trigger tag.

### Github flavored markdown
Low-pri: doesn't make too much sense, since github already has a TOC rendering feature.
Known issues with this tool:
- linebreaks in generated TOC are missing
- github has "pretty" heading anchors, so indexed anchors in generated TOC are wrong
