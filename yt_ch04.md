---
layout: default
title: Chapter 4
---

## Chapter 4

1.  Associativity of AND and OR is shown in Tables 4-3 and 4-4 in the book.

    - AND and OR identity values
  
      |  x  | x &and; 1 |
      |-----|-----------|
      | `0` |    `0`    |
      | `1` |    `1`    |

      |  x  | x &or; 0  |
      |-----|-----------|
      | `0` |    `0`    |
      | `1` |    `1`    |

    - AND and OR commutativity

        |  x  |  y  | x&and;y | y&and;x |
        |-----|-----|---------|---------|
        | `0` | `0` |   `0`   |   `0`   |
        | `0` | `1` |   `0`   |   `0`   |
        } `1` | `0` |   `0`   |   `0`   |
        | `1` | `1` |   `1`   |   `1`   |

        |  x  |  y  | x&or;y  | y&or;x  |
        |-----|-----|---------|---------|
        | `0` | `0` |   `0`   |   `0`   |
        | `0` | `1` |   `1`   |   `1`   |
        } `1` | `0` |   `1`   |   `1`   |
        | `1` | `1` |   `1`   |   `1`   |

    -  AND distributive over OR

          |  x  |  y  |  z  | (y&or;z) | (x&and;y) | (x&and;z) | (x&and;(y&or;z) | (x&and;y)&or;(x&and;z) |
          |-----|-----|-----|----------|-----------|-----------|-----------------|------------------------|
          | `0` | `0` | `0` |   `0`    |    `0`    |    `0`    |     `0`         |           `0`          |    
          | `0` | `0` | `1` |   `1`    |    `0`    |    `0`    |     `0`         |           `0`          |
          | `0` | `1` | `0` |   `1`    |    `0`    |    `0`    |     `0`         |           `0`          |
          | `0` | `1` | `1` |   `1`    |    `0`    |    `0`    |     `0`         |           `0`          |
          | `1` | `0` | `0` |   `0`    |    `0`    |    `0`    |     `0`         |           `0`          |
          | `1` | `0` | `1` |   `1`    |    `0`    |    `1`    |     `1`         |           `1`          |
          | `1` | `1` | `0` |   `1`    |    `1`    |    `0`    |     `1`         |           `1`          |
          | `1` | `1` | `1` |   `1`    |    `1`    |    `1`    |     `1`         |           `1`          |

    - AND annulment

        |  x  | x &and; 0 |
        |-----|-----------|
        | `0` |    `0`    |
        | `1` |    `0`    |
        
    - Involution of NOT
        
        |  x  | (&not;x) | &not;(&not;x) |
        |-----|----------|---------------|
        | `0` |    `1`   |      `0`      |
        | `1` |    `0`   |      `1`      |

    - OR distributive over AND is shown in Table 4-5 in book.

    - OR annulment value

        |  x  | x &or; 1  |
        |-----|-----------|
        | `0` |    `1`    |
        | `1` |    `1`    |

    - AND and OR complements

        |  x  | &not;x | x &and; &not;x |
        |-----|--------|----------------|
        | `0` |  `1`   |      `0`       |
        | `1` |  `0`   |      `0`       |

        |  x  | &not;x | x &or; &not;x |
        |-----|--------|----------------|
        | `0` |  `1`   |      `1`       |
        | `1` |  `0`   |      `1`       |

    - AND and OR idempotency

        |  x  | x&and;x |
        |-----|---------|
        | `0` |   `0`   |
        | `1` |   `1`   |

        |  x  | x&or;x  |
        |-----|---------|
        | `0` |   `0`   |
        | `1` |   `1`   |

2.  De Morgan's law

    |  x  |  y  |  (x&and;y)  | &not;(x&and;y) | &not;x | &not;y | &not;x &or; &not;y |
    |-----|-----|-------------|----------------|--------|--------|--------------------|
    | `0` | `0` |     `0`     |      `1`       |   `1`  |   `1`  |       `1`          |    
    | `0` | `1` |     `0`     |      `1`       |   `1`  |   `0`  |       `1`          |
    | `1` | `0` |     `0`     |      `1`       |   `0`  |   `1`  |       `1`          |
    | `1` | `1` |     `1`     |      `0`       |   `0`  |   `0`  |       `0`          |

    |  x  |  y  |  (x&or;y)  | &not;(x&or;y) | &not;x | &not;y | &not;x &and; &not;y |
    |-----|-----|------------|---------------|--------|--------|---------------------|
    | `0` | `0` |     `0`    |      `1`      |   `1`  |   `1`  |        `1`          |    
    | `0` | `1` |     `1`    |      `0`      |   `1`  |   `0`  |        `0`          |
    | `1` | `0` |     `1`    |      `0`      |   `0`  |   `1`  |        `0`          |
    | `1` | `1` |     `1`    |      `0`      |   `0`  |   `0`  |        `0`          |

3. Let a 4-bit integer be *wxyz* where each literal represents one bit. The even 4-bit integers are given by the function:

   F(w,x,y,z) = (&not;w &and; &not;x &and; &not;y &and; &not;z)
    &or; (&not;w &and; &not;x &and; y &and; &not;z)
    &or; (&not;w &and; x &and; &not; y &and; &not;z)
    &or; (&not;w &and; x &and; y &and; &not;z)
    &or; (w &and; &not;x &and; &not;y &and; &not;z)
    &or; (w &and; &not;x &and; y &and; &not;z)
    &or; (w &and; x &and; &not;y &and; &not;z)
    &or; (w &and; x &and; y &and; &not;z)
      
   Using the distributive property repeatedly we get:

   F(w,x,y,z) = &not;z &and; 
    ((&not;w &and; &not;x &and; &not;y)
    &or; (&not;w &and; &not;x &and; y)
    &or; (&not;w &and; x &and; &not; y)
    &or; (&not;w &and; x &and; y)
    &or; (w &and; &not;x &and; &not;y)
    &or; (w &and; &not;x &and; y)
    &or; (w &and; x &and; &not;y)
    &or; (w &and; x &and; y))

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= &not;z &and;
    (&not;w &and;
    ((&not;x &and; &not;y)
    &or; (&not;x &and; y)
    &or; (x &and; &not; y)
    &or; (x &and; y))
    &or; w &and;
    ((&not;x &and; &not;y)
    &or; (&not;x &and; y)
    &or; (x &and; &not; y)
    &or; (x &and; y)))

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= &not;z &and; (&not;w &or; w) &and; ((&not;x &and; &not;y) &or; (&not;x &and; y) &or; (x &and; &not; y) &or; (x &and; y))
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= &not;z &and; (&not;w &or; w) &and; (&not;x &and; (&not;y &or; y) &or; x &and; (&not; y &or; y))
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= &not;z &and; (&not;w &or; w) &and; (&not;x &or; x) &and; (&not; y &or; y)

   And from the complement property we arrive at a minimal sum of products:

   F(w,x,y,z) = &not;z

   a simple NOT gate with the least significant bit as input.

4. Using a Karnaugh map,

   ![](./assets/images/ch_04/Kmap_4_4.svg)

   We get the equation:

   F(x,y,z) = (&not;z) &or; (&not;x &and; &not;y)
      &or; (x &and; y)

5. Using a Karnaugh map,

   ![](./assets/images/ch_04/Kmap_4_5.svg)

   We get the equation:

    &not;F(x,y,z) = (&not;x &or; &not;y)
      &and; (&not;y &or; &not;z)
      &and; (y &or; z)

6. xy horizontal

   ![](./assets/images/ch_04/Kmap_4_6.svg)
7. xz horizontal

   ![](./assets/images/ch_04/Kmap_4_7.svg)
8. Five variables

   ![](./assets/images/ch_04/Kmap_4_8.svg)
9. The single-digit prime numbers are 2, 3, 5, and 7. Using four bits to represent them:
    
    F(w,x,y,z) = (&not;w &and; &not;x &and; y &and; &not;z) 
        &or; (&not;w &and; &not;x &and; y &and; z)
        &or; (&not;w &and; x &and; &not; y &and; z)
        &or; (&not;w &and; x &and; y &and; z)

    Assuming that the numbers 0, 1, 10, 11, 12, 13, 14, and 15 will never occur, we can use a Karnaugh map to simplfy the equation:

   ![](./assets/images/ch_04/Kmap_4_9.svg)

   This gives us the minimization:

    F(w,x,y,z) = (&not;w &and; &not;x) &or; (x &and; z)