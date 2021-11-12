---
layout: default
title: Chapter 1
---

## Chapter 1

### Page 6
1. There are several Linux commands that show you the details of the components in your computer. For example, `lscpu` will show you the details of your CPU:
```
    $ lscpu
    Architecture:                    x86_64
    CPU op-mode(s):                  32-bit, 64-bit
    Byte Order:                      Little Endian
    Address sizes:                   36 bits physical, 48 bits virtual
    CPU(s):                          8
    On-line CPU(s) list:             0-7
    Thread(s) per core:              2
    Core(s) per socket:              4
    Socket(s):                       1
    NUMA node(s):                    1
    Vendor ID:                       GenuineIntel
    CPU family:                      6
    Model:                           26
    Model name:                      Intel(R) Core(TM) i7 CPU         920  @ 2.67GHz
    Stepping:                        5
    Frequency boost:                 enabled
    CPU MHz:                         2673.427
    CPU max MHz:                     2667.0000
    CPU min MHz:                     1600.0000
    BogoMIPS:                        5346.59
    Virtualization:                  VT-x
    L1d cache:                       128 KiB
    L1i cache:                       128 KiB
    L2 cache:                        1 MiB
    L3 cache:                        8 MiB
    NUMA node0 CPU(s):               0-7
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX disabled
    Vulnerability L1tf:              Mitigation; PTE Inversion; VMX conditional cache f
                                    lushes, SMT vulnerable
    Vulnerability Mds:               Vulnerable: Clear CPU buffers attempted, no microc
                                    ode; SMT vulnerable
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Mitigation; Speculative Store Bypass disabled via 
                                    prctl and seccomp
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user po
                                    inter sanitization
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, IBPB condition
                                    al, IBRS_FW, STIBP conditional, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Not affected
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p
                                    ge mca cmov pat pse36 clflush dts acpi mmx fxsr ss
                                    e sse2 ht tm pbe syscall nx rdtscp lm constant_tsc
                                    arch_perfmon pebs bts rep_good nopl xtopology non
                                    stop_tsc cpuid aperfmperf pni dtes64 monitor ds_cp
                                    l vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 p
                                    opcnt lahf_lm pti ssbd ibrs ibpb stibp tpr_shadow 
                                    vnmi flexpriority ept vpid dtherm ida flush_l1d
    $ 
```
Other useful commands are `free` to see memory usage and `lsusb` to see your USB devices.
Chapter 3 in Brian Ward's *How Linux Works. 2nd edition*, No Starch Press, 2015, is devoted to getting information about the devices installed in your computer.
