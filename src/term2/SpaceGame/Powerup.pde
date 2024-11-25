class Powerup {
  int x, y, diam, speed;
  //PImage p1;
  char type;

  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(80, 120));
    speed = int(random(2, 7));
    //p1 = loadImage("lalipop5.png");
    int rand = int(random(4));
    if (rand == 0) {
      type = 't';
    } else if (rand == 1) {
      type = 'a';
    } else if (rand == 2) {
      type = 's';
    } else if (rand == 3) {
      type = 'k';
    }
  }

  void display() {
    if (type == 't') {
      fill(0, 255, 0);
    } else if (type == 'a') {
      fill(255, 0, 0);
    } else if (type == 's') {
      fill(0, 0, 255);
    } else if (type == 'k') {
      fill(255);
    }
    imageMode(CENTER);
    ellipse(x, y, diam, speed);
    //p1.resize(diam, diam);
    //image(p1, x, y);
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

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
