#!/usr/bin/env bash
set -e


# source_prefix="$PROJECTS/starling"
tmp_prefix="$HOME/tmp/starling"
# install_prefix="$tmp_prefix/install"
starling_version="0.0.5"

# cd $source_prefix

# Create source distribution.
python setup.py sdist


# Install package in virtual environment and perform some tests.
rm -fr $tmp_prefix/python
# virtualenv --system-site-package $tmp_prefix/python
virtualenv $tmp_prefix/python
source $tmp_prefix/python/bin/activate
pip install --find-links=file://`pwd`/dist "starling==$starling_version"
tree $tmp_prefix/python/lib/python*/site-packages/starling*


echo "********************************************************"
cd $HOME
python -c \
    "import starling, starling.flask, starling.time_point; print(\"installed Starling version {}\".format(starling.__version__))"
cd -
echo "********************************************************"


# Upload distributions.
pip install twine
# twine upload dist/starling-${starling_version}.tar.gz
