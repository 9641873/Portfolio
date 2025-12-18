// William Watabe | Sept 9 2025 | Graphics Grade Assignment
float grade;
String dispGrade;

void setup() {
  size(400, 100);
  grade = 0.0;
  dispGrade = "";
}
void draw() {
  noCursor();
  background(128);
  text("Grades By William Watabe", width/2, 25);
  line(0, height/2, width, height/2);
  ellipse(mouseX, height/2, 5, 5);
  textAlign(CENTER);
  fill(0);
  text(mouseX/100.0, mouseX, 45);
  calcGrade(mouseX/100.0);
  text("Letter Grade: " + dispGrade, width/2, 75);
  println(grade);
}

void calcGrade(float val) {
  if (val >= 3.51) {
    dispGrade = "Assign letter grade A.";
  } else if (val >= 3.0) {
    dispGrade = "Assign letter grade A-.";
  } else if (val >= 2.84) {
    dispGrade =  "Assign letter grade B+.";
  } else if (val >= 2.67) {
    dispGrade =  "Assign letter grade B.";
  } else if (val >= 2.50) {
    dispGrade =  "Assign letter grade B-.";
  } else if (val >= 2.34) {
    dispGrade =  "Assign letter grade C+.";
  } else if (val >= 2.17) {
    dispGrade =  "Assign letter grade C.";
  } else if (val >= 2.0) {
    dispGrade =  "Assign letter grade C-.";
  } else if (val >= 1.66) {
    dispGrade =  "Assign letter grade D+.";
  } else if (val >= 1.33) {
    dispGrade =  "Assign letter grade D.";
  } else if (val >= 1.00) {
    dispGrade =  "Assign letter grade D-.";
  } else {
    dispGrade =  "Assign letter grade F.";
  }
}
