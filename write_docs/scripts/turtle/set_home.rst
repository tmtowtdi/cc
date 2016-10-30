
.. highlight:: lua

.. _scripts_set_home:

Set Home
========

Globally sets this turtle's "home" point, which other scripts can use to 
return him to later on.

First, find the spot that you want to be this turtle's home.  It should be 
clear to the air above, since the turtle is going to be coming in from 
altitude.

Place your turtle in his spot and assign it as his home::

    > bin/set_home

Now, any other script can send him home again by using the move module's 
go_home() method.

By default, ``set_home`` sets a home named, simply, "home".  But you can set 
other named home spots by passing a name::

    > bin/set_home house
    > bin/set_home farm
    ...etc...

