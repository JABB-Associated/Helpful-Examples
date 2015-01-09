ArrayList <Laser> lasers= new ArrayList<Laser>();
ArrayList <Eship> eships= new ArrayList<Eship>();
int fc=0;
int fc1=0;
Crosshairs ch= new Crosshairs();
void setup() {
  size(displayWidth, displayHeight, P3D);  
  noStroke();
}
void draw() {
  background(0);
  if (keyPressed) {
    if (key=='o' && frameCount-fc1>20) {
      lasers.add(new Laser(1));
      lasers.add(new Laser(2));
      lasers.add(new Laser(3));
      lasers.add(new Laser(4));
      fc1=frameCount;
    }
  }
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
  for ( int i=lasers.size ()-1; i>1; i--) {
    Laser mylase=lasers.get(i);
    mylase.make();
  }
}



