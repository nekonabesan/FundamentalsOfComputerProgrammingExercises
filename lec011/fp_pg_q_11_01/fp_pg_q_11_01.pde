// 問題 11.1 “Welcome to Programming and Exercises Class!!” という文字列全体の色相を時間で変化させよ．
private String str = new String("Welcome to Programming and Exercises Class!!");
private float h = 0;
private float s = 0;
private float b = 0;
private boolean flg = true;

public void setup(){
  size(600, 100);
  textFont(createFont("Harrington", 24));
  colorMode(HSB, this.str.length() - 1);
  this.h = 0;
  this.s = this.str.length() - 1;
  this.b = this.str.length() - 1;
  this.drawText();
}

public void draw(){
  background(this.str.length() - 1);
  fill(h, s, b);
  if(flg){
    this.h += 0.1;
    this.s += 0.1;
    this.b += 0.1;
  } else {
    this.h -= 0.1;
    this.s -= 0.1;
    this.b -= 0.1;
  }
  if(this.str.length() - 1 <= h){
    flg = false;
  }
  if(h <= 0){
    flg = true;
  }
  this.drawText();
}

private void drawText(){
  background(this.str.length() - 1);
  int offset = 0;
  for(float i = 0; i < this.str.length(); i++){
    fill(h, s, b);
    text(this.str.charAt(int(i)), (width - textWidth(this.str)) / 2 + offset, height / 2);
    offset += textWidth(this.str.charAt(int(i)));
  }
}
