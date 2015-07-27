// Author bambucha
// exported: bearing

include <utils.scad>

innerIndex = 0;
outerIndex = 1;
heightIndex = 2;

bearingParameters = [
	[624, [4,13,5]],
	[608, [8,22,7]]
];

module bearing(type, forDifference=false){
	params = searchFor(type, bearingParameters);
	difference(){
		cylinder(d = params[outerIndex], h = params[heightIndex])	;
		if(!forDifference){
			cylinder(d = params[innerIndex], h = params[heightIndex]);
		}
	}	
}

bearing(624);