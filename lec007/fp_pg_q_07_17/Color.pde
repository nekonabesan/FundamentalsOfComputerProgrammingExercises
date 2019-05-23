class Color {
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private float wid = 0;
  private float hit = 0;

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
  public void setWid(float wid){
    this.wid = wid;
  }
  public float getWid(){
    return this.wid;
  }
  public void setHit(float hit){
    this.hit = hit;
  }
  public float getHit(){
    return this.hit;
  }

  Color(float h, float s, float b, float wid, float hit){
    this.h = h;
    this.s = s;
    this.b = b;
    this.wid = wid;
    this.hit = hit;
  }
}
