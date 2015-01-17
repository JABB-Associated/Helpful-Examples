//int x;
int y [] = new int [9];
int z [] = new int [9];
//String intro [] = new String [8];
StringList starwarstext;
void setup() {
  size(displayWidth, displayHeight, P3D);    
  textSize(50);
 // int x = 0;
  for (int i=0; i<9; i++) {
//    intro[i] = {"The empire had seized control of the galaxy. As", "systems fell, one after the other, the only hope", "was for a hero. You are this hero, not a human,", "but a Wookiee. You must fight back against", "Darth Bruno and the Empire of Bruyesia.", " ", "As you fly your ship through the galaxy, you must", "defeat your enemies."};
    y[i] = -30*(9-i);
   z[i] = 20*(9-i);
 }
    starwarstext= new StringList();

   starwarstext.append("The empire had seized control of the galaxy. As");
   starwarstext.append("systems fell, one after the other, the only hope");
  starwarstext.append( "was for a hero. You are this hero, not a human,");
 starwarstext.append( "but a Wookiee. You must fight back against");
starwarstext.append( "Darth Bruno and the Empire of Bruyesia."); 
starwarstext.append("As you fly your ship through the galaxy, you must");
starwarstext.append("defeat your enemies.");
starwarstext.append("Good luck, young Wookiee,");
starwarstext.append("and may the Force be with you!");
} 

void draw() {  
  rotateX (PI/4);

  background(0);
  translate(width/5, height, 0);
  pushMatrix();

//  for (int i=0; i<intro.length; i++) {
//    text(intro[i], x, y[i], z[i]);
//    y[i] -= 3;
//    z[i] -= 2;
//  }
for(int i=0; i<starwarstext.size()-1; i++){
String mytext=starwarstext.get(i);
text(mytext, 0, y[i], z[i]);
y[i]-=3;
z[i]-=2;}
  popMatrix();
}

