class Laser {
  //Member Variable
  int x, y, w, h, speed, lpower;
  PImage b1;
  
  // Constructor
  Laser(int x, int y, int lpower) {
    this.x = x;
    this.y = y;
    h = 25;
    w = 25;
    speed = 5;
    this.lpower = lpower;
    b1 = loadImage("lalipop2.png"); //(l = b)
  }
  
  // Member Methods
  void display() {
    fill(200);
    rectMode(CENTER);
    b1.resize(w,h);
    image(b1, x, y);
  }
  
  void move() {
    y -= speed;
  }
  
  boolean reachedTop() {
    if(y < -20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rocks r) {
    float d = dist(x, y, r.x, r.y);
    if (d < 30) {
      return true;
    } else {
      return false;
    }
  }
}
