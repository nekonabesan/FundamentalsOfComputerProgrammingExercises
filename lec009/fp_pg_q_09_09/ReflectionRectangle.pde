class ReflectionRectangle extends MoveRectangle {
  ReflectionRectangle (float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float prw, float prh){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, prw, prh);
  }

  public void move(){
    super.move();
  }

  public void draw(){
    super.draw();
  }
}
