// 問題 7.16 図 5.7(d) に示すような色相が同心円の半径に比例して滑らかに変化している図の彩度が時間とともに変化
// するアニメーションを作成せよ．
private float x = 0;
private float y = 0;
private float h = 0;
private float s = 0;
private float b = 0;
private float i = 0;
private float wid = 0;
private float hit = 0;
private boolean flg = true;

void setup(){
  smooth();
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, (width - width/20));
  frameRate(30);
  this.b = (width - width/20);
}

void draw(){
  if(this.i <= (width - width/20)){
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, this.i, this.i);
    this.h += 1;
    this.s += 1;
    this.wid += 1;
    this.hit += 1;
  } else if ((width - width/20) < this.i) {
    if(this.i % (width - width/20) == 0){
      if(this.flg){
        this.flg = false;
      } else {
        this.flg = true;
      }
    }
    if(this.flg){
      this.s -= 1;
    }else{
      this.s += 1;
    }
    println(this.s);
    noFill();
    stroke(this.h, this.s, this.b);
    ellipse(width/2, height/2, this.wid, this.hit);
  }
  this.i += 1;
}
