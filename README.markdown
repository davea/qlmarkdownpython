QLMarkdownPython
================

A Quick Look generator for [Markdown][0] files, using [markdown2.py][1].

[0]: http://daringfireball.net/projects/markdown/
[1]: http://code.google.com/p/python-markdown2/

This generator uses the PyObjC bridge to natively call a Python implementation of Markdown, rather than hacking around with subprocesses and pipes, etc.


Installing
----------

Run 'make' in the Plugin directory, build the project in Xcode, then put the resulting .qlgenerator bundle in ~/Library/QuickLook