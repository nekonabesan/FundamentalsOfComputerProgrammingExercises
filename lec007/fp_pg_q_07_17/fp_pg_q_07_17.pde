// 問題 7.17 図 5.7(d) に示すような色相が同心円の半径に比例して滑らかに変化している図の色相が時間とともに変化
// するアニメーションを作成せよ．
private float r = 475;
private float x = 0;
private float y = 0;
private float h = 0;
private float s = 0;
private float b = 0;
private float i = 1;
private float j = 0;
private float wid = 0;
private float hit = 0;
private boolean flg = true;
private Color[] cl = new Color[int(this.r) + 1];

void setup(){
  smooth();
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, (width - width/20));
  frameRate(30);
  this.b = (width - width/20);
  this.s = width;
}


void draw(){
  if(this.i <= this.r){
    this.cl[int(i)] = new Color(this.h, this.s, this.b, this.wid, this.hit);
    noFill();
    stroke(this.cl[int(i)].getH(), this.cl[int(i)].getS(), this.cl[int(i)].getB());
    ellipse(width/2, height/2, this.i, this.i);
    this.h+=1;
    this.s+=1;
    this.wid+=1;
    this.hit+=1;
  } else if (this.r < this.i) {
    if(j == 0){
      if(flg){
        flg = false;
      } else {
        flg = true;
      }
    }
    if(flg){
      h+=1;
      s+=1;
      b+=1;
    }else{
      h-=1;
      s-=1;
      b-=1;
    }
    noFill();
    stroke(h, s, b);
    ellipse(width/2, height/2, wid, hit);
    if((width - width/20) < j){
      j = 0;
    } else {
      j++;
    }
  }
  this.i += 1;
}
