
.. _scripts_go_home:

Go Home
=======

Sends the turtle to named location.  You assign names to locations using 
:ref:`scripts_set_home`.

It's important to understand the flight path.  The turtle will first fly up in 
the air, then fly until it's exactly above the location, then fly straight 
down.  So be sure the area directly above the turtle, as well as the area 
directly above the box, is clear.

By default, the turtle will rise up to Y == 100, then return to the location 
named ``home``.

Y == 100 will often be high enough that the trip will take unnecessary extra 
time.  On the other hand, if you're in the mountains, Y == 100 may not be high 
enough.  Likewise, you can have many named locations.

So you can override the defaults.  In this case, the turtle will rise up to Y 
== 150 and return to ``farmhome``:

.. code-block:: text

    > bin/go_home 150 farmhome

