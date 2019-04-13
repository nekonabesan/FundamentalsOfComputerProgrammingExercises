int height = 360;
int width = 600;
int triangle_height = height / 5;
size(600, 360);
//https://www.htmlcsscolor.com/hex/D21034
background(225, 16, 52);
// ===== White rect 01 ===== //
noStroke();
fill(255, 255, 255);
rect(0, 0, 150, height);
// ===== White triangle 01 ===== //
for(int i = 0; i < 5; i++){
  noStroke();
  fill(255, 255, 255);
  triangle(150 ,(i * triangle_height), 150, (i * triangle_height) + triangle_height, 240, (i * triangle_height) + (triangle_height / 2));
}
