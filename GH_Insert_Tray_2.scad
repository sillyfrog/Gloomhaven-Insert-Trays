include <ghmodules.scad>;
/*
Top Left: difference, difference
Top Right: difference, intersection
Bottom Left: intersection, difference
Bottom Right: intersection, intersection
*/
intersection() {
intersection() {
    union() {
        translate([0, 0, BASETHICK/2]) {
            cube([245, 285, BASETHICK], true);
        }
        wall([122.5-THICK, 142.5], [285, 28], 90);
        wall([-122.5, 142.5], [285, 28], 90);
        // No holes on potential joins
        translate([122.5-THICK, -5, 0]) cube([THICK, 10, 28]);
        translate([-122.5, -5, 0]) cube([THICK, 10, 28]);
        
        for(y=[142.5, 99.5, 56.5, 7.5, -40.5, -86.5, -142.5+THICK]) {
            wall([-122.5, y], [-245, 28], 0);
            // No holes on potential joins
            translate([0, -y, 0]) cube([10, THICK, 28]);
        }
        
        for(x=[88.5, 51.5, 17.5, -20.5, -53.5, -86.5]) {
            divider(x, -142.5);
        }
        for(x=[86.5, 52.5, 14.5, -18.5, -51.5, -84.5]) {
            divider(x, -99.5);
        }
        for(x=[88.5, 53.5, 18.5, -17.5, -51.5, -85.5]) {
            divider(x, -56.5, 33);
        }
        for(x=[81.5, 42.5, 1.5, -37.5, -80.5]) {
            divider(x, -6.5, 32);
            // No holes on potential joins
            translate([x-THICK, -5, 0]) cube([THICK, 10, 28]);
        }
        for(x=[60.5, -0.5, -59.5]) {
            divider(x, 40.5, 30);
        }
        for(x=[65.5, -5.5, -63.5]) {
            divider(x, 87, 36);
        }
        
    }

    // Left/Right divide
    linear_extrude(height=35) {
        polygon(points=[[5,-200],[200,-200],[200,200],[5,200],
            [5,75], [10,70], [10,60], [5,55],
            [5,-60], [-5,-70], [-5,-80], [5,-90],]);
    }
}
    // Upper/Lower divide
    linear_extrude(height=50) {
        polygon(points=[[-150,0],[-150,-200],[150,-200],[150,0],
            [75, 0], [65, 10], [55, 10], [45, 0],
            [-50, 0], [-55, 5], [-65, 5], [-70, 0],
            ]);
    }
}






module divider(x, y, l=28) {
    wall([-x, -y], [l, 28], 90);
    prism([-x, -y-l-6, 0], [6, 28], 180);
}
