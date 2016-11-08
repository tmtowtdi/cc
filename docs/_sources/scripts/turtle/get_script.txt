
.. highlight:: lua

.. _scripts_get_script:

Get Script
==========

Downloads/updates a single script or API.  You generally won't need to bother 
with running this;  :ref:`scripts_get_all` runs this for you for all scripts 
and APIs, and doesn't require any arguments.

.. code-block:: text

    > bin/get_script <PATH> <HASH>

You must pass the path (eg ``bin/scriptname``) and the eight-character 
pastebin.com hash associated with the script.

