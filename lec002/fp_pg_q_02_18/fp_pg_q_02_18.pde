int height = 432;
int width = 648;
size(648, 432);
background(255, 255, 255);
// ===== red ===== //
// https://www.pantone.com/color-finder/179-C
noStroke();
fill(224, 60, 49);
rect(0, 0, 648, 144);
// ===== red ===== //
// https://www.pantone.com/color-finder/Reflex-Blue-C
noStroke();
fill(0, 20, 137);
rect(0, 288, 648, 144);
// ===== white triangle 01 ===== //
strokeWeight(144);
stroke(255, 255, 255);
fill(255, 255, 255);
triangle(0, 0, 0, height, width / 2, height / 2);
// ===== greean 01 ===== //
// https://www.pantone.com/color-finder/3415-C
noStroke();
fill(0, 119, 73);
rect(0, 173, 648, 86);
// ===== green triangle 01 ===== //
// https://www.pantone.com/color-finder/3415-C
strokeWeight(86);
stroke(0, 119, 73);
fill(0, 119, 73);
triangle(0, 0, 0, 432, 324, 216);
// ===== yellow triangle 01 ===== //
// https://www.pantone.com/color-finder/1235-C
noStroke();
fill(255, 184, 28);
triangle(0, ((height / 2) * 0.20), 0, height - ((height / 2) * 0.20), (width / 2) - ((width / 2) * 0.20), (height /2));
// ===== black triangle 01 ===== //
noStroke();
fill(0, 0, 0);
triangle(0, ((height / 2) * 0.35), 0, height - ((height / 2) * 0.35), (width / 2) - ((width / 2) * 0.35), (height /2));
