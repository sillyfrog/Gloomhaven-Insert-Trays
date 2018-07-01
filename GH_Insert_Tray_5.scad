include <ghmodules.scad>;
/*
top/bottom: difference/intersection
*/
difference() {
    union() {
        translate([0, 0, BASETHICK/2]) {
            cube([150, 285, BASETHICK], true);
        }
        
        wall([75, 142.5], [150, 35], 0);
        wall([75, -142.5+THICK], [150, 35], 0);
        
        wall([75-THICK, 142.5], [285, 35], 90);
        wall([-75, 142.5], [285, 32], 90);
        
        prism([-75, 28, 32], [114.5, 3], 180);
        prism([-75, -27.5, 32], [56, 3], 180);
        prism([-75, -83.5, 32], [56, 3], 180);
        prism([-75, -139.5, 32], [56, 3], 180);
        
        // Weird, but need to line the holes up all the way through
        for (y=[142.5-THICK, -142.5+THICK*2]) {
            supportwall(y);
        }
        wall([25, 140], [14.5, 32], 90);
        prism([25, 112.5, 0], [13, 32], -180);
        wall([25, -125.5], [14.5, 32], 90);
        prism([-28, 112.5, 0], [13, 32], 0);
        
        for (y=[72.5, 1.5, -69.5]) {
            wall([75, y], [150, 32], 0);
            wall([25, y+14], [31, 32], 90);
            prism([25, y-30, 0], [13, 32], -180);
            prism([-25-THICK, -y-27, 0], [13, 32], 0);
            supportwall(y+THICK);
            supportwall(y-THICK);
        }
        // No holes across potential joins
        translate([75-THICK, 25, 0]) cube([THICK, 10, 32]);
        translate([-75, 25, 0]) cube([THICK, 10, 35]);

    }

    // upper/lower divide
    linear_extrude(height=40) {
        polygon(points=[[-200,30],[-200,-200],[200,-200],[200,30],
            [40,30], [30, 20], [10, 20], [0, 30],
            [-35,30], [-45, 20], [-55, 20], [-65, 30],]);
    }

}

module supportwall(y) {
    difference() {
        wall([75, y], [150, 35], 0);
        translate([-25, -y, 23]) cube([100, THICK, 13]);
        translate([-75, -y, 0]) cube([50, THICK, 36]);
    }
    translate([-25, -y, 18]) cube([100, THICK, 5]);
}

