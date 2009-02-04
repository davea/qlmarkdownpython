
"""
For building a loadable bundle from 'example.py'. Assuming example.py defines
a class named `ExampleClass`, you should be able to create an instance of
ExampleClass from within Objective-C using::

    id b = [NSBundle bundleWithPath:pathToPlugin];
    Class cls = [b principalClass];
    id example = [[class alloc] init];

Set `site_packages=False` in the options dict to not use the system site-packages
directory.

Usage:
    python setup.py py2app
"""
from setuptools import setup

infoPlist = dict(
	CFBundleDevelopmentRegion='English',
	CFBundleIdentifier='org.minuszero.QLMarkdown',
	NSPrincipalClass='QLMarkdown',
)

setup(
	plugin=['QLMarkdown.py'],
    setup_requires=['py2app'],
    requires=['pyobjc'],
	options=dict(py2app=dict(
        plist=infoPlist,
        site_packages=True
    )),
)