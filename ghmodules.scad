THICK = 2; // Wall thickness everywhere - verify everything if making adjustements
BASETHICK = 1.5; // Thickness of the solid base
HOLE_DIA = 5; // Set to something large (say 500) to not render holes and speed up all processing

$fs = 0.5; // This takes a long long time to compute, but much nicer

module wall(start, dimensions, angle=0, height=0) {
    d1 = dimensions.x < 0 ? -dimensions.x : dimensions.x;
    s1 = dimensions.x < 0 ? -start.x+dimensions.x : -start.x;
    d2 = dimensions.y < 0 ? -dimensions.y : dimensions.y;
    s2 = dimensions.y < 0 ? -start.y+dimensions.y : -start.y;
    
    translate([s1, s2, height]) {
        rotate([0, 0, angle]) {
            difference() {
                cube([d1, THICK, d2]);
                holes(d1, d2);
            }
        }
    }
}

// Puts a sphere in the bottom corner listd, this will prevent a full vertical line, preventing lifting.
module cornercut(location) {
    x = -location.x;
    y = -location.y;
    z = -HOLE_DIA / 2;
    translate([x, y, z]) sphere(HOLE_DIA);
}


// Unfinished, an idea for a corner
module corner(location, height, direction) {
    x1 = location.x;
    y1 = location.y;
    x1 = location.x;
    y2 = location.y;
    location1 = [x1 + HOLE_DIA*2, y1];
    location2 = [x1, y1 + HOLE_DIA*2 - THICK];
    cut1 = [-x1 - HOLE_DIA * 2, -y1, 0];
    cut2 = [-x1 - THICK - .5, -y1-HOLE_DIA * 2 + THICK, 0];
    
    difference() {
        wall(location1, [HOLE_DIA * 3, height], 0);
        translate(cut1) cube([HOLE_DIA * 2 - THICK, THICK, height]);
    }
    difference() {
        wall(location2, [HOLE_DIA * 3, height], 90);
        translate(cut2) cube([THICK + 1, HOLE_DIA * 2 - THICK, height]);
    }
}



HOLE_HEIGHT = THICK + 0.1;

module holes(width, height) {
    colcount = floor(width / (HOLE_DIA*2.5));
    //colcount = colcountt < 1 ? 1 : colcountt;
    colspacing = (width - HOLE_DIA) / (colcount);
        
    rowcount = floor(height / (HOLE_DIA*.75)) - 1; 
    
    if (rowcount > 0 && colcount > 0 && HOLE_DIA > 0) {
        for (row = [1:rowcount]) {
            if (row % 2 == 1) {
                for (col = [0:colcount-1]) {
                    translate([HOLE_DIA*1 + (col * colspacing), HOLE_HEIGHT, (HOLE_DIA * .75 * row)]) {
                        color("Yellow") {
                        rotate([90, 0, 0]) cylinder(h=HOLE_HEIGHT, d=HOLE_DIA);
                        }
                    }
                }
            } else {
                if (colspacing > (HOLE_DIA * 1.25)) {
                    for (col = [0:colcount-1]) {
                        translate([HOLE_DIA*1 + (colspacing/2) + (col * colspacing), HOLE_HEIGHT, (HOLE_DIA * .75 * row)]) {
                            color("Yellow") {
                                rotate([90, 0, 0]) cylinder(h=HOLE_HEIGHT, d=HOLE_DIA);
                            }
                        }
                    }
                }
            }
        }
    }
}


module prism(start, size, rotate=0) {
    w = size.x;
    h = size.y;
    rotate([0, 0, rotate]) {
       polyhedron(
               points=[[start.x, start.y, start.z], 
                        [start.x + THICK, start.y, start.z], 
                        [start.x + THICK, start.y + w, start.z], 
                        [start.x, start.y + w, start.z],
                        [start.x, start.y + w, start.z + h], 
                        [start.x + THICK, start.y + w, start.z + h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
    }
}
   