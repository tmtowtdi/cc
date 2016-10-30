
.. highlight:: lua

.. _apis_settings:

Settings
========

ComputerCraft 1.77 includes a settings API, but that version of CC is for MC 
1.89.  If you're running a lower-version MC server, this mirrors that CCv1.77 
Settings API.

- :ref:`settings_synopsis`
- :ref:`settings_internal_methods`
    - :ref:`settings_method_ensure_file`
    - :ref:`settings_method_load`
    - :ref:`settings_method_save`
- :ref:`settings_user_methods`
    - :ref:`settings_method_get`
    - :ref:`settings_method_set`
    - :ref:`settings_method_unset`
    - :ref:`settings_method_getNames`

.. _settings_synopsis:

Synopsis
~~~~~~~~

::

    os.loadAPI("lib/settings")

    -- Set some key/value pairs
    settings.set("name", "Notch")
    settings.set("job", "Owner of Mojang")

    -- Time passes...
    -- Well, we probably don't need that 'job' key set any more, so unset it.
    settings.unset("job")

    -- Later, in any other script, you can retrieve that:
    local n = settings.get("name")
    print(n)                        -- Notch

    -- Get a list of all set keys
    local all = settings.getNames()
    for i = 1,#all do
        print( all[i] )
    end

.. _settings_internal_methods:

Internal Methods
~~~~~~~~~~~~~~~~

These methods exist but are used internally and generally don't ever need to 
be called by the user.

----

.. _settings_method_ensure_file:

``ensure_file(path)``
++++++++++++++++++++++++++++++++++++++++++++++

``path``
  str, defaults to 'etc/settings'

Checks if the state file exists.  If the file does not exist, create it.  
Returns true on success, false if the file could not be created.

----

.. _settings_method_load:

``load(path)``
++++++++++++++++++++++++++++++++++++++++++++++

``path``
  str, defaults to 'etc/settings'

Loads data from the state file and deserializes it to an internal table.

----

.. _settings_method_save:

``save(path)``
++++++++++++++++++++++++++++++++++++++++++++++

``path``
  str, defaults to 'etc/settings'

Serializes the internal settings table and writes it to the state file.

----

.. _settings_user_methods:

User Methods
~~~~~~~~~~~~

These are the methods you'll use in your scripts.

.. _settings_method_get:

``get(key)``
++++++++++++

``key``
  Any true value, required

Returns the value associated with the key.  Produces error message and returns 
false if the key is not set.

----

.. _settings_method_set:

``set(key, value)``
+++++++++++++++++++

``key``
  Any true value, required
``value``
  Any true value, required

Sets the value of key and saves the internal table's state to disk.
``value`` must be true; see :ref:`settings_method_unset` to remove a key.

Returns true on success, false if ``value`` was not a true value.

----

.. _settings_method_unset:

``unset(key)``
++++++++++++++

``key``
  Any true value, required

Removes the key from the internal table and saves the table's state to disk.
Produces error and returns false if ``key`` is not a true value.

----

.. _settings_method_getNames:

``getNames()``
++++++++++++++

Returns an int-indexed table (an array) of all keys (*names*) currently set in 
the internal table.

