//logger
SET filename TO time:seconds + "_" + ship:name + ".csv".
PRINT "Logging to " + filename.
LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
LOCK currentthrust TO SHIP:CONTROL:PILOTMAINTHROTTLE * SHIP:AVAILABLETHRUST.
LOCK shipZvect TO ship:facing * V(0,0,1).
LOCK shipaccn TO ship:facing:inverse * ship:sensors:acc.
LOCK shipaccng TO  ship:facing:inverse * (ship:sensors:acc - ship:sensors:grav).
log "time,alt,lat,long,facing.x,facing.y,facing.z,Q,pres,thrust,vel.surf.mag,vel.orb.mag,accn.x,accn.y,accn.z,grav.x,grav.y,grav.z,shipaccn.x,shipaccn.y,shipaccn.z,shipaccng.x,shipaccng.y,shipaccng.z,eccentricity,semi-major-axis,inclination,longitude_of_ascending_node,argument_of_periapsis,true_anomaly" to filename.
UNTIL FALSE {
	log time:seconds + ","
	+ ship:altitude + ","
	+ ship:latitude + ","
	+ ship:longitude + ","
	+ shipZvect:x + ","
	+ shipZvect:y + ","
	+ shipZvect:z + ","
	+ ship:q + ","
	+ ship:sensors:pres + ","
	+ currentthrust + ","
	+ velocity:surface:mag + ","
	+ velocity:orbit:mag + ","
	+ ship:sensors:acc:x + ","
	+ ship:sensors:acc:y + ","
	+ ship:sensors:acc:z + ","
	+ ship:sensors:grav:x + ","
	+ ship:sensors:grav:y + ","
	+ ship:sensors:grav:z + ","
	+ shipaccn:x + ","
	+ shipaccn:y + ","
	+ shipaccn:z + ","
	+ shipaccng:x + ","
	+ shipaccng:y + ","
	+ shipaccng:z + ","	
	+ ship:orbit:eccentricity + ","
	+ ship:orbit:semimajoraxis + ","
	+ ship:orbit:inclination + ","
	+ ship:orbit:lan + ","
	+ ship:orbit:argumentofperiapsis + ","
	+ ship:orbit:trueanomaly
	to filename.
	WAIT 0.001.
}
