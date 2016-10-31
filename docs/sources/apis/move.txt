
.. highlight:: lua

.. _apis_move:

Move
====

This API includes turtle-movement-related methods.  It requires an active GPS 
system, and uses that system to determine its own direction on load.

However, since the GPS system is slow, after initially getting the turtle's 
location, it keeps track of its location by modifying its internal GPS 
coordinates each time a movement method is used.

This means that you must use *only* movement methods from the ``move`` api, or 
it will end up thinking it's in one place but really be somewhere else.

When the API is first loaded, it will attempt to determine what direction  
turtle is currently facing.  The only way for that to happen is for the turtle 
to move.  If the turtle is surrounded on all sides, this will fail.

- :ref:`move_synopsis`
- :ref:`move_methods`
    - :ref:`move_method_fd`
    - :ref:`move_method_bk`
    - :ref:`move_method_up`
    - :ref:`move_method_dn`
    - :ref:`move_method_strafe_r`
    - :ref:`move_method_strafe_l`
    - :ref:`move_method_goto`
    - :ref:`move_method_l`
    - :ref:`move_method_r`
    - :ref:`move_method_a`
    - :ref:`move_method_face_n`
    - :ref:`move_method_face_s`
    - :ref:`move_method_face_e`
    - :ref:`move_method_face_w`
    - :ref:`move_method_face`
    - :ref:`move_method_go_home`
    - :ref:`move_method_has_home`
    - :ref:`move_method_return_to_box`
    - :ref:`move_method_has_box`
    - :ref:`move_method_dump_inv`
    - :ref:`move_method_d`
    - :ref:`move_method_get_x`

.. _move_synopsis:

Synopsis
~~~~~~~~

::

    os.loadAPI("lib/move")
    print( "I'm currently facing" .. move.d() )

    -- Move forward 4 spaces, turn right, move back 2 spaces
    move.fd(4)
    move.r()
    move.bk(2)

    -- Go to a specific coordinate.  Fly up to Y == 100 first
    move.goto(12, 234, -321, 100)

    -- Return to your default home
    move.go_home()

    -- Return to 1 block above your default box, then empty your inventory
    move.return_to_box()
    move.dump_inv()

.. _move_methods:

Methods
~~~~~~~~

.. _move_method_fd:

``fd(spaces, force)``
++++++++++++++++++++++

.. _move_method_bk:

``bk(spaces, force)``
++++++++++++++++++++++

.. _move_method_up:

``up(spaces, force)``
++++++++++++++++++++++

.. _move_method_dn:

``dn(spaces, force)``
++++++++++++++++++++++

``spaces``
  int, defaults to 1
``force``
  bool, defaults to false

Move the turtle ``spaces`` spaces in the specified direction.  If ``force`` is 
true and the turtle is blocked, it will attempt to both dig and attack in the 
requested direction.

----

.. _move_method_strafe_r:

``strafe_r:(spaces, force)``
++++++++++++++++++++++++++++

.. _move_method_strafe_l:

``strafe_l(spaces, force)``
+++++++++++++++++++++++++++

``spaces``
  int, defaults to 1
``force``
  bool, defaults to false

Both "strafe" the turtle one or more spaces in the indicated direction, 
meaning it will move right or left but end up facing the same direction.

The turtle can't actually strafe, so this does turn him; it just ensures he 
ends up facing in his original direction.  This is just syntactic sugar for::

  -- strafe_r()
  move.r() move.fd(spaces, force) move.l()

  -- strafe_l()
  move.l() move.fd(spaces, force) move.r()

----

.. _move_method_goto:

``goto(X, Y, Z, height, force)``
++++++++++++++++++++++++++++++++

``X``
  int, required
``Y``
  int, required
``Z``
  int, required
``height``
  int, defaults to nil
``force``
  bool, defaults to false

Move the turtle directly to the requested coordinates.

If ``height`` is specified, the turtle will first ascend to that Y value 
before flying to its destination, flying back down only when it's directly 
over the destination.

If ``force`` is true, the turtle will attempt to dig/attack its way through 
any obstacles.

----

.. _move_method_l:

``l()``
+++++++

.. _move_method_r:

``r()``
+++++++

.. _move_method_a:

``a()``
+++++++

Turns the turtle left, right or around (180°).

----

.. _move_method_face_n:

``face_n()``
++++++++++++

.. _move_method_face_s:

``face_s()``
++++++++++++

.. _move_method_face_e:

``face_e()``
++++++++++++

.. _move_method_face_w:

``face_w()``
++++++++++++

Turns the turtle to face the requested direction.

----

.. _move_method_face:

``face(dir)``
+++++++++++++

``dir``
  str, One of 'n', 's', 'e', 'w'.  Required

Turns the turtle to face the requested direction.

----

.. _move_method_go_home:

``go_home(height, name)``
+++++++++++++++++++++++++

``height``
  int, defaults to 100
``name``
  str, defaults to "home"

Returns the turtle to its marked home location.  It first ascends to 
``height``.  The default home location is named "home", but if you have a 
custom home location with another name, you may pass that name.

----

.. _move_method_has_home:

``has_home(name)``
++++++++++++++++++

``name``
  str, defaults to "home"

Check if the turtle has a home location named ``name``.  Returns true if so, 
false if not.

----

.. _move_method_return_to_box:

``return_to_box(height, name)``
+++++++++++++++++++++++++++++++

``height``
  int, defaults to 100
``name``
  str, defaults to "box"

Returns the turtle to one slot above the requested box.

----

.. _move_method_has_box:

``has_box(name)``
+++++++++++++++++

``name``
  str, defaults to "box"

Check if the turtle has a box assigned named ``name``.  Returns true if so, 
false if not.

----

.. _move_method_dump_inv:

``dump_inv(dir)``
+++++++++++++++++++

``dir``
  str, one of 'fd', 'up', or 'dn'.  Defaults to 'dn'

Drops all of the turtle's internal inventory in the direction requested.  If 
there's a chest in the requested direction, items will go into that chest.

Returns true on success, false on failure (eg the target inventory is full).

----

.. _move_method_d:

``d()``
+++++++

Get the direction we're currently facing.  Returns one of 'n', 's', 'e', or 
'w' on success, false on failure (eg the GPS system is down or out of range).

----

.. _move_method_get_x:

``get_x()``
++++++++++++++++++++++++++++++++++++++++++++

.. _move_method_get_y:

``get_y()``
++++++++++++++++++++++++++++++++++++++++++++

.. _move_method_get_z:

``get_z()``
++++++++++++++++++++++++++++++++++++++++++++

Get the move module's notion of the turtle's current X, Y, and Z coordinates.

