void setup()
int startX = 150;
int startY = 0;
int endX = 150;
int endY = 0;
LightningBolt bob;

void setup() {
  size(300,300);
}

void draw() {
	// while(endY < height) {

	// 	endX = startX + (int)(Math.random()*18) - 9;
	// 	endY = startY + (int)(Math.random()*9);

	// 	line(startX,startY,endX,endY);
	// 	startX = endX;
	// 	startY = endY;
	// }
	// for (; endY<height; endX=startX+(int)(Math.random()*18)-9, endY=startY+(int)(Math.random()*9)) {
	// 	line(startX,startY,endX,endY);
	// 	startX = endX;
	// 	startY = endY;
	// }

}

void mousePressed() {
	background(255,255,255);
	// startX = mouseX;
	// startY = 0;
	// endX = startX;
	// endY = 0;
	bob = new LightningBolt(mouseX);
	bob.show();
}

class LightningBolt {
	int startX;
	int startY;
	int endX;
	int endY;

	LightningBolt(int tempStartX) {
		startX = tempStartX;
		startY = 0;
		endX = tempStartX;
		endY = 0;
	}

	void show() {
		while(endY < height) {
			endX = startX + (int)(Math.random()*18) - 9;
			endY = startY + (int)(Math.random()*9);
	
			line(startX,startY,endX,endY);
			startX = endX;
			startY = endY;
		}	
	}
}
