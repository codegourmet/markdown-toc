# 1. Markdown-TOC
Heading manager for markdown documents.

# 2. Table of Contents
(TODO: make github flavored markdown compatible!)

# 3. What it does

## 3.1. Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## 3.2. Generate a TOC
Also, if there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.

# 4. Usage

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.

## 4.1. Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

Github: note that this tool is incompatible with github-flavored markdown.


## 4.2. TODO

### 4.2.1. replace whole TOC chapter, not via [TOC] marker
If there's a chapter named "Table of Contents", it's whole body should get replaced with the dynamic TOC. This
way, the processor can be run in overwrite mode, without manually replacing the existing TOC with the [TOC] trigger tag.

### 4.2.2. Tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.

### 4.2.3. Github flavored markdown
Low-pri: doesn't make too much sense, since github already has a TOC rendering feature.
Known issues with this tool:
- linebreaks in generated TOC are missing
- github has "pretty" heading anchors, so indexed anchors in generated TOC are wrong
