
Installing and Updating
=======================

- :ref:`installing_labels`
- :ref:`installing_gps`
- :ref:`installing_other`
- :ref:`installing_updating`

.. _installing_labels:

Labels Are Not Optional!
~~~~~~~~~~~~~~~~~~~~~~~~

Labels are *not* just cutesy but otherwise-pointless machine names.  If you 
don't label your machine, then any time you pick it up (break it with a pick), 
it will reset to its default code, exactly as it existed when you first created 
it.

That means that all scripts and APIs you'd downloaded to it, along with any 
custom files you'd created, will be gone.

The only way to save a machine's state is to label it.  Once you've done that, 
you can pick it up and put it down at will.

*Label your shit.*

.. _installing_gps:

Installing On a GPS Satellite
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you like, you can install the full utilities package on a computer meant to 
be used as a GPS satellite.  There's generally no reason to do so, but if you 
want to, see :ref:`installing_other` .

Your best bet when setting up a GPS system is just to use the 
:ref:`scripts_place_gps` script.

.. _installing_other:

Installing On Any Other Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On any brand-new machine, type

.. code-block:: text

    > label set <LABELNAME>
    > pastebin run JQsniAQj

...replace **<LABELNAME>** with any name you want to give the machine.

.. _installing_updating:

Updating
--------

One of the scripts installed by the installer script was an updater script.  
You can run it any time to update to the latest version of the code:

.. code-block:: text

  > bin/get_all

See the complete :ref:`scripts_get_all` docs.

