function stage_cleanly{
	parameter lowThrust.
	WHEN MAXTHRUST = 0 THEN {
    PRINT "Staging".
    STAGE.
	set throttle to lowThrust.
    PRESERVE.
}
	
}