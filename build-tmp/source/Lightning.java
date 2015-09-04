import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lightning extends PApplet {

//now that i realize it i couldve just done 4 directions >.>
int xRange = 20;//for up and down
int yRange = 10;

int xRange2 = 10;//for left and right
int yRange2 = 20;

int xRange3 = 10;//for diagonals
int yRange3 = 30;
int minusAmt = 10;

String dir;

LightningBolt[] bolts = new LightningBolt[8];

int counter = 0;//to make sparks at intervals


 /* chart for directions
  1 2 3
  8   4
  7 6 5
 */

public void setup() {
  size(800, 650);
  fill(0,0,0);
  background(0, 0, 0);
  noCursor();
  // for (int i=0; i<bolts.length; i++) {
  //   bolts[i] = new LightningBolt();
  // }
}

public void draw() {
}

public void mouseMoved() {
 background(0, 0, 0);
 counter++;
  if (counter > 1) {
    for (int i=0; i<bolts.length; i++) {
      // stroke(200+(int)(Math.random()*55),255-(int)(Math.random()*55),0);
      stroke(200,255,0,100+(int)(Math.random()*100));
      bolts[i] = new LightningBolt(mouseX, mouseY, i);
      bolts[i].show();
      counter = 0;
    }
  }
}

class LightningBolt {
  int startX;
  int startY;
  int endX;
  int endY;
  int dir;

  LightningBolt() {
  }

  LightningBolt(int tempStartX, int tempStartY, int tempDir) {
    startX = tempStartX;
    startY = tempStartY;
    endX = tempStartX;
    endY = tempStartY;
    dir = tempDir;
  }

  public void show() {
    if (dir == 6) {
      while (endY < height) {
        endX = startX + (int)(Math.random()*xRange) - xRange/2;
        endY = startY + (int)(Math.random()*yRange);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 2) {
      while (endY > 0) {
        endX = startX + (int)(Math.random()*xRange) - xRange/2;
        endY = startY + (int)(Math.random()*-yRange);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 8) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange2);
        endY = startY + (int)(Math.random()*yRange2) - yRange2/2;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 4) {
      while (endX > 0) {
        endX = startX + (int)(Math.random()*-xRange2);
        endY = startY + (int)(Math.random()*yRange2) - yRange2/2;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 1) {
      while (endX > 0) { // i cant put "endX > 0 || endY < 0" probably bc u can only have 1 condition in a while loop
        endX = startX + (int)(Math.random()*-xRange3);
        endY = startY + (int)(Math.random()*-yRange3) + minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 3) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange3);
        endY = startY + (int)(Math.random()*-yRange3) + minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 7) {
      while (endX < width) {
        endX = startX + (int)(Math.random()*xRange3);
        endY = startY + (int)(Math.random()*yRange3) - minusAmt;
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
      }
    } else if (dir == 5) {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lightning" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
