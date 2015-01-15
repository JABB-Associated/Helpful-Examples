int x;
int y [] = new int [8];
int z [] = new int [8];
String intro [] = new String [8];

void setup() {
  size(displayWidth, displayHeight, P3D);    
  textSize(50);
  int x = 0;
  for (int i=0; i<intro.length; i++) {
    intro[i] = {"The empire had seized control of the galaxy. As", "systems fell, one after the other, the only hope", "was for a hero. You are this hero, not a human,", "but a Wookiee. You must fight back against", "Darth Bruno and the Empire of Bruyesia.", " ", "As you fly your ship through the galaxy, you must", "defeat your enemies."};
    y[i] = 0;
    z[i] = 0;
  }
} 

void draw() {  
  rotateX (PI/4);

  background(0);
  translate(width/5, height, 0);
  pushMatrix();

  for (int i=0; i<intro.length; i++) {
    text(intro[i], x, y[i], z[i]);
    y[i] -= 3;
    z[i] -= 2;
  }
  popMatrix();
}

