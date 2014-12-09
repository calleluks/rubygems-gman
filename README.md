rubygems-gman
=============

Generate and install man pages for installed gems.

**Please note**: `rubygems-gman` is **experimental software**. It probably has
some [issues](https://github.com/thoughtbot/rubygems-gman/issues). If you find
one, please report it through the issue tracker. If you'd like to help develop
`rubygems-gman`, please see the instructions in
[`CONTRIBUTING.md`](https://github.com/thoughtbot/rubygems-gman/blob/master/CONTRIBUTING.md).
Pull requests are very welcome.

Installation
------------

Install the `rubygems-gman` gem using `gem`:

    $ gem install rubygems-gman

Usage
-----

After installing the `rubygems-gman` gem, man pages will automatically be
generated and installed when installing new gems using `gem install`. The below
commands can be used to generate or regenerate and install man pages after
installing a new version of `rubygems-gman`.

Generate and install man pages for all currently installed gems:

    $ gem gman

Generate and install man pages for a specific gem:

    $ gem gman GEM
