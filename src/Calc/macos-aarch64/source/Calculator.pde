// William Watabe | September 25 2025 | Calculator Project
Button[] buttons = new Button[12];
Button[] numButtons = new Button[10];
float l, r, result;
boolean left;
String dVal;
char op;

void setup() {
  size(274, 370);
  background(0);
  left = true;
  l = 0;
  r = 0;
  result = 0;
  dVal = "0";
  op = ' ';
  buttons[0] = new Button(70, 90, 120, 40, 'C', #FF9A15, #F5CCA1);
  buttons[1] = new Button(170, 90, 54, 40, 'π', #FF9A15, #F5CCA1);
  buttons[2] = new Button(38, 140, 54, 40, '²', #FF9A15, #F5CCA1);
  buttons[3] = new Button(104, 140, 54, 40, '√', #FF9A15, #F5CCA1);
  buttons[4] = new Button(170, 140, 54, 40, '^', #FF9A15, #F5CCA1);
  buttons[5] = new Button(236, 90, 54, 40, '+', #FF9A15, #F5CCA1);
  numButtons[7] = new Button(38, 190, 54, 40, '7', #0B157C, #817FBC);
  numButtons[8] = new Button(104, 190, 54, 40, '8', #0B157C, #817FBC);
  numButtons[9] = new Button(170, 190, 54, 40, '9', #0B157C, #817FBC);
  buttons[6] = new Button(236, 140, 54, 40, '-', #FF9A15, #F5CCA1);
  numButtons[4] = new Button(38, 240, 54, 40, '4', #0B157C, #817FBC);
  numButtons[5] = new Button(104, 240, 54, 40, '5', #0B157C, #817FBC);
  numButtons[6] = new Button(170, 240, 54, 40, '6', #0B157C, #817FBC);
  buttons[7] = new Button(236, 190, 54, 40, 'x', #FF9A15, #F5CCA1);
  numButtons[1] = new Button(38, 290, 54, 40, '1', #0B157C, #817FBC);
  numButtons[2] = new Button(104, 290, 54, 40, '2', #0B157C, #817FBC);
  numButtons[3] = new Button(170, 290, 54, 40, '3', #0B157C, #817FBC);
  buttons[8] = new Button(236, 240, 54, 40, '÷', #FF9A15, #F5CCA1);
  numButtons[0] = new Button(38, 340, 54, 40, '0', #0B157C, #817FBC);
  buttons[9] = new Button(104, 340, 54, 40, '.', #0B157C, #817FBC);
  buttons[10] = new Button(170, 340, 54, 40, '±', #FF9A15, #F5CCA1);
  buttons[11] = new Button(236, 315, 54, 90, '=', #FF9A15, #F5CCA1);
}

void draw() {
  background(0);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  //Not Number Buttons
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].over && buttons[i].val == '+') {
      dVal = "0";
      left = false;
      op = '+';
    } else if (buttons[i].over && buttons[i].val == '=') {
      performCalculation();
    } else if (buttons[i].over && buttons[i].val == '.') {
      if (dVal.contains(".") == false) {
        dVal += ".";
      }
    } else if (buttons[i].over && buttons[i].val == '^') {
      dVal = "0";
      left = false;
      op = '^';
    } else if (buttons[i].over && buttons[i].val == '±') {
      if (left) {
        l = l*=-1;
        dVal = str(l);
      } else {
        r*=-1;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '²') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '-') {
      dVal = "0";
      left = false;
      op = '-';
    } else if (buttons[i].over && buttons[i].val == 'x') {
      dVal = "0";
      left = false;
      op = 'x';
    } else if (buttons[i].over && buttons[i].val == '÷') {
      dVal = "0.0";
      left = false;
      op = '÷';
    } else if (buttons[i].over && buttons[i].val == 'C') {
      left = true;
      l = 0;
      r = 0;
      result = 0;
      dVal = "0";
      op = ' ';
    }
  }


  // All Number Buttons
  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<16) {
      if (numButtons[i].over && left) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && !left) {
        if (dVal.equals("0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Op:" + op);
  println("Left:" + left);
}

void updateDisplay() {
  rectMode(CORNER);
  rect(10, 10, 254, 50, 5);
  textSize(36);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length()>13) {
    textSize(30);
  } else if (dVal.length()>16) {
    textSize(20);
  }
  text(dVal, width-20, 45);
}

void performCalculation() {
  if (op == ('+')) {
    result = l + r;
  } else if (op == ('-')) {
    result = l - r;
  } else if (op == ('x')) {
    result = l * r;
  } else if (op == ('÷')) {
    result = l / r;
  } else if (op == ('^')) {
    result = pow(l, r);
  }
  dVal = str(result);
}
