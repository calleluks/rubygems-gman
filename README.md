rubygems-gman
=============

Generate and install man pages for installed gems.

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
