
.. _scripts_go_box:

Go Box
=======

Sends the turtle to one block above the named box.  You assign names to boxes 
using :ref:`scripts_find_box`.

It's important to understand the flight path.  The turtle will first fly up in 
the air, then fly until it's exactly above the box, then fly straight down.  
So be sure the area directly above the turtle, as well as the area directly 
above the box, is clear.

By default, the turtle will rise up to Y == 100, then return to the box named 
``box``.

Y == 100 will often be high enough that the trip will take unnecessary extra 
time.  On the other hand, if you're in the mountains, Y == 100 may not be high 
enough.  Likewise, you can have many named boxes.

So you can override the defaults.  In this case, the turtle will rise up to Y 
== 150 and return to ``orebox1``:

.. code-block:: text

    > bin/go_box 150 orebox1

