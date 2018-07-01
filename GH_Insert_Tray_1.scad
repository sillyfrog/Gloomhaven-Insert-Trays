include <ghmodules.scad>;

/*
Top Left: difference, difference
Top Right: difference, intersection
Bottom Left: intersection, difference
Bottom Right: intersection, intersection
*/
intersection() {
intersection() {
    difference() {
        union() {
            translate([0, 0, BASETHICK/2]) {
                cube([285, 185, BASETHICK], true);
            }
            
            wall([142.5-THICK, 92.5], [185, 57], 90);
            wall([-142.5, 92.5], [185, 57], 90);
            
            wall([142.5, 92.5], [285, 57], 0);
            wall([142.5, -92.5+THICK], [285, 57], 0);
            
            wall([-142.5, 1.5], [-133, 57], 0);
            
            wall([142.5, 5.75], [13, 30], 0);
            prism([-5.75, 113.5, 0], [16, 30], 90);
            prism([5.75-THICK, -93.5, 0], [16, 30], 270);
            wall([77.5, 5.75], [23, 30], 0);
            prism([-5.75, 38.5, 0], [16, 30], 90);
            prism([5.75-THICK, -18.5, 0], [16, 30], 270);
            wall([2.5, 5.75], [10, 30], 0);
            
            wall([-10.5, 92.5], [185, 28], 90);
            
            wall([-10.5, -71.5], [21, 57-28], 90, 28);
            prism([10.5-THICK, 71-11.5, 28], [12, 57-28]);
            prism([-10.5, -26.5, 28], [12, 57-28], 180);
            wall([-10.5, 15], [29.5, 57-28], 90, 28);
            
            prism([10.5-THICK, -27, 28], [12, 57-28]);
            wall([-10.5, 92], [21, 57-28], 90, 28);
            
            prism([-10.5, 71-12, 28], [12, 57-28], 180);
            
            wall([64.5, 4], [95, 30], 90);
            
            wall([41.5, 91], [14, 30], 90);
            prism([41.5, 62, 0], [15, 30], 180);
            
            // No holes across potential joins
            translate([-25, 92.5-THICK, 0]) cube([10, THICK, 57]);
            translate([-142.5, 5, 0]) cube([THICK, 10, 57]);
            translate([-64.5-THICK, 5, 0]) cube([THICK, 10, 30]);
            translate([-25, -92.5, 0]) cube([10, THICK, 57]);
            translate([142.5-THICK, 5, 0]) cube([THICK, 10, 57]);
            translate([10.5-THICK, 0, 0]) cube([THICK, 10, 57]);
        }
        cornercut([142.5-THICK, 92.5]);
        cornercut([-142.5, 92.5]);
        cornercut([-142.5, -92.5+THICK]);
        cornercut([142.5, -92.5+THICK]);
    }

    // Left/Right divide
    linear_extrude(height=100) {
        polygon(points=[[-20,-100],[200,-100],[200,100],[-20,100],
            [-20,70], [0,60], [0,30], [-20,20],
            [-20,-70], [0,-60], [0,-30], [-20,-20],]);
    }
}
    // Upper/Lower divide
    linear_extrude(height=100) {
        polygon(points=[[-200,10],[-200,-100],[200,-100],[200,10],
            [130, 10], [125, 5], [100, 5], [90, 15],
            [70, 15], [60, 5], [30, 5], [25, 5],
            [-35, 5], [-40, 0], [-50, 0], [-60, 10],
            [-85, 10], [-95, 0], [-110, 0], [-120, 10],
            ]);
    }
}
