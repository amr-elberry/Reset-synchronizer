# *Reset-synchronizer*

## *Definition of reset synchronizer*

#### A reset synchronizer synchronizes the de-assertion of reset with respect to the clock domain. In other words, a reset synchronizer manipulates the asynchronous reset to have synchronous deassetion.


## *Why need for reset synchronizer?*

#### The way most of the designs have been modeled needs asynchronous reset assertion and synchronous de-assertion. The requirement of most of the designs these days is: When reset is asserted, it propagates to all designs; and brings them to reset state whether or not the clock is toggling; i.e. assertion should be asynchronous When reset is de-asserted, wait for a clock edge, and then, move the system to the next state as per the FSM (Finite State Machine); de-assertion should be synchronous
The top-level reset sources are mostly asynchronous, both in assertion and during de-assertion. The circuit that manipulates the asynchronous reset to have asynchronous assertion and synchronous deassertion is referred to as a reset synchronizer.

## *How does the reset synchronizer work?*
When the reset is asserted, it first propagates to reset synchronizer flops. It resets both the flops of the reset synchronizer asynchronously (without waiting for the clock edge) thereby generating reset assertion for fanout registers.
Similarly, the de-assertion of reset first reaches the two flops of the reset synchronizer. Now, the first flop in the chain propagates 1 to intermediate output upon arrival of a clock edge. Upon the next clock edge, this signal propagates to the output thereby reaching the fanout registers. The reset de-assertion timing (recovery and removal checks timing) should be met from the second stage of the reset synchronizer to all the domain registers' reset pins as the de-assertion is synchronous.
