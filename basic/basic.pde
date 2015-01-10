ArrayList <Laser> lasers= new ArrayList<Laser>();
ArrayList <Eship> eships= new ArrayList<Eship>();
int fc=0;
int fc1=-20;
Crosshairs ch= new Crosshairs();
void setup() {
  size(displayWidth, displayHeight, P3D);  
  noStroke();
}
void draw() {
  background(0);

  if (frameCount-fc>10) {
    eships.add(new Eship());
    fc=frameCount;
  }
  for (int i=eships.size ()-1; i>1; i--) {
    Eship myship=eships.get(i);
    myship.make();
    if (myship.loc.z>=height/(2*tan(PI/6))) {
      eships.remove(myship);
    }
  }
  ch.make();
  
  for ( int j=lasers.size()-1; j>1; j--) {
    Laser mylase=lasers.get(j);
    mylase.make();
    if(frameCount-mylase.create>360){
    lasers.remove(mylase);}
  }
}


void keyPressed(){
  
 if (keyPressed) {
    if (key=='o' && frameCount-fc1>20) {
      lasers.add(new Laser(1));
      lasers.add(new Laser(2));
      lasers.add(new Laser(3));
      lasers.add(new Laser(4));
      fc1=frameCount;
    }
  }
}
