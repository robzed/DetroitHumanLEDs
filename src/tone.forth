\ Make a tone on pin PB3 (arduino pin 11)
\ 
\ We use timer 2 for this, and because PB3
\ is connected to the Timer 2 output, we can 
\ do this without using an interrupt!
\ 
\ #requires board_setup.forth

-Tone
marker -Tone

\ Timer2 Register Definitions
$b0 constant TCCR2A
$b1 constant TCCR2B
$b3 constant OCR2A
$42 constant initTCCRAA \ toggle OC2A, CTC = clear timer on compare match

\ display content TIMERs registers
: .T2Regs ( -- )
    hex
    cr ." OCR2A:  " OCR2A  c@ 2 u.r
    cr ." TCCR2A: " TCCR2A c@ 2 u.r
    cr ." TCCR2B: " TCCR2B c@ 2 u.r
    cr
    decimal
  ;

\ like ud/mod but without the remainder
: ud/ ( ud u1 -- ud.quot )
    ud/mod rot drop
;

\ this helper just calculates the base frequency for the timer
: _F/freq/2 ( freq -- d.Fclk/Freq/2 )
\ FOCnx = FclkIO / ( 2 * N * (1 + OVRnx )) 
\ N = prescaler
    \ 500 = 1000 2/ (1000* to make MHz from KHz, 2/ to compensate for toggle)
    Fcy 500 um* rot ( freq -- double-Fclock freq )
    ud/  ( double-Fclock freq --  Fclk/Freq/2 )
;

\ check for a specific divider whether the remainder fits into a byte
\ if it does return that remainder
\ otherwise return the base frequency
: T2in_range ( d.base_freq divider -- d.base_freq false | ocr true )
    >r 2dup r>   ( d.base div -- d.base d.base div )
    ud/ 2dup 256 0 d< if ( d.base d.base div -- d.base d.quot )
        2swap 2drop ( d.base q.quot -- d.quot )
        drop true ( -- quot true )
        exit
    then
    2drop false  ( d.base q.quot -- d.base false )
; 

: calc1T2 ( freq -- ocr pre )
    _F/freq/2
    2dup             256 0 d< if drop 1 exit then
         8 T2in_range if 2 exit then
        32 T2in_range if 3 exit then
        64 T2in_range if 4 exit then
       128 T2in_range if 5 exit then
       256 T2in_range if 6 exit then
      1024 T2in_range if 7 exit then

    \ default
    2drop 255 7  \ lowest freq possible
;

: _setupT2 ( pre ocr -- )
    0 TCCR2B c!       \ Stop Timer2

    OCR2A c! ( pre ocr -- pre )
    initTCCRAA TCCR2A c!
    TCCR2B c!   \ Prescaler = 1024 ( pre -- )
;


: tone ( freq -- )
    \ The OC2A value will not be visible on the port pin unless the 
    \ data direction for the pin is set to output.     
    calc1T2 swap
    _setupT2
;


: notone ( -- )
    0 TCCR2A c!     \ disable output control
    0 TCCR2B c!     \ top timer
    \ assume BUZZER pin is low due to I/O setup
;

