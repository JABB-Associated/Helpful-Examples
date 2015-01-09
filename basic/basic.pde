
ArrayList <Eship> eships= new ArrayList<Eship>();
int fc=0;
void setup(){
size(displayWidth, displayHeight, P3D);  
noStroke();
}
void draw(){
  background(255);

  if(frameCount-fc>10){
  eships.add(new Eship());
fc=frameCount;}
for(int i=eships.size()-1; i>1; i--){
Eship myship=eships.get(i);
myship.make();
if(myship.loc.z>=height/(2*tan(PI/6))){
eships.remove(myship);}
}
 
}




