# dportmatch
Zeek package to add a destination port to the meta fields in Zeek. It creates a notice when both the intel and the destination port matches. This can be used to reduce false positives.

## How to use it
This script functions using the meta key `meta.dport`. You can add that to any input file of the threat intelligence data. This has to follow the data type [port](https://docs.zeek.org/en/master/script-reference/types.html#port). For example: `80/tcp`. 

## What it does
After an intel match from the Intelligence Framework it checks if the meta.dport field exists in the sources metadata. If this is the case it checks if the destination port matches, if so then it generates a notice `dportmatch::DPORT_INTEL_MATCH`. 

## Limitations 
Keep in mind that port numbers are easily changeable by adversaries. You should be keeping a look at the intel logs. However, this  gives you the ability to easily increase the reliability of an IOC hit.

## Examples of threat intelligence sources that provide dport mappings
- [TOR Node list](https://www.dan.me.uk/tornodes)
- [Feodotracker](https://feodotracker.abuse.ch/browse/)
- [Threatfox](https://threatfox.abuse.ch/browse/) 
  - This however does not always provide dport mappings, so be sure to check before using.