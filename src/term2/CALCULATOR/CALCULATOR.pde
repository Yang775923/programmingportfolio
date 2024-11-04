//Tiger Y | Calculator | 30 Sept 24
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(180, 280);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;

  //buttons core
  buttons[0] = new Button(50, 210, 70, 30, "0", true);
  buttons[1] = new Button(30, 170, 30, 30, "1", true);
  buttons[2] = new Button(30, 130, 30, 30, "4", true);
  buttons[3] = new Button(30, 90, 30, 30, "7", true);
  buttons[4] = new Button(30, 55, 30, 20, "+", false);
  buttons[5] = new Button(70, 170, 30, 30, "2", true);
  buttons[6] = new Button(70, 130, 30, 30, "5", true);
  buttons[7] = new Button(70, 90, 30, 30, "8", true);
  buttons[8] = new Button(70, 55, 30, 20, "-", false);
  buttons[9] = new Button(110, 170, 30, 30, "3", true);
  buttons[10] = new Button(110, 130, 30, 30, "6", true);
  buttons[11] = new Button(110, 90, 30, 30, "9", true);
  buttons[12] = new Button(110, 55, 30, 20, "x", false);
  buttons[13] = new Button(150, 170, 30, 30, "x²", false);
  buttons[14] = new Button(150, 130, 30, 30, "^", false);
  buttons[15] = new Button(150, 90, 30, 30, "=", false);
  buttons[16] = new Button(150, 55, 30, 20, "/", false);
  buttons[17] = new Button(150, 210, 30, 30, "C", false);
  buttons[18] = new Button(110, 210, 30, 30, ".", false);
  buttons[19] = new Button(30, 250, 30, 30, "√", false);
  buttons[20] = new Button(70, 250, 30, 30, "π", false);
  buttons[21] = new Button(110, 250, 30, 30, "e", false);
  buttons[22] = new Button(150, 250, 30, 30, "±", false);
}

void draw() {
  background(234, 204, 250);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + "L:" + left);
}

void updateDisplay() {
  fill(255);
  rectMode(CENTER);
  stroke(137, 14, 81);
  rect(width/2, 25, 160, 20);
  fill(0);
  if (dVal.length()<21) {
    textSize(15);
  } else if (dVal.length() > 20) {
    textSize(13);
  } else if (dVal.length() == 21) {
    textSize(13);
  } else if (dVal.length() == 22) {
    textSize(13);
  } else if (dVal.length() == 23) {
    textSize(13);
  } else if (dVal.length() == 24) {
    textSize(11);
  } else if (dVal.length() == 25) {
    textSize(11);
  } else if (dVal.length() > 26) {
    textSize(9);
  }

  textAlign(RIGHT);
  text(dVal, width-15, 30);
}

void mousePressed() {
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + "L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      if (dVal == "0") {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      if (dVal == "0") {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      handleEvent("c", false);
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      handleEvent(".", false);
      if (!dVal.contains(".")) {
        dVal +=buttons[i].val;
      }
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("^")) {
      op = '^';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("/")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left == false) {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left == false) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("e")) {
      handleEvent("e", false);
    } else if (buttons[i].on && buttons[i].val.equals("x²")) {
      handleEvent("s", false);
    }
  }
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = nf(result);
  l = result;
  r = 0;
  left = true;
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '/' || keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if (key == '-' || keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '+' || keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '*' || keyCode == 56 || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '=' || keyCode == 10 || keyCode == 61) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (key == 'c' || keyCode == 67 || keyCode == 12) {
    handleEvent("c", false);
  } else if (key == 's' || keyCode == 83) {
    handleEvent("s", false);
  } else if (key == 'e' || keyCode == 69) {
    handleEvent("e", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<23 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<23 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("*") && !isNum) {
    left = false;
    dVal = "0";
    op = 'x';
  } else if (keyVal.equals("/") && !isNum) {
    left = false;
    dVal = "0";
    op = '/';
  } else if (keyVal.equals("c") && !isNum) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
    left = true;
  } else if (keyVal.equals(".") && !isNum) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("s") && !isNum) {
    if (left) {
      l = l*l;
      dVal = nf(l);
    } else if (left == false) {
      r = r*r;
      dVal = nf(r);
    } else if (keyVal.equals("e") && !isNum) {
      if (left) {
        l = exp(1);
        dVal = str(l);
      } else if (left == false) {
        r = exp(1);
        dVal = str(r);
      }
    }
  }
}
