[ hi, I'm a comment! anything besides the characters "[]<>+-,." are ignored. 

  this BF program prints out "CernerWorks". in other languages, that
  would be trivial. in BF this requires some thought.

  here is the syntax, straight from wikipedia. this is for your benefit and
  mine (i cannot keep it straight in my head):

  --------------------------------------------------------------------------
  >	increment the data pointer (to point to the next cell to the right).
  <	decrement the data pointer (to point to the next cell to the left).
  +	increment (increase by one) the byte at the data pointer.
  -	decrement (decrease by one) the byte at the data pointer.
  .	output the byte at the data pointer.
  ,	accept one byte of input, storing its value in the byte at the data 
  	pointer.
  [	if the byte at the data pointer is zero, then instead of moving the 
  	instruction pointer forward to the next command, jump it forward to 
	the command after the opening brace.
  ]	if the byte at the data pointer is nonzero, then instead of moving 
  	the instruction pointer forward to the next command, jump it back 
	to the command after the closing brace.
  --------------------------------------------------------------------------

  to write "CernerWorks" and make the 32 line limit, i want to know the average
  of the range of numbers i'm shooting for and prime the array with values that
  are close to the ones i need. 

  the interesting ranges to me are 67-87, 100-120

  for x in `echo "CernerWorks" | hexdump | sed -e 's/^ //' -e 's/0a.*$//' | perl -ne 'print uc' | sed -e 's/[^ ]* //' -e '$d'`; do echo "ibase=16; $x" | bc; done
  67
  101
  114
  110
  101
  114
  87
  111
  114
  107
  115
]

++++ + add 5 to cell 0
[ 
	>++++ + add 5 to cell 1
	[
		>++++ + add 5 to cell 2
		>++++ add 4 to cell 3
		>+++ add 3 to cell 4
		<<<- decrement cell 1 counter
	]
	>>>>+ add 1 to cell 5
	<<<<<- decrement cell 0 counter
]

[ now i have the following cells set up:
         +---+---+-----+-----+----+---+
  cell:  | 0 | 1 |   2 |   3 |  4 | 5 |
         +---+---+-----+-----+----+---+
  value: | 0 | 0 | 125 | 100 | 75 | 5 |
         +---+---+-----+-----+----+---+
  ptr:     ^
]

>>>>--------. print 'C' cell 4 is now 67
<+. print 'e' cell 3 is now 101
<-----------. print 'r' cell 2 is now 114
----. print 'n' cell 2 is now 110
>. print 'e' cell 3
<++++. print 'r' cell 2 is now 114
<+++++[ cell 1 is 5
	>>>++++
	<<<-
]
>>>. print 'W' cell 4 is now 87
<<---. print 'o' cell 2 is now 111
+++. print 'r' cell 2 is now 114
>++++++. print 'k' cell 3 is now 107
<+. print 's' cell 2 is now 115
>>>+++++. print '\n' cell 5 is now 10
