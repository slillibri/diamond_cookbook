About
=====

This cookbook installs the Brightcove Diamond metric collector, and configures various collectors.

Diamond is a python daemon that collects system metrics and publishes them to [Graphite](https://github.com/BrightcoveOS/Diamond/wiki/handler-GraphiteHandler) (and [others](https://github.com/BrightcoveOS/Diamond/wiki/Handlers)). It is capable of collecting cpu, memory, network, i/o, load and disk metrics.  Additionally, it features an API for implementing custom collectors for gathering metrics from almost any source.

This cookbook was forked from [CBarraford/diamond_cookbook](https://github.com/CBarraford/diamond_cookbook)

Attributes
=======


LWRPs
=====
This cookbook implements collectors as LWRPs. You can supply parameters

```
  diamond_collector "NetworkCollector" do
    enabled true
    interval 10
    params "interfaces" => "eth,pbond,bond", "byte_unit" => "megabit"
  end
```

By default, enabled is set to false, so it will need to be explicitly set to true.
Paramters outside of ```[name, enabled, interval, snmp, splay]``` can be set using ```params```

Defaults
-------
```
  enabled false
  snmp     false
  interval  300
  splay      0
```

USAGE
=====
It is recommended that you create a recipe per collector, and add that recipe to the related role.
When passing sensitive data to a diamond collector config (ie a username, password, etc), use data bags 
to encrypt the values.
