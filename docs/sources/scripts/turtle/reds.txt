
.. highlight:: lua

.. _scripts_reds:

Reds (Script)
=============

The :ref:`apis_reds` contains functions for dealing with turtles as redstone 
tools.

Often when using :ref:`apis_reds`, all your script needs to do is call a 
single function.  Writing a script just to make one function call is a little 
silly, so this script allows you to call :ref:`apis_reds` functions as if they 
were commands.

For example, the :ref:`apis_reds_method_timer` function repeatedly toggles a 
redstone signal on and off.  To use a turtle as a simple clock, you can call 
that function as command:

.. code-block:: text

    > bin/reds timer front 5 1

...that will call that :ref:`apis_reds_method_timer` function, passing 
``front``, ``5``, and ``1`` as the arguments.  So your turtle will produce a 
redstone signal out its front for 5 seconds, then turn the signal off for 1 
second, then repeat.

