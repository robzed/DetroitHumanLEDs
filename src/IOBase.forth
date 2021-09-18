\ IO Base 

-IOBase
marker -IOBase

decimal
\ PORTB
37 constant PORTB   \ Port B Data Register
36 constant DDRB    \ Port B Data Direction Register
35 constant PINB    \ Port B Input Pins
\ PORTC
40 constant PORTC   \ Port C Data Register
39 constant DDRC    \ Port C Data Direction Register
38 constant PINC    \ Port C Input Pins
\ PORTD
43 constant PORTD   \ Port D Data Register
42 constant DDRD    \ Port D Data Direction Register
41 constant PIND    \ Port D Input Pins


\ Use:
\ PORTD 7 defPIN: PD7  ( define portD pin #7)
: defPIN: ( PORTx bit# --- <word> | <word> --- mask port)
    create
        1 swap lshift c, c,           \ compile PORT and min mask
    does>
        dup c@          \ push pin mask
        swap 1+ c@      \ push PORT
  ;


\ Turn a port pin on, dont change the others.
: high ( pinmask portadr -- )
    mset
  ;
\ Turn a port pin off, dont change the others.
: low ( pinmask portadr -- )
    mclr
  ;

\ Only for PORTx bits, 
\ because address of DDRx is one less than address of PORTx.
 
\ Set DDRx so its corresponding pin is output.
: output ( pinmask portadr -- )
    1- high
  ;
\ Set DDRx so its corresponding pin is input.
: input  ( pinmask portadr -- )   
    1- low
  ;

\ read the pins masked as input
: pin@  ( pinmask portaddr -- fl )
    2- mtst \ select PINx register as input
    if      true
    else    false   then
  ;


