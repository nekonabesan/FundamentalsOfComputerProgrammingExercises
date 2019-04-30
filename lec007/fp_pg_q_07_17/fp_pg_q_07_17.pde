// 問題 7.17 図 5.7(d) に示すような色相が同心円の半径に比例して滑らかに変化している図の色相が時間とともに変化
// するアニメーションを作成せよ．
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

void setup(){
  smooth();
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, (width - width/20));
  frameRate(30);
  b = (width - width/20);
}

void draw(){
  if(i <= (width - width/20)){
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, i, i);
    h+=1;
    s+=1;
    wid+=1;
    hit+=1;
  } else if ((width - width/20) < i) {
    if(j == 0){
      if(flg){
        flg = false;
      } else {
        flg = true;
      }
    }
    if(flg){
      println(h);
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
  i++;
}
