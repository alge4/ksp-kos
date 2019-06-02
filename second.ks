//first.ks

//first launch for the rocket ship KerbalX

//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.


//PUT THE SHIP IN GOOD CONDITION TO LAUNCH.

//LOCK THROTTLE TO 100%
LOCK THROTTLE TO 1.0. // 1.O IS THE MAX, 0.0 IS IDLE.

//LOCK STEERING TO UP.
LOCK STEERING TO MYSTEER.
SET MYSTEER TO HEADING(90,90).

//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 5.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown + "..." AT (0,1).
    WAIT 1. // pauses the script here for 1 second.
}


WHEN MAXTHRUST = 0 THEN {
    PRINT "Staging".
    STAGE.
    PRESERVE.
}

//THIS WILL BE OUR MAIN CONTROL LOOP FOR THE ASCENT PORTION. 
// IT SYCLCES CONTINUOUSLY UNTIL OUR APOAPSIS IS GREATER THAN 100KM.

UNTIL APOAPSIS > 100000 {
		IF SHIP:VELOCITY:SURFACE:MAG <100{
			//FOR INITIAL ASCENT WE WANT TO GO STRAIGHT UP THROUGH THE THICK ATMOSPHERE
			//HEADING OF 90 DEGREES (EAST)
			SET MYSTEER TO HEADING(90,90).
		
		//ONCE FASTER THAN 100M/S , WE WANT TO PITCH DOWN TEN DEGREES.
		} ELSE IF SHIP:VELOCITY:SURFACE:MAG >=100 {
			SET MYSTEER TO HEADING(90,80).
			PRINT "PITCHING TO 80 DEGREES" AT (0,15).
			PRINT ROUND(SHIP:APOAPSIS,0) AT (0,16).
		}.
}.


WAIT UNTIL SHIP:ALTITUDE > 70000.

