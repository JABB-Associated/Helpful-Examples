int x;
int y [] = new int [6];
int z [] = new int [6];
StringList starwarstext;

void setup() {

  size(displayWidth, displayHeight, P3D);    
  textSize(60);
  textAlign (CENTER, CENTER);

  x = width/2;

  for (int i=0; i<6; i++) {
    y[i] = 3*height/2 + 70*i;
    z[i] = -5*i;
  }

  starwarstext= new StringList();

  starwarstext.append("The empire had seized control of the galaxy. As");
  starwarstext.append("systems fell, one after the other, the only hope was");
  starwarstext.append("for a hero. You are this hero, not a human, but a Wookiee.");
  starwarstext.append("You must fight back against Darth Bruno and the Empire of"); 
  starwarstext.append("Bruyesia. As you fly your ship through the galaxy, you must defeat ");
  starwarstext.append("your enemies. Good luck, young Wookiee, and May the Force be with you!");
} 

void draw() { 

  background(0);
  
  fill (0, 255, 255);
  text ("A long time ago in a galaxy far, far away....", x, height/6, -50);
  
  rotateX (PI/3);
  pushMatrix();

  fill (255, 255, 0);
  for (int i = 0; i < starwarstext.size (); i++) {
    String mytext=starwarstext.get(i);
    text(mytext, width/2, y[i], z[i]);
    y[i] -= 4;
    z[i] -= 2;
  }

  popMatrix();

}

