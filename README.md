# *Reset-synchronizer*

## *Definition of reset synchronizer*

#### A reset synchronizer synchronizes the deassertion of reset with respect to the clock domain. In other words, a reset synchronizer manipulates the asynchronous reset to have synchronous deassetion.


## *why Need for reset synchronizer?*

#### The way most of the designs have been modelled needs asynchronous reset assertion and synchronous de-assertion. The requirement of most of the designs these days is:
#### When reset is asserted, it propagates to all designs; brings them to reset state whether or not clock is toggling; i.e. assertion should be asynchronous
#### When reset is deasserted, wait for a clock edge, and then, move the system to next state as per the FSM (Finite State Machine); i.e. deassertion should be synchronous
#### The top level reset sources are mostly asynchronous, both in assertion and during deassertion. The circuit that manipulates the asynchronous reset to have asynchronous assertion and synchronous deassertion is referred as reset synchronizer.

## *How reset synchronizer works?*
#### When the reset is asserted, it first propagates to reset synchronizer flops. It resets both the flops of reset synchronizer asynchronously (without waiting for clock edge) thereby generating reset assertion for fanout registers.
#### Similarly, the de-assertion of reset first reaches the two flops of reset synchronizer. Now, the first flop in chain propagates 1 to intermediate output upon arrival of a clock edge. Upon next clock edge, this signal propagates to the #### output thereby reaching the fanout registers. The reset de-assertion timing (recovery and removal checks timing) should be met from second stage of reset synchronizer to all the domain registers' reset pins as the deassertion is synchronous.
