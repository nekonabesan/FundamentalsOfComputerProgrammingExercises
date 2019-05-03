class Character extends Ball{
  private boolean flgH = true;
  private boolean flgS = true;
  private boolean flgB = true;
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private int length = 0;

  public void setX(float x){
    super.setX(x);
  }
  public float getX(){
    return super.getX();
  }
  public void setY(float y){
    super.setY(y);
  }
  public float getY(){
    return super.getY();
  }
  public void setFlgH(boolean flg){
    this.flgH = flg;
  }
  public boolean getFlgH(){
    return this.flgH;
  }
  public void setFlgS(boolean flg){
    this.flgS = flg;
  }
  public boolean getFlgS(){
    return this.flgS;
  }
  public void setFlgB(boolean flg){
    this.flgB = flg;
  }
  public boolean getFlgB(){
    return this.flgB;
  }
  public void setH(float h){
    this.h = h;
  }
  public float getH(){
    return this.h;
  }
  public void setS(float s){
    this.s = s;
  }
  public float getS(){
    return this.s;
  }
  public void setB(float b){
    this.b = b;
  }
  public float getB(){
    return this.b;
  }

  Character(int length, float x, float y, float h, float s, float b){
    this.length = length;
    super.setX(x);
    super.setY(y);
    this.h = h;
    this.s = s;
    this.b = b;
  }

  public void setup(float vx, float vy, float w, float h, float d){
    super.setVx(vx);
    super.setVy(vy);
    super.setW(w);
    super.setH(h);
    super.setD(d);
    //super.setRx(super.getVx() * random(4, 10));
    //super.setRy(super.getVy() * random(4, 10));
    //super.setup();
    super.setMinX(-w/2 + d);
    super.setMaxX(w/2 - d);
    super.setMinY(-h/2 + d);
    super.setMaxY(h/2);
    super.setRx(0);
    super.setRy(super.getVy() * 2);
  }

  public void rotateColorH(){
    if(this.flgH){
      this.h += 0.1;
    } else {
      this.h -= 0.1;
    }
    if(this.length - 1 <= this.h){
      flgH = false;
    }
    if(this.h <= 0){
      flgH = true;
    }
  }

  public void rotateColorS(){
    if(this.flgS){
      this.s += 0.1;
    } else {
      this.s -= 0.1;
    }
    if(this.length - 1 <= this.s){
      flgS = false;
    }
    if(this.s <= 0){
      flgS = true;
    }
  }

  public void rotateColorB(){
    if(this.flgB){
      this.b += 0.1;
    } else {
      this.b -= 0.1;
    }
    if(this.length - 1 <= this.b){
      flgB = false;
    }
    if(this.b <= 0){
      flgB = true;
    }
  }

  public void move(){
    super.move();
  }
}
