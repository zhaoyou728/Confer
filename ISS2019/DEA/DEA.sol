Problem:    DEA
Rows:       8
Columns:    7
Non-zeros:  49
Status:     OPTIMAL
Objective:  objective = 1 (MAXimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 objective    B              1                             
     2 C1[1]        NS             1             1             =             1 
     3 C2[1]        NU             0                          -0             1 
     4 C2[2]        B     -0.0554461                          -0 
     5 C2[3]        NU             0                          -0         < eps
     6 C2[4]        B     -0.0554461                          -0 
     7 C2[5]        NU             0                          -0         < eps
     8 C2[6]        B     -0.0211089                          -0 

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 INW[1]       B       0.126372             0               
     2 INW[2]       B       0.137912             0               
     3 INW[3]       B      0.0258936             0               
     4 OUTW[1]      NL             0             0                       < eps
     5 OUTW[2]      NL             0             0                       < eps
     6 OUTW[3]      B     0.00478469             0               
     7 OUTW[4]      NL             0             0                       < eps

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 4.44e-16 on row 7
        max.rel.err = 1.33e-16 on row 7
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 8.53e-14 on column 6
        max.rel.err = 4.44e-16 on column 2
        High quality

KKT.DB: max.abs.err = 9.42e-14 on column 7
        max.rel.err = 9.42e-14 on column 7
        High quality

End of output
