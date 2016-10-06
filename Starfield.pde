
Particle [] nanners;
Stuff[] ren;
float r = 0; //radius
float theta = 0; //angle
float xPos = 100; // x of the object
float yPos = 100; // y of the object


void setup() {
	size(400, 400);
	nanners = new Particle [100];
	for (int n = 0; n < nanners.length; n++)
 		nanners[n] = new NormalParticle();
 	nanners[0] = new JumboParticle();
 	ren = new Stuff[400];
  	for(int n = 0; n < ren.length; n++) {
    	ren[n] = new Stuff(); 
    }
    r = sqrt(xPos*xPos + yPos*yPos); //polar coordinate - distance from x,y to 0,0 on the grid
  	theta = atan(yPos/xPos); // angle to 0,0 on the grid

}

void draw() {
	background(0);
	for (int n = 0; n < nanners.length; n++) {
 		nanners[n].show();
 		nanners[n].move();
	}
	for (int n = 0; n < ren.length; n++) {
 		ren[n].show();
 		ren[n].move();
	}
}

class NormalParticle implements Particle {
	double xPos, yPos, angle, radX, radY;
	NormalParticle() {
		angle = (float)(Math.random()*3*Math.PI); 
     	radX = (float)(Math.random()*10) + 60;  
     	radY = (float)(Math.random()*10) + 60; 
	}
	public void show() {
		noStroke();
		fill((int)(Math.random()*100 + 141), (int)(Math.random()*100 + 120), 24);
		ellipse((float)xPos, (float)yPos, 10, 10);
	}
	public void move() {
		xPos = (float)(Math.cos(angle)*radX) + 200;
   		yPos = (float)(Math.sin(angle)*radY) + 200; 
   		angle += .03; 
	}
}

interface Particle {
	public void show();
	public void move();
}

class JumboParticle implements Particle {
	double xPos, yPos, angle, radX, radY;
	JumboParticle() {
		angle = (float)(Math.random()*4*Math.PI); 
     	radX = (float)(Math.random())+1;  
     	radY = (float)(Math.random())+1; 
	}
	public void show() {
		noStroke();
		fill(5);
		ellipse((float)xPos, (float)yPos, 100, 100);
	}
	public void move() {
		xPos = (float)(Math.cos(angle)*radX) + 200;
   		yPos = (float)(Math.sin(angle)*radY) + 200; 
   		angle += .1; 
	}
}

class Stuff implements Particle { 
	double xPos, yPos, angle, speed, radX, radY;
	int flip;
	Stuff() {
		xPos = width/2;
		yPos = height/2;
		angle = (Math.random()*Math.PI*2);
    	speed = (Math.random()*2) + 1;
    	radX = (float)(Math.random()*20) + 300;  
     	radY = (float)(Math.random()*20) + 300;
     	flip = -1;
	}
	public void show() {
		noStroke();
		fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
		ellipse((float)xPos, (float)yPos, 10, 10);
	}
	public void move() {
		xPos = Math.cos(angle) * radX + 200;
    	yPos = Math.sin(angle) * radY + 200;
    	angle += .015;
    	if(xPos < 0) 
  			flip = -1;
    	float xPos = r * cos(theta) * flip;
  		float yPos = r * sin(theta) * flip;
  		if (r>0){
  			r -= 1; // Decrement the radius
  			theta += 0.01; // Increment the angle
  		}
	}
}

