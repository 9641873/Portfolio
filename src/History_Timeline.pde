//William Watabe|Aug 28 2025|Computer Timeline

void setup() {
  size(900, 400);
  background(128);
}

//draw runs 30 fps loop
void draw() {
  background(128);
  drawRef();
  textSize(12);
  fill(255);
  histEvent(125, 150, "1936: Turing", true, "Turing machines are mathematical models of compuation describing an abrstact machine which manipulates symbols on a strip of tape according to a table of rules made in 1936 by Alan Turing. It is an idealised model of a CPU and it was made to prove properties of of computations. It could also perform the tasks of any other machines. It was made in England");
  histEvent(225, 250, "1940: Z2", false, "The Z2 was an electromechanical and digital computer made by Konrad Zuse in 1940. It could read 64 words from punch cards and had control logic with 600 electrical relay circuits. It was made in his parent's home in Germany. ");
  histEvent(325, 150, "1941: Z3", true, "The Z3 was an advacnement of the Z2 also made by Konrad Zuse in 1941. It was the first working programmable, and fully automatic digitasl computer. It was made to solve wing flutter problems. This was made in Germany also.");

  histEvent(425, 250, "1944:Mark 1", false, "The Harvard Mark 1 was created in 1944 by John von Neumann for the purpose of determining whether the atomic bomb would be a viable option. It was made in New York.");
  histEvent(525, 150, "1945:ENIAC", true, "The ENIAC was the first general-purpose digital computer made in 1945 by John Mauchly and J. Presper Eckert to caculate artillery firing tables and was made in Pennsylvania, USA.");
  histEvent(625, 250, "1948:SSEM", false, "The Manchester Baby or the Small-Scale Experimental Machine was the first electronic stored-program computer. It was built in the University of Manchester by Frederic C. Williams, Tom Kilburn, and Geoff Tootill, and was designed to be a testbed for the Williams tube and was made in England.");
  histEvent(725, 150, "1949: EDSAC", true, "The EDSAC was the second electronic digital stored-program computer, after the Manchester Mark 1 created by Maurice Wilkes and his team at the University of Cambridge for the purpose of developing a commercially applied computer and was made in England.");
  histEvent(825, 250, "1962:Atlas", false, "The Atlas was one of the world's first supercomputers made by the University of Manchester, Ferranti, and Plessy, to try and catch up to the US's fast computers and it was made in England.");
}

void drawRef() {
  //Draw the Title
  textAlign(CENTER);
  textSize(30);
  fill(255, 255, 0);
  text("Historic Computer Systems", width/2, 35);
  textSize(20);
  text("by William Watabe", width/2, 60);

  //Draw Timeline
  strokeWeight(4);
  line(50, 200, 850, 200);
  strokeWeight(2);
  line(50, 190, 50, 210);
  text("1936", 50, 185);
  line(850, 190, 850, 210);
  text("2010", 850, 185);
}

void histEvent(int x, int y, String title, boolean top, String detail) {
  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-15  && mouseY<y+15) {
    text(detail, width/2, 350, 500, 100);
  }


  if (top == true) {
    line(x, y, x, y+50);
  } else {
    line(x, y, x, y-50);
  }
  rectMode(CENTER);
  fill(#1E4EAD);
  strokeWeight(2);
  rect(x, y, 80, 30, 7);
  fill(255);
  text(title, x, y+5);
}
