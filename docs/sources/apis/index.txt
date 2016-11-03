
.. highlight:: lua

.. _apis_index:

APIs
====

All APIs can be imported into any script with::

    if not os.loadAPI("lib/APINAME") then return end
    
Most APIs are just a collection of functions that don't do anything until you 
call one, but a few APIs (notably, ``move``) perform some initialization as 
soon as you load them.  If that initialization fails for whatever reason, your 
script should fail as well.

.. toctree::
   :maxdepth: 1

   harvest
   inv
   move
   reds
   settings

