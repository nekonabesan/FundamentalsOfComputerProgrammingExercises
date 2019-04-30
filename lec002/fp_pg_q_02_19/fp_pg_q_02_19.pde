int triangle_height = height / 5;
size(300, 180);
//https://www.htmlcsscolor.com/hex/D21034
background(225, 16, 52);
// ===== White rect 01 ===== //
noStroke();
fill(255, 255, 255);
rect(0, 0, 75, height);
// ===== White triangle 01 ===== //
for(int i = 0; i < 5; i++){
  noStroke();
  fill(255, 255, 255);
  triangle(75 ,(i * triangle_height), 75, (i * triangle_height) + triangle_height, 120, (i * triangle_height) + (triangle_height / 2));
}
