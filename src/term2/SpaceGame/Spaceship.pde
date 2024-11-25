class Spaceship {
  //Member Variable
  int x, y, w, laserCount, turretCount, health, lpower;

  // Constructor
  Spaceship () {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 25000;
    turretCount = 1;
    health = 1;
  }

  // Member Methods
  void display() {

    stroke(#EACEDF);
    fill(#EACEDF);
    quad(x-20, y, x+20, y, x+40, y+80, x-40, y+80);
    stroke(#EACEDF);
    fill(#EACEDF);
    ellipse(x, y+80, 80, 45);

    fill(#8B0707);
    fill(#8B0707);

    fill(21);
    stroke(0);
    fill(200);
    fill(100);

    stroke(0);
    fill(#6A457E);
    ellipse(x, y-20, 60, 45);
    stroke(#6A457E);
    fill(#6A457E);
    ellipse(x, y-10, 90, 40);
    fill(#930C5D);
    ellipse(x, y-18, 65, 30);

    stroke(#EACEDF);
    triangle(x, y, x+20, y+10, x+20, y-10);
    triangle(x, y, x-20, y+10, x-20, y-10);
    fill(#710948);
    circle(x, y, 15);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rocks r) {
    float d = dist(x, y, r.x, r.y);
    if (d < 40) {
      return true;
    } else {
      return false;
    }
  }
}
