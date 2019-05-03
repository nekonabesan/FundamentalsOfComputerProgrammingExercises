// 問題 10.8 等速直線運動および回転をしながら壁で反射する 100 個の★を描画するアニメーションを nPlygon クラス
// を継承したクラスを用いて作成せよ．ただし，★どうしの衝突は考慮しなくてもよい．★の大きさ，移動速度，回転速
// 度，初期位置，色は全てランダムに与えよ．
private nStar[] nst = new nStar[100];
private float[] rta = new float[100];
private float i = 0;

public void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  float x = width/2;
  float y = height/2;
  float vx = random(-2, 2);
  float vy = random(-2, 2);
  float r = 0;
  float g = 0;
  float b = 255;
  float d = 50;
  float cc = 50;
  float rotate = PI/2;
  float ic = cc * 1/2 * 0.77;
  for (int i = 0; i < 100; i++){
    x = width/2;
    y = height/2;
    vx = random(-2, 2);
    vy = random(-2, 2);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    d = random(10, 30);
    cc = d;
    rotate = PI/2;
    ic = cc * 1/2 * 0.75;
    this.nst[i] = new nStar(x, y, vx, vy, r, g, b, width, height, d, cc, 5, rotate, 0.75);
    this.nst[i].setInscribedCircle(ic);
    this.nst[i].setup();
    this.rta[i] = random(0, 360);
  }
}

public void draw() {
  background(255, 255, 255);
  //translate(width/2, height/2);
  for (int i = 0; i < 100; i++){
    this.nst[i].rotation(this.rta[i] + PI/2);
    this.nst[i].draw();
    this.nst[i].move();
    this.rta[i]+=0.05;
    if(this.rta[i] == 360){
      this.rta[i] = 0;
    }
  }
}
