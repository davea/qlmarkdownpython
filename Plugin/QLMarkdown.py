#!/usr/bin/env python
# encoding: utf-8
"""
QLMarkdown.py

Created by Dave Arter on 2009-02-04.
Copyright (c) 2009 __MyCompanyName__. All rights reserved.
"""
import sys
sys.path.append('/System/Library/Frameworks/Python.framework/Versions/2.5/Extras/lib/python/PyObjC/')

from Foundation import NSObject

from markdown2 import markdown2

class QLMarkdown(NSObject):
    def convertText_(self, text):
        return markdown2.markdown(text)
