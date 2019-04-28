// 問題 7.16 図 5.7(d) に示すような色相が同心円の半径に比例して滑らかに変化している図の彩度が時間とともに変化
// するアニメーションを作成せよ．
private float x = 0;
private float y = 0;
private float h = 0;
private float s = 0;
private float b = 0;
private float i = 0;
private boolean flg = true;

void setup(){
  smooth();
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, (width - width/20));
  frameRate(30);
  b = width;
}

void draw(){
  if(i == (width - width/20)){
    flg = false;
  } else if (i == 0) {
    flg = true;
  }
  noFill();
  stroke(h, width, b);
  //if(0 <= i && i <= (width - width/20)){
  if(flg){
    i+=1;
    h+=1;
    s+=1;
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, i, i);
  } else {
    i-=1;
    h-=1;
    s-=1;
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, i, i);
    stroke((width - width/20) / 2, 0, (width - width/20));
    ellipse(width/2, height/2, i + 1, i + 1);
  }

}
