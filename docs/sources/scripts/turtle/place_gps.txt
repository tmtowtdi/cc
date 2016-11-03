
.. highlight:: lua

.. _scripts_place_gps:

Place GPS System
================

Sends a turtle directly up in the air to set up a GPS system that all 
rednet-equipped turtles in range can use to get their locations.

Setting up a GPS system is much more of a pain if you're not already in range 
of another GPS system.  Your very first GPS system will need to be set up this 
way.

But subsequent GPS systems will be much easier to set up, provided they're in 
range of the original system.  Setting up new systems in range of the old one 
allow you to increase your GPS system coverage.

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

Running
-------

Whether you're in range of another GPS system or not, equip your turtle with 
the required items, then place it on the ground directly under the spot where 
you want your GPS system to be placed, then start the build:

.. code-block:: text

  > bin/place_gps

By default, that will fly up 140 blocks and begin building your system, but 
you can specify a different number of blocks to move up:

.. code-block:: text

  > bin/place_gps 120

After the turtle places the GPS computers, it will return to its starting 
position.

Final Steps
-----------

After the turtle returns, your GPS system will be almost, but not quite, 
ready; it still needs human interaction to turn on.

Each GPS computer needs to have a startup script containing its own X, Y, and 
Z coordinates hardcoded in the script.

In Range
~~~~~~~~

If you're in range of another GPS system, the human interaction is pretty 
easy.  Each computer is next to a disk drive that's loaded with the correct 
startup script, containing the correct coordinates.  You just have to get up 
to each computer, copy that startup script off the disk, and run it.

**I'm still in the process of testing this, but so far it looks like this 
human interaction is not needed.  I think you need to fly up to turn the 
computers on, but they're reading disk/startup as their startup scripts so no 
copying needs to happen.  I think.**

.. code-block:: text

   > copy disk/startup .
   > startup

Out Of Range
~~~~~~~~~~~~

If you're *not* in range of another GPS system, the turtle that built this 
current system had no way of detecting the coordinates of the satellites it 
was placing, so it couldn't create the correct startup files, so you're going 
to need to create them yourself.

Get up to the newly-created computers, and for each one:

- Figure out its X, Y, Z coordinates (use F3)
- Download the startup script template: ``> pastebin get DkS2Evw3 startup``
- Edit the startup script; enter the X, Y, Z coordinates into the script.
- Run the script: ``> startup``

Server Restarts
---------------

The ``startup`` scripts on each machine automatically run when the machine 
reboots.  However, computers appear not to turn on automatically when the 
server is stopped and then restarted.

If your established GPS system suddenly stops working, go up to the four 
computers that make up the system and right-click on each one.  This will 
start the computer and run its startup script.

