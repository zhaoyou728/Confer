Problem:    DEA
Rows:       5
Columns:    6
Non-zeros:  24
Status:     OPTIMAL
Objective:  objective = 1 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 objective    B              1                             
     2 C1[3]        NS             1             1             =             1 
     3 C2[1]        NU             0                          -0         < eps
     4 C2[2]        B    -0.00986193                          -0 
     5 C2[3]        NU             0                          -0             1 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 INW[1]       B        0.16075             0               
     2 INW[2]       B        0.10355             0               
     3 OUTW[1]      NL             0             0                       < eps
     4 OUTW[2]      B     0.00591716             0               
     5 OUTW[3]      NL             0             0                       < eps
     6 OUTW[4]      NL             0             0                       < eps

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 2.22e-16 on row 5
        max.rel.err = 7.40e-17 on row 5
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 0.00e+00 on column 0
        max.rel.err = 0.00e+00 on column 0
        High quality

KKT.DB: max.abs.err = 2.68e-16 on row 3
        max.rel.err = 2.68e-16 on row 3
        High quality

End of output
