// Author bambucha
// exported: bearing

module BearingPlot(height, inner_radius, outer_radius ){
	difference() {
		cylinder(d = outer_radius, h = height)	;
		cylinder(d = inner_radius, h = height);
	}
}

module bearingSwitch(type){
	if(type == 624){
		BearingPlot(5,4,13);
	}
	if(type == 608){
		BearingPlot(7, 8, 22);
	}
}

module bearing(type, forDifference=false){
	if(forDifference){
		hull(){ bearingSwitch(type); }
	} else {
		bearingSwitch(type);
	}
}

bearing(624);