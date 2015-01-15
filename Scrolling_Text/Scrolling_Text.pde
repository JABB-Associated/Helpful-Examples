int x, y, z;

void setup() {
  size(displayWidth, displayHeight, P3D);    
  textSize(50);
  int x = 0;
  int y = 0;
  int z = 0;
} 

void draw() {  

  y -= 3;
  z -= 2;
  rotateX (PI/4);

  background(0);
  translate(width/6, height, 0);
  pushMatrix();
  text("The empire had seized control of the galaxy.\nAll hope had been lost.\n Our last hope was a wookiee pilot.", x, y, z);
  popMatrix();
}

