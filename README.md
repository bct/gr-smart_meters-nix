This is a nix implementation of https://wiki.recessim.com/view/Gr-smart_meters_Setup_Guide

I know very little about gnuradio and nix, so there are probably things I've done wrong.

Some of it is unnecessary - in particular gr-fosphor has a lot of dependencies and is optional.

Instructions:

```
# build the environment and launch the shell within that environment
nix-shell default.nix -A shell

# launch gnu-radio-companion within the environment
gnuradio-companion

# and then open one of the examples from https://github.com/BitBangingBytes/gr-smart_meters
```
