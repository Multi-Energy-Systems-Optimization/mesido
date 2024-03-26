# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys

from mesido._version import get_versions

import sphinx_rtd_theme

sys.path.insert(0, os.path.abspath('../src'))

# -- Project information -----------------------------------------------------

project = 'Nieuwe Warmte Nu - Design Toolkit'
author = 'Kelbij Star, Teresa Piovesan, et al.'
review = 'Jesus Andres Rodriguez Sarasty, Ivo Pothof, Mike van Meerkerk'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.autodoc',
              'sphinx.ext.intersphinx',
              'sphinx.ext.todo',
              'sphinx.ext.coverage',
              'sphinx.ext.mathjax',
              'sphinx.ext.viewcode',
              'sphinx.ext.graphviz',
              'sphinx.ext.autosectionlabel',
              'sphinxcontrib.bibtex']

mathjax3_config = {'chtml': {'displayAlign': 'left',
                             'displayIndent': '2em'}}

bibtex_bibfiles = ['references.bib']

# -- GraphViz configuration ----------------------------------
graphviz_output_format = 'svg'

# Make sure the target is unique
autosectionlabel_prefix_document = True

# Enable numref
numfig = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.

# The full version, including alpha/beta/rc tags.
release = get_versions()['version']
del get_versions

# The short X.Y version.
version = '.'.join(release.split('.')[:2])

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_css_files = [
    'css/custom.css',
]

# Intersphinx: refer to the RTC-Tools standard library.
# intersphinx_mapping = {'rtctools': ('https://rtc-tools.readthedocs.io/en/latest/', None)}
