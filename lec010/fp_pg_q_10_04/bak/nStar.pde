class nStar extends nPolygon {
  private float InscribedCircle = 0;

  nStar(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protatete, float prate){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd,
      pCircumscribedCircle, pp, protatete, prate);
  }

  public void drawStar() {
    float cnt = super.getP() * 2;
    float radius = 0;
    float rotate = super.getRotate();
    float x = super.getX();
    float y = super.getY();
    // http://www.d-improvement.jp/learning/processing/2011-a/08.html
    pushMatrix();
    //translate(x, y);
    rotate(rotate);
    beginShape();
    for (int i = 1; i <= cnt; i++) {
      if (i % 2 == 0) {
        radius = this.InscribedCircle;
      } else {
        radius = super.getCircumscribedCircle();
      }
      vertex(radius * cos(radians(360 * i/cnt)), radius * sin(radians(360 * i/cnt)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  public void draw(float pInscribedCircle){
    InscribedCircle = pInscribedCircle;
    noStroke();
    fill(super.getR(), super.getG(), super.getB());
    this.drawStar();
  }

  public void move(){
    super.move();
  }

  public void rotation(float protate){
    super.setRotate(protate);
  }
}
