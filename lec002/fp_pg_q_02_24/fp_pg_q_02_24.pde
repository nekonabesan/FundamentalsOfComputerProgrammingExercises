void setup() {
  size(440, 320);
}

// https://en.wikipedia.org/wiki/Flag_of_Panama
void draw() {
  background(255, 255, 255);
  // blue rectangle 01
  noStroke();
  fill(0, 56, 184);
  rect(0, 30, 440, 50);
  // blue rectangle 02
  noStroke();
  fill(0, 56, 184);
  rect(0, 240, 440, 50);
  // blue triangle 01
  stroke(0, 56, 184);
  strokeWeight(11);
  noFill();
  triangle(220, 101, 170, 188, 269, 188);
  // blue triangle 02
  stroke(0, 56, 184);
  strokeWeight(11);
  noFill();
  triangle(170, 132, 220, 219, 269, 132);
}
