int xRange = 20;//for up and down
int yRange = 10;

int xRange2 = 10;//for left and right
int yRange2 = 20;

int xRange3 = 10;//for diagonals
int yRange3 = 30;
int minusAmt = 10;

String dir;

LightningBolt bob1;
LightningBolt bob2;
LightningBolt bob3;
LightningBolt bob4;

LightningBolt bob5;
LightningBolt bob6;
LightningBolt bob7;
LightningBolt bob8;

LightningBolt bob9;
LightningBolt bob10;
LightningBolt bob11;
LightningBolt bob12;

LightningBolt[] bolts = new LightningBolt[8];

/* chart for diagonals
 1#2
 ###
 4#3
 */

void setup() {
  size(500, 500);
  fill(0,0,0);
  background(0, 0, 0);
  noCursor();
  for (int i=0; i<bolts.length; i++) {
    bolts[i] = new LightningBolt();
  }
}

void draw() {
}

void mouseMoved() {
 background(0, 0, 0);

 // startX = mouseX;
 // startY = 0;
 // endX = startX;
 // endY = 0;
 stroke(200+(int)(Math.random()*55),255-(int)(Math.random()*55),0);
 // bob1 = new LightningBolt(mouseX, mouseY, "left");
 // bob1.show();
 // bob2 = new LightningBolt(mouseX, mouseY, "right");
 // bob2.show();

 // bob3 = new LightningBolt(mouseX, mouseY, "up");
 // bob3.show();
 // bob4 = new LightningBolt(mouseX, mouseY, "down");
 // bob4.show();

 // bob5 = new LightningBolt(mouseX, mouseY, "diagonal1");
 // bob5.show();
 // bob6 = new LightningBolt(mouseX, mouseY, "diagonal2");
 // bob6.show();

 // bob7 = new LightningBolt(mouseX, mouseY, "diagonal3");
 // bob7.show();
 // bob8 = new LightningBolt(mouseX, mouseY, "diagonal4");
 // bob8.show();

 for (int i=0; i<bolts.length; i++) {
    
    if (i == 0) {
      dir = "up";
    } else if (i == 1) {
      dir = "down";
    } else if (i == 2) {
      dir = "left";
    } else if (i == 3) {
      dir = "right";
    } else if (i == 4) {
      dir = "diagonal1";
    } else if (i == 5) {
      dir = "diagonal2";
    } else if (i == 6) {
      dir = "diagonal3";
    } else if (i == 7) {
      dir = "diagonal4";
    }

    bolts[i] = new LightningBolt(mouseX, mouseY, dir);
  }

 // bob9 = new LightningBolt(mouseX, mouseY, "diagonal1");
 // bob9.show();
 // bob10 = new LightningBolt(mouseX, mouseY, "diagonal2");
 // bob10.show();

 // bob11 = new LightningBolt(mouseX, mouseY, "diagonal3");
 // bob11.show();
 // bob12 = new LightningBolt(mouseX, mouseY, "diagonal4");
 // bob12.show();
}

// void mouseClicked() {
//   background(255, 255, 255);
//   // startX = mouseX;
//   // startY = 0;
//   // endX = startX;
//   // endY = 0;
//   bob1 = new LightningBolt(mouseX, mouseY, "left");
//   bob1.show();
//   bob2 = new LightningBolt(mouseX, mouseY, "right");
//   bob2.show();

//   bob3 = new LightningBolt(mouseX, mouseY, "up");
//   bob3.show();
//   bob4 = new LightningBolt(mouseX, mouseY, "down");
//   bob4.show();

//   bob5 = new LightningBolt(mouseX, mouseY, "diagonal1");
//   bob5.show();
//   bob6 = new LightningBolt(mouseX, mouseY, "diagonal2");
//   bob6.show();

//   bob7 = new LightningBolt(mouseX, mouseY, "diagonal3");
//   bob7.show();
//   bob8 = new LightningBolt(mouseX, mouseY, "diagonal4");
//   bob8.show();

//  bob9 = new LightningBolt(mouseX, mouseY, "diagonal1");
//  bob9.show();
//  bob10 = new LightningBolt(mouseX, mouseY, "diagonal2");
//  bob10.show();

//  bob11 = new LightningBolt(mouseX, mouseY, "diagonal3");
//  bob11.show();
//  bob12 = new LightningBolt(mouseX, mouseY, "diagonal4");
//  bob12.show();
//}

class LightningBolt {
  int startX;
  int startY;
  int endX;
  int endY;
  String dir;

  LightningBolt() {
  }

  LightningBolt(int tempStartX, int tempStartY, String tempDir) {
    startX = tempStartX;
    startY = tempStartY;
    endX = tempStartX;
    endY = tempStartY;
    dir = tempDir;
  }

  void show() {
    if (dir.equals("down")) {
      while (endY < height) {
        endX = startX + (int)(Math.random()*xRange) - xRange/2;
        endY = startY + (int)(Math.random()*yRange);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("up")) {
      while (endY > 0) {
        endX = startX + (int)(Math.random()*xRange) - xRange/2;
        endY = startY + (int)(Math.random()*-yRange);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("left")) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange2);
        endY = startY + (int)(Math.random()*yRange2) - yRange2/2;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("right")) {
      while (endX > 0) {
        endX = startX + (int)(Math.random()*-xRange2);
        endY = startY + (int)(Math.random()*yRange2) - yRange2/2;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("diagonal1")) {
      while (endX > 0) { // i cant put "endX > 0 || endY < 0" probably bc u can only have 1 condition in a while loop
        endX = startX + (int)(Math.random()*-xRange3);
        endY = startY + (int)(Math.random()*-yRange3) + minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("diagonal2")) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange3);
        endY = startY + (int)(Math.random()*-yRange3) + minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("diagonal3")) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange3);
        endY = startY + (int)(Math.random()*yRange3) - minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir.equals("diagonal4")) {
      while (endX > 0) {
        endX = startX + (int)(Math.random()*-xRange3);
        endY = startY + (int)(Math.random()*yRange3) - minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    }
  }
}
