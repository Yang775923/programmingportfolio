class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    w = 30;
    h = 30;
    c1 = color(137, 14, 81);
    c2 = color(103, 18, 92);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    stroke(255);
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(15);
    fill(255);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
