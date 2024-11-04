//Tiger Yang | Grading App | 9/13/2024
float grade;

void setup() {
  size(400, 150);
  background(200);
}

void draw() {
  background(200);

  // Tital Info
  textAlign(CENTER);
  fill(00, 50, 76);
  textSize(30);
  text("Grades by Tiger Yang", width/2, 40);

  // Reference Line
  stroke(10, 10, 127);
  strokeWeight(3);
  line(0, 100, width, 100);

  // Tic Marks
  //line(200,105,200,95);
  for (int i=0; i<=width; i+=50) {
    line(i, 95, i, 105);
    textSize(9);
    text((float)i/width*4, i, 95);
  }

  // Marker
  fill(255);
  ellipse(mouseX, 100, 8, 8);
  fill(0, 50, 80);
  textSize(15);
  text((float)mouseX/width*4, mouseX, 90);

  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A", width/2, 135);
  } else if (tgrade >= 3) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade A-", width/2, 135);
  } else if (tgrade >= 2.84) {
    text ("Assign letter grade B+", width/2, 135);
  } else if (tgrade >= 2.67) {
    text ("Assign letter grade B", width/2, 135);
  } else if (tgrade >= 2.50) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade B-", width/2, 135);
  } else if (tgrade >= 2.34) {
    text ("Assign letter grade C+", width/2, 135);
  } else if (tgrade >= 2.17) {
    text ("Assign letter grade C", width/2, 135);
  } else if (tgrade >= 2.00) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade C-", width/2, 135);
  } else if (tgrade >= 1.66) {
    text ("Assign letter grade D+", width/2, 135);
  } else if (tgrade >= 1.33) {
    text ("Assign letter grade D", width/2, 135);
  } else if (tgrade >= 1.00) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("Assign letter grade D-", width/2, 135);
  } else {
    text ("Assign letter grade F", width/2, 135);
  }
}
