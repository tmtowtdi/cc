
.. highlight:: lua

.. _apis_reds:

Reds (API)
==========

The ``reds`` API is structured so that it can be used like any other API, in a 
script, but its methods can also be used from the terminal as documented by 
using :ref:`scripts_reds`.

For example, to toggle a redstone signal on the right side every 3 seconds::

    > bin/reds timer right 3

To accomplish this, each method accepts a single table of arguments, instead 
of a series of scalar arguments as most other API methods do.

- :ref:`apis_reds_synopsis`
- :ref:`apis_reds_troubleshooting`
- :ref:`apis_reds_protocol`
- :ref:`apis_reds_sides`
- :ref:`apis_reds_methods`
    - :ref:`apis_reds_method_timer`
    - :ref:`apis_reds_method_repeat_send`
    - :ref:`apis_reds_method_repeat_rcv`

.. _apis_reds_synopsis:

Synopsis
~~~~~~~~

::

    os.loadAPI("lib/reds")

    -- Toggle a redstone signal on the right side every 3 seconds
    reds.timer({ 'right', 3 })

    -- Send message about incoming redstone signal
    reds.repeat_send({ "foo", "back", "right", .5 })

    -- Receive message about incoming redstone signal
    reds.repeat_rcv({ "foo", "right", "front" })

.. _apis_reds_troubleshooting:

Troubleshooting
~~~~~~~~~~~~~~~

"This @#$% API keeps throwing errors when I try to use it in my code!".  
You're probably doing something like this::

    start_timer = true
    if start_timer == true then
        reds.timer( 'right', 3 )
    end

Nope nope nope.  You have to pass those arguments in as a table::

    start_timer = true
    if start_timer == true then
        reds.timer({ 'right', 3 })  -- Curlies!
    end

.. _apis_reds_protocol:

Protocol
~~~~~~~~

Message senders like :ref:`apis_reds_method_repeat_send` broadcast their 
messages, meaning that any machine listening over rednet can receive them.  To 
make sure that a given sender's messages are only acted on by intended 
receivers, messages are sent using a ``protocol``.

This ``protocol`` is simply a string.  All receivers set up to listen over a 
sender's ``protocol`` will receive that sender's messages.  So multiple 
receivers can react to a single sender's messages by all listening on the same 
``protocol``.

But at the same time, you can have multiple sender/receiver pairs in range of 
each other without getting their messages crossed.

.. code-block:: text

   +----------------+             +----------------+
   |     Sender     |             |     Sender     |
   | Protocol "foo" |             | Protocol "bar" |
   +----------------+             +----------------+
           |                               |
           |                       +-------+
           |                       |
           +--------------------------------------------+
           |                       |                    |
           |                       |                    |
   +----------------+     +----------------+     +----------------+
   |    Receiver    |     |    Receiver    |     |    Receiver    |
   | Protocol "foo" |     | Protocol "bar" |     | Protocol "foo" |
   +----------------+     +----------------+     +----------------+



.. _apis_reds_sides:

Sides
~~~~~

Some methods accept (or require) a ``side`` argument.  In all cases, that 
argument's value is a string that must be one of

- ``front``
- ``back``
- ``right``
- ``left``
- ``top``
- ``bottom``

That list of acceptable ``side`` values can be retrieved as a table by calling 
``redstone.getSides()``.

.. _apis_reds_methods:

Methods
~~~~~~~

.. _apis_reds_method_timer:

``timer(args)``
++++++++++++++++++++++++++++++++++++++++++++++

``args`` is a table with the keys:
  ``side``
    See :ref:`apis_reds_sides`.  Side to produce redstone signal, defaults to 'front'.
  ``on_for``
    number, seconds to produce redstone signal, defaults to 1.
  ``off_for``
    number, seconds to produce no redstone signal, defaults to 1.

Produces a full-strength (15) redstone signal on ``side`` for ``on_for`` 
seconds, then switches that signal off (0) for ``off_for`` seconds.

----

.. _apis_reds_method_repeat_send:

``repeat_send(args)``
++++++++++++++++++++++++++++++++++++++++++++++

``args`` is a table with the keys:
  ``protocol``
    See :ref:`apis_reds_protocol`.
    Required.
  ``in_side``
    See :ref:`apis_reds_sides`.  Side to watch for incoming redstone signal.
    Defaults to 'front'.
  ``out_side``
    See :ref:`apis_reds_sides`.  Side with modem over which we broadcast.
    Defaults to 'front'.
  ``loop_time``
    number, seconds to sleep before re-checking signals strength on 
    ``in_side``.  Fractional seconds are accepted.
    Defaults to 1.

Every ``loop_time`` seconds, check ``in_side`` for a redstone signal.  If that 
incoming signal changes in strength from that detected on the previous loop, 
send a message out the modem on ``out_side``.

The sent message goes out using ``protocol``, so *only* receivers listening 
for that ``protocol`` will notice the message.  The sent message is the 
integer strength of the detected redstone signal.

This method behaves as a service, and blocks infinitely.

From the terminal, look for signal from the back, re-check for signal delta 
every .5 seconds.  When signal delta is detected, send message using protocol 
foo over the modem on the right::

    > bin/reds repeat_send foo back right .5

----

.. _apis_reds_method_repeat_rcv:

``repeat_rcv(args)``
++++++++++++++++++++++++++++++++++++++++++++++

``args`` is a table with the keys:
  ``protocol``
    See :ref:`apis_reds_protocol`.
    Required.
  ``in_side``
    See :ref:`apis_reds_sides`.  Side to watch for incoming redstone signal.
    Required.
  ``out_side``
    See :ref:`apis_reds_sides`.  Side with modem over which we broadcast.
    Required.

Listens for ``rednet_message`` events over the modem on ``in_side``, using 
``protocol``.  When such a message is received, outputs a redstone signal of 
the strength indicated by the message on ``out_side``.

This method behaves as a service, and blocks infinitely.

From the terminal, listen to the modem on the right for messages over protocol 
foo, produce matching redstone signal out the front::

    > bin/reds repeat_rcv foo right front

