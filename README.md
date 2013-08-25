About
=====

This cookbook installs the Brightcove Diamond metric collector, and configures various collectors.

LWRPs
===========
This cookbook implements collectors as LWRPs. You can supply parameters

```
  diamond_collector "NetworkCollector" do
    enabled true
    interval 10
    params "interfaces" => "eth,pbond,bond", "byte_unit" => "megabit"
  end
```

By default, enabled is set to false, so it will need to be explicitly set to true.

USAGE
=====
It is recommended that you create a recipe per collector, and add that recipe to the related role.
When passing sensitive data to a diamond collector config (ie a username, password, etc), use data bags 
to encrypt the values.
