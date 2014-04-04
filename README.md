# 1. Markdown-TOC
Heading manager for markdown documents.

# 2. Table of Contents
[1. Markdown-TOC](#toc_0)
[2. Table of Contents](#toc_1)
[3. What it does](#toc_2)
[&nbsp;&nbsp;&nbsp;&nbsp;3.1. Heading numbers](#toc_3)
[&nbsp;&nbsp;&nbsp;&nbsp;3.2. Generate a TOC](#toc_4)
[4. Usage](#toc_5)
[5. Example](#toc_6)
[&nbsp;&nbsp;&nbsp;&nbsp;5.1. Project State](#toc_7)
[&nbsp;&nbsp;&nbsp;&nbsp;5.2. TODO](#toc_8)
[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.1. replace whole TOC chapter](#toc_9)

# 3. What it does

## 3.1. Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## 3.2. Generate a TOC
Also, if there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.

# 4. Usage

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.


# 5. Example
This file.


## 5.1. Project State
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

## 5.2. TODO

### 5.2.1. replace whole TOC chapter
If there's a chapter named "Table of Contents", it's whole body should get replaced with the dynamic TOC. This
way, the processor can be run in overwrite mode, without manually replacing the existing TOC with the [TOC] trigger tag.
