.. highlight:: lua

.. _dig_cube:

Dig Cube
=========

Excavates a rectangle, automatically emptying its inventory when it gets full.  
You can specify the length, width, and depth of the rectangle, along with how 
high the turtle needs to fly up to safely travel between the pit he's digging 
and the box into which he's dumping his inventory.

When the pit is finished, the turtle will return to its box one last time to 
dump its inventory, then return to its home spot.

The turtle starts in the SW corner, so the cube it digs will be forward and 
right of its starting point.  If he begins at "B", facing North, he will dig 
out the blocks marked "D"::

    D D D D    N
    D D D D    ^
    D D D D    |
    B D D D    |

Before running this, you must set a home spot named "home", and a dumper box 
named "box".  Set these by running :ref:`set_home` and :ref:`find_box` .

The script can run with no arguments, accepting its defaults, or with up to 
four arguments::

    > bin/dig_cube
    > bin/dig_cube 5 10 50 100

The first version, with no arguments, will dig a cube 8 columns wide, 8 rows 
long, and 100 blocks deep (all relative to the turtle's starting point).  When 
the turtle is finished or its inventory fills up, it will fly up to an 
altitude of 70 before flying back to his box.

The second version, with arguments, will dig a cube 5 columns wide, 10 rows 
long, 50 blocks deep.  When the turtle is finished or its inventory fills up, 
it will fly up to an altitude of 100 before flying back to his box.

`Note` that the altitude argument is `absolute`.  It's not 70 or 100 blocks up 
from the turtle's location, it's Y == 70 (or Y == 100 for the second example).  
The point of the altitude setting is for you to check the area around the 
turtle and find any obstacles (trees, hills, houses, etc), and be sure the 
turtle will fly up high enough to get over all of them.

