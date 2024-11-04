// Tiger | Etch A Sketch | 18 Sept 2024
int x, y;
PImage e1;

void setup() {
  size(800, 658);
  background(200);
  x = width/2;
  y = height/2;
  e1 = loadImage("Etch.png");
}

void draw() {
  //background(200);
  image(e1, 0, 0);
  strokeWeight(15);
  point(x, y);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y-=5;
    } else if (key == 's' || key == 'S') {
      y+=5;
    } else if (key == 'a' || key == 'A') {
      x-=5;
    } else if (key == 'd' || key == 'D') {
      x+=5;
    }
  }
}

void keyPressed () {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 1;
    } else if (keyCode == DOWN) {
      y = y + 1;
    } else if (keyCode == LEFT) {
      x--;
    } else if (keyCode == RIGHT) {
      x++;
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
