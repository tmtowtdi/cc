
.. highlight:: lua

.. _scripts_xfer:

Xfer
====

Transfer items between chests.

- :ref:`scripts_xfer_synopsis`
- :ref:`scripts_xfer_setup`
- :ref:`scripts_xfer_run`

.. _scripts_xfer_synopsis:

Synopsis
--------

You've got a chest that's being filled up by $something.  Maybe a turtle is 
digging a pit and periodically dropping off its inventory, maybe your kid 
brother insists on sticking everything he collects into one chest.  Whatever 
-- you want to move the contents of one chest into another one.

.. _scripts_xfer_setup:

Setup
-----

Your turtle needs to know where its two chests are.  The one it's removing 
items from is the ``src`` box, and the one it's dropping items into is the 
``target`` box.  By default, the script knows them by those names, but you can 
use different names if you like.

Find your ``src`` box, place the turtle next to it, and run 
:ref:`scripts_find_box`.  Be sure to give the box a reasonable name (simply 
``src`` is recommended).

Next, do the same with your ``target`` box.

Make sure that both of your boxes have a clear approach path straight up.  A 
box that's covered with hoppers won't work; the box needs to be open to the 
sky.

Last, set a home for your turtle with :ref:`scripts_set_home`.  At this point, 
this home *must* be named ``home``.  Even though the ``set_home`` script 
allows you to set up multiple named spots, this script is expecting only to 
send the turtle to one named ``home``.

.. _scripts_xfer_run:

Running
-------

This is pretty simple.  Start the transfer:

.. code-block:: text
    
    -- Accept all the defaults
    > bin/xfer

    -- Or pass your own settings
    > bin/xfer 600 100 out in

In the first version, the turtle will fly to a height of 70, then to the box 
named ``src``, collect everything it can, fly to the box named ``target``, 
empty all it can, then fly back to its home and wait for ``300`` seconds (five 
minutes).

In the second version, the turtle will fly to a height of 100, then to the box 
named ``out``, collect everything it can, fly to the box named ``in``, empty 
all it can, then fly back to its home and wait for ``600`` seconds (ten 
minutes).


