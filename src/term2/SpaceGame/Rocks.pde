class Rocks {
  int x, y, diam, speed;
  PImage r1;

  Rocks() {
    x = int(random(width));
    y = -100;
    diam = int(random(50, 70));
    speed = int(random(2, 7));
    r1 = loadImage("lalipop4.png");
  }

  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 100) {
      return true;
    } else {
      return false;
    }
  }
}
