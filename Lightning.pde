int xRange = 20;//for up and down
int yRange = 10;

int xRange2 = 10;//for left and right
int yRange2 = 20;

int xRange3 = 5;
int yRange3 = 10;

LightningBolt bob1;
LightningBolt bob2;
LightningBolt bob3;
LightningBolt bob4;

LightningBolt bob5;
LightningBolt bob6;
LightningBolt bob7;
LightningBolt bob8;


void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
}

void mouseMoved() {
  System.out.println(frameCount);
  background(255, 255, 255);
  // startX = mouseX;
  // startY = 0;
  // endX = startX;
  // endY = 0;
  bob1 = new LightningBolt(mouseX, mouseY, "left");
  bob1.show();
  bob2 = new LightningBolt(mouseX, mouseY, "right");
  bob2.show();
  
  bob3 = new LightningBolt(mouseX, mouseY, "up");
  bob3.show();
  bob4 = new LightningBolt(mouseX, mouseY, "down");
  bob4.show();
  
  bob5 = new LightningBolt(mouseX, mouseY, "left");
  bob5.show();
  bob6 = new LightningBolt(mouseX, mouseY, "right");
  bob6.show();
  
  bob7 = new LightningBolt(mouseX, mouseY, "up");
  bob7.show();
  bob8 = new LightningBolt(mouseX, mouseY, "down");
  bob8.show();
}

class LightningBolt {
  int startX;
  int startY;
  int endX;
  int endY;
  String dir;

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
    } else if (dir.equals("diagonal")) {
      while (endX < width || endY < height) {
        endX = startX + (int)(Math.random()*xRange);
        endY = startY + (int)(Math.random()*yRange);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    }
  }
}
