// 問題 11.2 異る色相で表示されている文字列の色が時間とともに変化させよ．
private String str = new String("Welcome to Programming and Exercises Class!!");
private Color[] cl = new Color[this.str.length()];
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
  this.initializedText();

}

public void draw(){
  background(this.str.length() - 1);
  this.drawText();
}

private void initializedText(){
  background(this.str.length() - 1);
  int offset = 0;
  for(float i = 0; i < this.str.length(); i++){
    Color c = new Color(this.str.length(), i, this.str.length() - 1 ,this.str.length() - 1);
    cl[int(i)] = c;
    fill(i, this.str.length() - 1, this.str.length() - 1);
    text(this.str.charAt(int(i)), (width - textWidth(this.str)) / 2 + offset, height / 2);
    offset += textWidth(this.str.charAt(int(i)));
  }
}

private void drawText(){
  background(this.str.length() - 1);
  int offset = 0;
  for(float i = 0; i < this.str.length(); i++){
    cl[int(i)].rotateColor();
    fill(cl[int(i)].getH(), cl[int(i)].getS(), cl[int(i)].getB());
    text(this.str.charAt(int(i)), (width - textWidth(this.str)) / 2 + offset, height / 2);
    offset += textWidth(this.str.charAt(int(i)));
  }
}
