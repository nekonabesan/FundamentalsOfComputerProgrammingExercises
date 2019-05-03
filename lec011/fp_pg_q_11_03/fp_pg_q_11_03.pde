// 問題 11.3 描画領域上方に表示されている文字列全体を同時に鉛直下向きに等速直線運動させよ
private String str = new String("Welcome to Programming and Exercises Class!!");
private Character[] cl = new Character[this.str.length()];
private float h = 0;
private float s = 0;
private float b = 0;
private boolean flg = true;

public void setup(){
  size(1000, 300);
  textFont(createFont("Harrington", 24));
  colorMode(HSB, this.str.length() - 1);
  rectMode(CENTER);
  ellipseMode(CENTER);
  translate(width/2, height/2);
  this.h = 0;
  this.s = this.str.length() - 1;
  this.b = this.str.length() - 1;
  this.initializedText();
}

public void draw(){
  background(this.str.length() - 1);
  translate(width/2, height/2);
  float x = -1 * strWidth()/2;
  float d = textWidth(this.str.charAt(int(0)));
  for(float i = 0; i < this.str.length(); i++){
    cl[int(i)].rotateColorH();
    fill(cl[int(i)].getH(), cl[int(i)].getS(), cl[int(i)].getB());
    text(this.str.charAt(int(i)), cl[int(i)].getX(), cl[int(i)].getY());
    cl[int(i)].move();
    x += d;
  }
}

private void initializedText(){
  background(this.str.length() - 1);
  float y = -height/2 + textWidth(this.str.charAt(int(0))) + 10;
  float x = -1 * strWidth()/2;
  float d = textWidth(this.str.charAt(int(0)));
  for(float i = 0; i < this.str.length(); i++){
    Character c = new Character(this.str.length(), x, y, i, this.str.length() - 1, this.str.length() - 1);
    c.setup(0, 1, width, height, d);
    cl[int(i)] = c;
    fill(i, this.str.length() - 1, this.str.length() - 1);
    text(this.str.charAt(int(i)), x, y);
    x += d;
  }
}

/*private void drawText(){
  translate(width/2, height/2);
  float x = -1 * strWidth()/2;
  float d = textWidth(this.str.charAt(int(0)));
  for(float i = 0; i < this.str.length(); i++){
    cl[int(i)].rotateColorH();
    fill(cl[int(i)].getH(), cl[int(i)].getS(), cl[int(i)].getB());
    text(this.str.charAt(int(i)), cl[int(i)].getX(), cl[int(i)].getY());
    cl[int(i)].move();
    x += d;
  }
}*/

private float strWidth(){
  float wh = 0;
  for(float i = 0; i < this.str.length(); i++){
    wh += textWidth(this.str.charAt(int(0)));
  }
  return wh;
}
