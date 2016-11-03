
Installing
==========

- :ref:`installing_labels`
- :ref:`installing_gps`
- :ref:`installing_other`
    - :ref:`installing_updating_other`

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

On a GPS Satellite
~~~~~~~~~~~~~~~~~~

A GPS satellite machine is usually just a regular computer, but you can use any 
computer or turtle, as long as it has a modem attached.

Get four such machines.  Label each one, then download the startup script.

.. code-block:: text

    > label set gps1
    > pastebin get DkS2Evw3 startup

Place the machines per the diagram image in the `first post in this thread, by 
BigSHinyToys.  
<http://www.computercraft.info/forums2/index.php?/topic/3088-how-to-guide-gps-global-position-system/>`_ 

Now, and yes, this is a pain in the ass, approach each individual machine, 
figure out its exact X, Y, Z coordinates, and edit its startup script to include 
those coordinates.  Then start the machine

.. code-block:: text

  > startup

.. _installing_other:

On Any Other Machine
~~~~~~~~~~~~~~~~~~~~

On any brand-new machine, type

.. code-block:: text

    > label set <LABELNAME>
    > pastebin get JQsniAQj install
    > install

...replace **<LABELNAME>** with any name you want to give the machine.

After the install script completes, you can delete it

.. code-block:: text

    > rm install

.. _installing_updating_other:

Updating
--------

The installer script installed an updater script.  You can run it any time to 
update to the latest version of the code

.. code-block:: text

  > bin/get_all

If a new script or API gets added and you want that, you'll need to run that 
updater script twice in a row

.. code-block:: text

  > bin/get_all
  ...output scrolls past...
  > bin/get_all

...The first run gets the newer ``get_all`` script, which will know how to 
download the new script/API you're interested in.  The second run will run this 
new version of ``get_all``, pulling the new script/API.


