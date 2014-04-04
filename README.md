# <a name="toc_0"></a>1. Markdown-TOC
Heading manager for markdown documents.

# <a name="toc_1"></a>2. Table of Contents
[//]: # (TOC)
[1. Markdown-TOC](#toc_0)<br>
[2. Table of Contents](#toc_1)<br>
[3. What it does](#toc_2)<br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.1. Heading numbers](#toc_3)<br>
&nbsp;&nbsp;&nbsp;&nbsp;[3.2. Generate a TOC](#toc_4)<br>
[4. Usage](#toc_5)<br>
[5. Example](#toc_6)<br>
[6. Known issues](#toc_7)<br>
[7. TODO](#toc_8)<br>
&nbsp;&nbsp;&nbsp;&nbsp;[7.1. tolerate inconsistent depth](#toc_9)
[//]: # (/TOC)

# <a name="toc_2"></a>3. What it does

## <a name="toc_3"></a>3.1. Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## <a name="toc_4"></a>3.2. Generate a TOC
Also, if there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.

# <a name="toc_5"></a>4. Usage

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.

# <a name="toc_6"></a>5. Example
This file has been generated from `README_source.md`

# <a name="toc_7"></a>6. Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

# <a name="toc_8"></a>7. TODO

## <a name="toc_9"></a>7.1. tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.
