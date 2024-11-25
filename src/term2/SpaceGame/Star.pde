class Star {
  int x, y, diam, speed;

  Star() {
    x = int(random(width));
    y = -10;
    diam = int(random(1, 3));
    speed = int(random(1, 3));
  }

  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height + 5) {
      return true;
    } else {
      return false;
    }
  }
}
