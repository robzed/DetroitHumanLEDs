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

\ Arduino Pin 13 = PB13
%100000 constant LED_BUILTIN

: init-hw ( -- )
    LED_BUILTIN DDRB mset ;

: led13-on ( -- )
    LED_BUILTIN PORTB mset ;

: led13-off ( -- )
    LED_BUILTIN PORTB mclr ;

: blinking ( -- )
    init-hw
    begin
        led13-on   500 ms
        led13-off  500 ms
    key? until ;


