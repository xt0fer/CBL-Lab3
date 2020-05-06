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
### outline

You want to
- in your ENV, define your IO section to have to files SELECT'd
- create a data div with a file section that has two FD and Picture records for input and output records
- have a working storage that has LAST-RECORD flag to kno when you run out of input.
- a record that holds the pretty printed formats, so you can print out a row )in addition to writing it into the output file.
- then in your procedure div,
  - open your files
  - read the next record, until enf of file
  - write out the record to the output file
  - then read the next record
- then stop

After you get the reading writing going, add a display output of formatted data.

Add a DISPLAY header and DISPLAY each row`STDOUT` for a nice presentaion in addition to the output file. Like this:

```
Name     Gross     Taxes     Net Pay  
Kris       $200.00    $10.00   $190.00
April      $252.00    $12.60   $239.40
James      $204.25    $12.25   $192.00
Chris      $322.00    $19.32   $302.68
Zanetta    $330.00   $165.00   $165.00
```

If you want to check your output file, do this:

```
$ od -a results.dat 
0000000    K   r   i   s  sp  sp  sp  sp   0   0   0   0   0   2   0   0
0000020    0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0
0000040    0   1   9   0   0   0   A   p   r   i   l  sp  sp  sp   0   0
0000060    0   0   0   2   5   2   0   0   0   0   0   0   0   0   1   2
0000100    6   0   0   0   0   0   0   2   3   9   4   0   J   a   m   e
0000120    s  sp  sp  sp   0   0   0   0   0   2   0   4   2   5   0   0
0000140    0   0   0   0   1   2   2   5   0   0   0   0   0   1   9   2
0000160    0   0   C   h   r   i   s  sp  sp  sp   0   0   0   0   0   3
0000200    2   2   0   0   0   0   0   0   0   0   1   9   3   2   0   0
0000220    0   0   0   3   0   2   6   8   Z   a   n   e   t   t   a  sp
0000240    0   0   0   0   0   3   3   0   0   0   0   0   0   0   0   1
0000260    6   5   0   0   0   0   0   0   0   1   6   5   0   0        
0000276
```

-Ciao.
