class ReflectionCircle extends MoveCircle {

  ReflectionCircle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float pd){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd);
  }

  public void ctrl(){
    if(super.getVx() == 0 && super.getVy() == 0){
      super.setVx(random(-2, 2));
      super.setVy(random(-2, 2));
      float rx = super.getVx() * super.getSpeedRate();
      float ry = super.getVy() * super.getSpeedRate();
      super.setRx(rx);
      super.setRy(ry);
    }
  }

  public void move(){
    super.move();
  }

  public void draw(){
    super.draw();
  }
}
