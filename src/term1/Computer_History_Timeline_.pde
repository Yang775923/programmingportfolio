// Tiger Yang | Timeline Project | 28 Aug 24

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  textSize(13);
  histEvent(150, 200, "IBM", "1940 | Arthur H. Dickenson | United States", true);
  histEvent(200, 300, "Colossus", "1943-44 | Tommy flowers | London", false);
  histEvent(300, 200, "ENIAC", "1945 | John Maushly and Jay presper  | England, London, Cadby hall", true);
  histEvent(375, 300, "LEO 1", "1947 | J. Lyons and Co. | United States", false);
  histEvent(450, 200, "EDSAC", "1949 | Maurice Wilkes | built at the Mathematical Laboratory at the University of Cambridge in Cambridge, England.", true);
  histEvent(550, 300, "Harwell CADET", "1955 | the team at the Harwell Laboratory, AKA the UK Atomic Energy Authority Harwell | Harwell, Oxfordshire, England", false);
  histEvent(625, 200, "Ferranti Mercury", "1957 | Ferranti Ltd. | Ferranti Ltd's facilities in Manchester, England", true);
  histEvent(700, 300, "IBM 1620", "1960 | William S. 'Bill' H. D. Buckley and co. | IBM's facilities in Poughkeepsie, New York, USA.", false);
}

void drawRef() {
  strokeWeight(3);
  stroke(0);
  line(100, 250, 800, 250);
  textSize(18);
  text("1940", 90, 260);
  text("1960", 810, 260);

  textSize(35);
  textAlign(CENTER, CENTER);
  fill(50);
  text("Historic Computer System", width/2, 60);
  textSize(25);
  text("By Tiger Yang", width/2, 85);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  rectMode(CENTER);
  fill(220);
  rect(x, y, 100, 20);
  fill(0);
  text(title, x, y);
  if (mouseX>x-50 && mouseX<x+50 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
