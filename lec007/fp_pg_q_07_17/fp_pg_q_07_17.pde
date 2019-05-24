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
private float max = 0;

void setup(){
  smooth();
  size(500, 500);
  colorMode(HSB, (width - width/20));
  background(0, 0, (width - width/20));
  frameRate(30);
  this.b = width - (width/20);
  this.s = width;
  this.max = width - (width/20);
}


void draw(){
  if(this.i <= this.r){
    this.cl[int(i) - 1] = new Color(this.h, this.s, this.b, this.wid, this.hit, this.i,this.max);
    noFill();
    stroke(this.cl[int(i) - 1].getH(), this.cl[int(i) - 1].getS(), this.cl[int(i) - 1].getB());
    ellipse(width/2, height/2, this.i, this.i);
    this.h+=1;
    this.s+=1;
    this.wid+=1;
    this.hit+=1;
  } else if (this.r < this.i) {
    background(0, 0, (width - width/20));
    for (int k = 0; k < width - width/20; k++) {
      noFill();
      stroke(this.cl[k].getH(), this.cl[k].getS(), this.cl[k].getB());
      ellipse(width/2, height/2, this.cl[k].getWid(), this.cl[k].getHit());

      if(this.max <= this.cl[k].getCnt()){
        this.cl[k].setFlg(false);
      } else if(this.cl[k].getCnt() <= 0) {
        this.cl[k].setFlg(true);
      }
      if(this.cl[k].getFlg() == true){
        this.cl[k].setH(this.cl[k].getH() + 1);
        //this.cl[k].setS(this.cl[k].getS() + 1);
        //this.cl[k].setS(this.cl[k].getB() + 1);
        this.cl[k].setCnt(this.cl[k].getCnt() + 1);
      } else {
        this.cl[k].setH(this.cl[k].getH() - 1);
        //this.cl[k].setS(this.cl[k].getS() - 1);
        //this.cl[k].setS(this.cl[k].getB() - 1);
        this.cl[k].setCnt(this.cl[k].getCnt() - 1);
      }
    }
  }
  this.i += 1;
}
