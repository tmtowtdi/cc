
.. highlight:: lua

.. _apis_inv:

Inv
===

Inventory management API.

- :ref:`inv_synopsis`
- :ref:`inv_names`
- :ref:`inv_methods`
    - :ref:`inv_method_find`
    - :ref:`inv_method_find_all`
    - :ref:`inv_method_consolidate`
    - :ref:`inv_method_all_slots_used`
    - :ref:`inv_method_simplify_name`
    - :ref:`inv_method_name_is_fq`

.. _inv_synopsis:

Synopsis
~~~~~~~~

::

    os.loadAPI("lib/inv")

    -- Find the first slot containing dirt blocks.  Both work:
    local slot = inv.find('dirt')
    local slot = inv.find('minecraft:dirt')

    -- Find all slots containing dirt blocks
    local slots = inv.find_all('dirt')
    for i = 1,#slots do
        print( "Slot number "..i.." contains dirt." )
    end

    -- Consolidate dirt blocks
    inv.consolidate("dirt")

    -- Find out if we have any empty slots left
    if inv.all_slots_used() then
        print( "We have no empty slots left" )
    end

    -- Simplify a FQ name
    print( inv.simplify_name('minecraft:dirt') )

    -- Find out if a name is FQ
    if inv.name_is_fq('minecraft:dirt') then
        print( "That's an FQ name." )
    end

.. _inv_names:

Fully-Qualified (FQ) vs Simple Names
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When you access an item programmatically, Minecraft usually returns a Fully 
Qualified name, eg ``minecraft:dirt``.  But when you're thinking about items, 
you think of it by its simple name, ``dirt``.  

Using the inv API, when you look for ``dirt``, you'll find ``minecraft:dirt``, 
which is usually what you want.

However, some blocks aren't part of Minecraft itself; they're additional 
blocks that get added by an addon, and some of these blocks get added by 
multiple addons (eg ``copper_ore``, which gets added by both the Forestry and 
Thermal Expansion addons).

If you're looking for ``copper_ore``, *most of the time* it doesn't matter 
which addon the block came from.  However, there are some crafting recipes 
that require that the block you're using comes from a specific addon.

So if you're trying to get an aftermarket block-type for crafting, your best 
bet is to search for it by its Fully Qualified name.

.. _inv_methods:

Methods
~~~~~~~

.. _inv_method_find:

``find(name)``
++++++++++++++

``name``
  str, required

Get the first slot in the internal inventory containing one or more items of  
``name``.

If ``name`` is FQ, only exact matches will hit, but if it's simple, all FQ 
names that match your simple name will match.  So ``copper_ore`` will return 
the first slot containing either ``forestry:copper_ore`` or 
``thermal:copper_ore``.

Returns int slot number, or false if ``name`` was not found.

----

.. _inv_method_find_all:

``find_all(name)``
++++++++++++++++++

``name``
  str, required

Get all slots in the internal inventory containing one or more items of  
``name``.  Follows the same naming rules as :ref:`inv_method_find`.

Returns an int-indexed table (array) of slot numbers.  This array will be 
empty if ``name`` was not found.

----

.. _inv_method_consolidate:

``consolidate(name)``
+++++++++++++++++++++

``name``
  str, required

Consolidates non-full stacks of the same item to go from this:

.. code-block:: text

        ---------------------------
        |  20 dirt   |  empty     |
        |  10 dirt   |  50 dirt   |
        ---------------------------

...to this:

.. code-block:: text

        ---------------------------
        |  64 dirt   |  empty     |
        |  16 dirt   |  empty     |
        ---------------------------

``name`` *can* be either FQ or simple.  However, if your inventory contains 
both ``forestry:copper_ore`` and ``thermal:copper_ore``, and you attempt to 
consolidate using the simple name ``copper_ore``, this method will attempt to 
combine those two different items, and will fail, returning an error.  So FQ 
names are strongly recommended.

Returns true/false on success/failure.

----

.. _inv_method_all_slots_used:

``all_slots_used()``
++++++++++++++++++++

Returns true if all slots in the turtle's internal inventory contain at least 
one item.  Does *not* check if those are full stack, just if every slot 
contains an item.

Returns true/false on success/failure.

----

.. _inv_method_simplify_name:

``simplify_name(name)``
+++++++++++++++++++++++

``name``
  str, required

Get the simple form of ``name``.  If ``name`` is already simple, it will be 
returned unmolested::

    -- Both print "dirt"
    print( inv.simplify_name("dirt") )
    print( inv.simplify_name("minecraft:dirt") )

----

.. _inv_method_name_is_fq:

``name_is_fq(name)``
++++++++++++++++++++

``name``
  str, required

Tells you if ``name`` is FQ or not.

Returns true if ``name`` is FQ, false if not.

