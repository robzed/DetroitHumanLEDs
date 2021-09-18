\ Analogue to digital conversion Reading 

-ADCbase
marker -ADCbase

\ On ATmega based boards (UNO, Nano, Mini, Mega), it takes about 
\ 100 microseconds (0.0001 s) to read an analog input, so the 
\ maximum reading rate is about 10,000 times a second.

-ADCBase
marker -ADCBase

hex
7e constant DIDR0   \ digital input disable
7c constant ADMUX
7b constant ADCSRB  \ defs to free running, no mux enable
7a constant ADCSRA  \ 
79 constant ADCH    \ analogue reading high byte
78 constant ADCL    \ analogue reading low byte

20 constant ADLAR   \ left shift result (for easy 8 bit)
40 ADLAR + constant _ADMUX  \ 40 is Vref=Vcc

: analog.init ( -- )
    _ADMUX ADMUX mset
\ AVR ADC must be clocked at a frequency between 50 and 200kHz. 
\ So we need to set proper prescaller bits so that the scaled 
\ system clock would fit in this range. As our AVR is clocked 
\ at 16MHz, we will use 128 scaling factors by setting ADPS0, 
\ ADPS1, and ADPS2 bits in the ADCSRA register. 
\ This gives 16000000/128=125kHz of ADC clock.
\ /128 = value 7

    87 ADCSRA mset \ 80 = ADC enable
;

: analogRead8 ( ch -- u )
    0f and _ADMUX + ADMUX c!   \ select channel
    40 ADCSRA mset      \ start conv
    begin 40 ADCSRA mtst while repeat \ wait

    \ return result
    ADCH c@ \ for 16 bit we'd read ADCL first, and have ADLAR=0
;

decimal

