
.. highlight:: lua

.. _scripts_place_gps:

Place GPS System
================

- :ref:`scripts_place_gps_synopsis`
- :ref:`scripts_place_gps_range`
- :ref:`scripts_place_gps_inv`
- :ref:`scripts_place_gps_run`
- :ref:`scripts_place_gps_finish`
- :ref:`scripts_place_gps_restart`

.. _scripts_place_gps_synopsis:

Synopsis
--------

Sends a turtle directly up in the air to set up a GPS system that all 
rednet-equipped turtles in range can use to get their locations.

Setting up a GPS system is much more of a pain if you're not already in range 
of another GPS system.  Your very first GPS system will need to be set up this 
way.

But subsequent GPS systems will be much easier to set up, provided they're in 
range of the original system.  Setting up new systems in range of the old one 
allow you to increase your GPS system coverage.

.. _scripts_place_gps_range:

Rednet (Modem) Range
--------------------

By default, modems in ComputerCraft have a fairly limited range.  You can 
compensate for this by putting up lots of GPS systems, or by trying to set up 
some sort of repeater network.

But if you want longer modem range, and are in control of the server you're 
playing on, you can increase the range by editing ``ComputerCraft.cfg``.  
There are four settings in there related to modem range; search the file for 
``modem_``.

.. _scripts_place_gps_inv:

Required Inventory
------------------

You must equip your turtle with the needed parts first.  Setting up a system 
that's not in range of any other systems actually requires fewer parts than 
setting up one that is in range.

All GPS systems, whether they're in range of another system or not, require:

- Four computers (regular or advanced work equally well)
- Four modems

If you're extending your original GPS system (eg if you're already in range of 
another functioning GPS system), you'll also need:

- Four disk drives
- Four floppy disks

.. _scripts_place_gps_run:

Running
-------

Whether you're in range of another GPS system or not, equip your turtle with 
the required items, then place it on the ground directly under the spot where 
you want your GPS system to be placed, then start the build:

.. code-block:: text

  > bin/place_gps

By default, that will fly up 140 blocks (from its current location, not to Y 
== 140), and begin building your system, but you can specify a different 
number of blocks to move up.  So if you're just testing and don't want to wait 
for the turtle to go up 140 blocks...

.. code-block:: text

  > bin/place_gps 5

After the turtle places the GPS computers, it will return to its starting 
position.

.. _scripts_place_gps_finish:

Final Steps
-----------

After the turtle returns, what happens next depends on whether it was in-range 
of another GPS system in the first place.

If the turtle was in-range of an existing GPS system, then *you're finished*.  
Your new GPS system is set up and turned on.

If you're *not* in range of another GPS system, the turtle that built this 
current system had no way of detecting the coordinates of the satellites it 
was placing, so it couldn't create the correct startup files, so you're going 
to need to create them yourself.

Get up to the newly-created computers, and for each one:

- Figure out its X, Y, Z coordinates (use F3)
- Download the startup script template: ``> pastebin get DkS2Evw3 startup``
- Edit the startup script; enter the X, Y, Z coordinates into the script.
- Run the script: ``> startup``

Be really careful about getting the coordinates right.  If you give the GPS 
computers the wrong coordinates, any computer or turtle using that system is 
going to think it's in the wrong location.  Check and double-check.

.. _scripts_place_gps_restart:

Server Restarts
---------------

The ``startup`` scripts on each machine automatically run when the machine 
reboots.  However, computers appear not to turn on automatically when the 
server is stopped and then restarted.

If your established GPS system suddenly stops working, go up to the four 
computers that make up the system and right-click on each one.  This will 
start the computer and run its startup script.

