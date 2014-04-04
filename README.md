# <a name="md-toc_0"></a>1. <a name="md-toc_0"></a1. Markdown-TOC
Heading manager for markdown documents.

# <a name="md-toc_1"></a>2. <a name="md-toc_1"></a2. Table of Contents
[1. Markdown-TOC](#md-toc_0)

[2. Table of Contents](#md-toc_1)

[3. What it does](#md-toc_2)

&nbsp;&nbsp;&nbsp;&nbsp;[3.1. Heading numbers](#md-toc_3)

&nbsp;&nbsp;&nbsp;&nbsp;[3.2. Generate a TOC](#md-toc_4)

[4. Usage](#md-toc_5)

[5. Example](#md-toc_6)

[6. Known issues](#md-toc_7)

[7. TODO](#md-toc_8)

&nbsp;&nbsp;&nbsp;&nbsp;[7.1. replace whole TOC chapter, not via [TOC] marker](#md-toc_9)

&nbsp;&nbsp;&nbsp;&nbsp;[7.2. Tolerate inconsistent depth](#md-toc_10)

# <a name="md-toc_2"></a>3. <a name="md-toc_2"></a3. What it does

## <a name="md-toc_3"></a>3.1. <a name="md-toc_3"></a3.1. Heading numbers
This tool will remove any numbers after the "#" heading markers and replacing them with calculated ones

## <a name="md-toc_4"></a>3.2. <a name="md-toc_4"></a3.2. Generate a TOC
Also, if there's a line "[TOC]" in the markdown, it will be replaced with a generated, anchor-linked TOC.

# <a name="md-toc_5"></a>4. <a name="md-toc_5"></a4. Usage

    ./markdown-toc.rb INFILE [OUTFILE]

If `OUTFILE` is omitted, the result will be displayed.
If `OUTFILE` equals `INFILE`, the processor will work in overwrite mode.

# <a name="md-toc_6"></a>5. <a name="md-toc_6"></a5. Example
This file.

# <a name="md-toc_7"></a>6. <a name="md-toc_7"></a6. Known issues
This is just a quick and dirty writeup, to be used as a small tool and for flexing my coding muscles.
No real code documentation, no tests.

# <a name="md-toc_8"></a>7. <a name="md-toc_8"></a7. TODO

## <a name="md-toc_9"></a>7.1. <a name="md-toc_9"></a7.1. replace whole TOC chapter, not via [TOC] marker
If there's a chapter named "Table of Contents", it's whole body should get replaced with the dynamic TOC. This
way, the processor can be run in overwrite mode, without manually replacing the existing TOC with the [TOC] trigger tag.

## <a name="md-toc_10"></a>7.2. <a name="md-toc_10"></a7.2. Tolerate inconsistent depth
Be more forgiving: should allow depth jumps by more than 1.
"####" as a child to "##" shouldn't trigger an error.
