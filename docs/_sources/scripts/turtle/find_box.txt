
.. highlight:: lua

.. _scripts_find_box:

Find Box
========

Locates a chest adjacent to the turtle, and assigns that as his "home" box.

First, find the chest that you want to assign to the turtle.  It should be 
clear to the air above, since the turtle is going to be coming in from 
altitude.


Place your turtle in his spot (careful - there should be only one chest 
directly next to the turtle), and assign it::

    > bin/find_box

The turtle will spin until he finds the box.  He'll then remember that box's 
location, and any other script can send him back to that box again by using 
the move module's return_to_box() method.

By default, ``find_box`` names the box, simply, "box".  But you can create  
other named boxes by passing a name::

    > bin/find_box quarry
    > bin/find_box mob_farm
    ...etc...

