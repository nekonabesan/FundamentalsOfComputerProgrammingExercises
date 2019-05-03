// 問題 10.9 等速直線運動および回転をしながら壁で反射する 50 個の n 角形と 50 個の n 頂点の★を描画するプログラ
// ムを nPlygon クラスを継承したクラスを用いて作成せよ．ただし，オブジェクトどうしの衝突は考慮しなくてもよい．
// オブジェクトのの大きさ，移動速度，回転速度，初期位置，色は全てランダムに与えよ．
private nStar[] nst = new nStar[50];
private nPolygon[] npg = new nPolygon[50];
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
  for (int i = 0; i < 50; i++){
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
    this.npg[i] = new nPolygon(x, y, vx, vy, r, g, b, width, height, d, cc, 5, rotate, 0.75);
    this.npg[i].setup();
    this.rta[i] = random(0, 360);
    this.rta[i + 50] = random(0, 360);
  }
}

public void draw() {
  background(255, 255, 255);
  for (int i = 0; i < 50; i++){
    this.nst[i].rotation(this.rta[i] + PI/2);
    this.nst[i].draw();
    this.nst[i].move();
    this.npg[i].rotation(this.rta[i + 50] + PI/2);
    this.npg[i].draw(5);
    this.npg[i].move();
    this.rta[i]+=0.05;
    this.rta[i + 50]+=0.05;
    if(this.rta[i] == 360){
      this.rta[i] = 0;
    }
    if(this.rta[i + 50] == 360){
      this.rta[i + 50] = 0;
    }
  }
}
