// Imbus bolts
// export: imbus

include <bolt_commons.scad>;

heightIndex = 1;
diameterIndex = 0;

cylinderImbusHeadParams = [ 
	// type, [ d_k - head diameter, k - head height ]
	[M4, [7.0, 4]]
];

module imbus(diameter, length){
	head = searchForHead(diameter, cylinderImbusHeadParams);
	cylinder(d=diameter, length);
	translate([0,0,-head[1]]) 
		cylinder(d=head[diameterIndex], h=head[heightIndex]);
}

function imbus_head_height(diameter) = 
	searchForHead(diameter, cylinderImbusHeadParams)[heightIndex];

function imbus_head_diameter(diameter) = 
	searchForHead(diameter, cylinderImbusHeadParams)[diameterIndex];

coneHeadParams = [
	// type, [d_k - head diameter, k - headHeight]
	[M4, [8, 2.3]]
];

module cone_imbus(diameter, length){
	head = searchForHead(diameter, coneHeadParams);
	cylinder(d=diameter, length);
	translate([0,0,-head[heightIndex]]) {
		cylinder(d1=head[diameterIndex], d2=diameter, h= head[heightIndex]);
	}
}

function cone_head_height(diameter) = 
	searchForHead(diameter, coneHeadParams)[heightIndex];

function cone_head_diameter(diameter) = 
	searchForHead(diameter, coneHeadParams)[diameterIndex];

cone_imbus(M4, 20);