---
layout: default
title: Chapter 8
---

## Chapter 8

1.  My RPi 5 gives:
    ```
    bob@rpi5:~ $ lscpu
    Architecture:             aarch64
      CPU op-mode(s):         32-bit, 64-bit
      Byte Order:             Little Endian
    CPU(s):                   4
      On-line CPU(s) list:    0-3
    Vendor ID:                ARM
      Model name:             Cortex-A76
        Model:                1
        Thread(s) per core:   1
        Core(s) per cluster:  4
        Socket(s):            -
        Cluster(s):           1
        Stepping:             r4p1
        CPU(s) scaling MHz:   62%
        CPU max MHz:          2400.0000
        CPU min MHz:          1500.0000
        BogoMIPS:             108.00
        Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop
                              asimddp
    Caches (sum of all):      
      L1d:                    256 KiB (4 instances)
      L1i:                    256 KiB (4 instances)
      L2:                     2 MiB (4 instances)
      L3:                     2 MiB (1 instance)
    Vulnerabilities:          
      Gather data sampling:   Not affected
      Itlb multihit:          Not affected
      L1tf:                   Not affected
      Mds:                    Not affected
      Meltdown:               Not affected
      Mmio stale data:        Not affected
      Reg file data sampling: Not affected
      Retbleed:               Not affected
      Spec rstack overflow:   Not affected
      Spec store bypass:      Mitigation; Speculative Store Bypass disabled via prctl
      Spectre v1:             Mitigation; __user pointer sanitization
      Spectre v2:             Mitigation; CSV2, BHB
      Srbds:                  Not affected
      Tsx async abort:        Not affected
    ```
2.  My RPi 5 gives:
    ```
    bob@rpi5:~ $ getconf -a| grep CACHE
    LEVEL1_ICACHE_SIZE                 0
    LEVEL1_ICACHE_ASSOC                0
    LEVEL1_ICACHE_LINESIZE             64
    LEVEL1_DCACHE_SIZE                 0
    LEVEL1_DCACHE_ASSOC                0
    LEVEL1_DCACHE_LINESIZE             64
    LEVEL2_CACHE_SIZE                  0
    LEVEL2_CACHE_ASSOC                 0
    LEVEL2_CACHE_LINESIZE              0
    LEVEL3_CACHE_SIZE                  0
    LEVEL3_CACHE_ASSOC                 0
    LEVEL3_CACHE_LINESIZE              0
    LEVEL4_CACHE_SIZE                  0
    LEVEL4_CACHE_ASSOC                 0
    LEVEL4_CACHE_LINESIZE              0
    ```
3.  We start with a truth table that shows the relationships between the signals and the input to the D flip-flop.
        
    |Store|d<sub>i</sub>|r<sub>i</sub>|D<sub>i</sub>|
    |-----|-------------|-------------|-------------|
    | `0` |     `0`     |     `0`     |     `0`     |
    | `0` |     `0`     |     `1`     |     `1`     |
    | `0` |     `1`     |     `0`     |     `0`     |
    | `0` |     `1`     |     `1`     |     `1`     |
    | `1` |     `0`     |     `0`     |     `0`     |
    | `1` |     `0`     |     `1`     |     `0`     |
    | `1` |     `1`     |     `0`     |     `1`     |
    | `1` |     `1`     |     `1`     |     `1`     |

    Using a Karnaugh map:      
    ![](./assets/images/ch_08/1-bit_to_D.svg)

    we get:

    D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = (&not;Store &and; r<sub>i</sub>) &or; (Store &and; d<sub>i</sub>)

    Applying De Morgan's law:

    &not;D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = &not;(&not;Store &and; r<sub>i</sub>) &and; &not;(Store &and; d<sub>i</sub>)

    And complementing both sides gives us:

    D<sub>i</sub>(Store, d<sub>i</sub>, r<sub>i</sub>) = &not;(&not;(&not;Store &and; r<sub>i</sub>) &and; &not;(Store &and; d<sub>i</sub>))

    So we can use NAND gates. Notice the placement of the parentheses when manipulating the expressions in the equations here. De Morgan's law applies to the individual terms in the expression. In the final complementing of both sides of the equation, we're complementing the entire expression on the righthand side of the equation.
