```
  ndc
   interface
       list   //   /sys/class/net
       getcfg  wlan0
       setcfg  
       clearaddrs
       ipv6privacyextensions  //  Usage: interface ipv6privacyextensions <interface> <enable|disable>
       ipv6         //  Usage: interface ipv6 <interface> <enable|disable>
       ipv6ndoffload   //  Usage: interface ipv6ndoffload <interface> <enable|disable>
      setmtu   //  Usage: interface setmtu <interface> <val>
      
  ipfwd
      status  
      enable  // ipfwd enable  <requester>
      disable  //  ipfwd disable <requester>
      add  //  ipfwd  add   wlan0 dummy0
      remove  //  ipfwd remove wlan0 dummy0
      
  tether
      stop
      status
      interface list/add/remove
      dns list/set
      start 
      
  nat
      enable
      disable
      
  pppd
      attach
      detach
      
  softap
      startap
      stopap
      fwreload
      status
      set
      
  resolver
      setnetdns
      clearnetdns
      flushnet
      
  bandwidth
      enable
      disable
      removequota\rq       // removequota <interface>
      getquota\gq
      getiquota\giq        // getiquota <iface>52      setquota\sq      //   setquota <interface> <bytes>
      setquotas\sqs    // setquotas <bytes> <interface> ...
      removequotas\rqs  // removequotas <interface> ...
      removeiquota\riq  removeiquota <interface>
      setiquota\siq  // setiquota <interface> <bytes>
      addnaughtyapps\ana // addnaughtyapps <appUid> ...
      removenaughtyapps\rna   //removenaughtyapps <appUid> ...
      happybox   // happybox (enable | disable)
      addniceapps\aha   //  addniceapps <appUid> ...
      removeniceapps\rha  // removeniceapps <appUid> ...
      setglobalalert\sga  // setglobalalert <bytes>
      debugsettetherglobalalert\dstga  // debugsettetherglobalalert <interface0> <interface1>
      removeglobalalert\rga
      debugremovetetherglobalalert\drtga // debugremovetetherglobalalert <interface0> <interface1>
      setsharedalert\ssa  // setsharedalert <bytes>
      removesharedalert\rsa  
      setinterfacealert\sia  // setinterfacealert <interface> <bytes>
      removeinterfacealert\ria  //  removeinterfacealert <interface>
      gettetherstats\gts  // gettetherstats [<intInterface> <extInterface>]
      
  idletimer
      enable
      disable
      add
      remove
      
  firewall
      enable  // Usage: firewall enable <whitelist|blacklist>
      disable
      is_enabled
      set_interface_rule  //  Usage: firewall set_interface_rule <rmnet0> <allow|deny>
      set_egress_source_rule  // Usage: firewall set_egress_source_rule <192.168.0.1> <allow|deny>
      set_egress_dest_rule  //  Usage: firewall set_egress_dest_rule <192.168.0.1> <80> <allow|deny>
      set_uid_rule  // Usage: firewall set_uid_rule <dozable|standby|none> <1000> <allow|deny>
      enable_chain  // Usage: firewall enable_chain <dozable|standby>
      disable_chain  // Usage: firewall disable_chain <dozable|standby>
      
  clatd
      stop
      status
      start
  
  strict
      enable
      disable
      set_uid_cleartext_policy
      
  network
     route
     interface add/remove
     create vpn
     destroy
     permission 
             // network permission   user   set  <permission>  <uid> ...
             // network permission   user  clear    <uid> ...
             // network permission network  set  <permission> <netId> ...
             // network permission network clear   <netId> ...
     users  
             // network users  add   <netId> [<uid>[-<uid>]] ...
             // network users remove <netId> [<uid>[-<uid>]] ...
             
     protect
             // network protect allow <uid> ...
             // network protect  deny <uid> ...
```
        
