Problem:    B
Rows:       17
Columns:    9
Non-zeros:  35
Status:     OPTIMAL
Objective:  z = 10383600 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 z            B    1.03836e+07                             
     2 pasesMetrosG1
                    NU             0                          -0         < eps
     3 pasesMetrosG2
                    B              0            -0               
     4 pasesMetrosS1
                    NU             0                          -0         < eps
     5 pasesMetrosS2
                    B              0            -0               
     6 metrosTotales
                    B           7975                        8000 
     7 minGold      NL           100           100                        -250 
     8 minSilver    B          15750           502               
     9 Ptotales1    NL             0            -0                      -14000 
    10 Ptotales2    B              0                          -0 
    11 Pmax         NU           800                         800         13200 
    12 demMinSilv   NL             0            -0                        -700 
    13 demMinGold   NL             0            -0                       -1750 
    14 ing1         NL             0            -0                          -1 
    15 ing2         B              0                          -0 
    16 egr1         NU       -151400                     -151400             1 
    17 egr2         B        -151400       -151400               

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 Mgold        B            100             0               
     2 Msilv        B           7875             0               
     3 Sgold        B            100             0               
     4 Ssilv        B          15750             0               
     5 P            B            800             0               
     6 Pgold        B           12.5             0               
     7 Psilv        B          787.5             0               
     8 Ingresos     B     1.1175e+07             0               
     9 Egresos      B         791400             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 1.16e-10 on row 16
        max.rel.err = 5.66e-15 on row 13
        High quality

KKT.PB: max.abs.err = 1.16e-10 on row 17
        max.rel.err = 1.82e-12 on row 5
        High quality

KKT.DE: max.abs.err = 1.82e-12 on column 6
        max.rel.err = 6.50e-17 on column 6
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
