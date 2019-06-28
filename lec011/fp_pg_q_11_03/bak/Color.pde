class Color {
  private boolean flgH = true;
  private boolean flgS = true;
  private boolean flgB = true;
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private int length = 0;

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

  Color(int length, float h, float s, float b){
    this.length = length;
    this.h = h;
    this.s = s;
    this.b = b;
  }

  public void rotateColor(){
    //
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
    //
    /*if(this.flgS){
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
    //
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
    }*/
  }
}
