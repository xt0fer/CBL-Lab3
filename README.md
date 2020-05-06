# CBL-Lab3

a simple sequential read/write COBOL problem

## perform a payroll calculation

read in acctpay, record by record, perform the calculation, and print out the record.

these are the calcs to do.

```
grosspay = hours * rate
deduction = grosspay * deduct-rate
netpay = grosspay - deduction
```

then you want to output a file using this record
``` cobol
       01 PRINT-REC.
             05 OUT-NAME PIC X(8).
             05 OUT-GROSSPAY PIC 9(8)V99.
             05 OUT-TAXES PIC 9(8)V99.
             05 OUT-NETPAY PIC 9(8)V99.
```

you should output the results, record by record, into a file named `results.dat`

now the input data is in `acctpay.dat`

and has an input format of

```cobol
    01 ACCT-REC.
            05 ACCT-NAME PIC X(8).
            05 ACCT-HOURS PIC 9(8)V99.
            05 ACCT-RATE PIC 9(8)V99.
            05 ACCT-DEDUCT PIC 9(8)V99.
```

when you think you have it right, run a shell command on your output file.

```bash
$ sum results.dat
# you should see as output
5334 1 results.dat
```

Now, if you'd like add ANOTHER output file that PRINTS to `STDOUT` a nice line for each operation.
