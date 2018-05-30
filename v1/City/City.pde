class City {
//generates city
ArrayList<Buildings> structures;
int structureID=0;//this is the Nth structure 
void setup() {
  size(1000,1000);
  background(0);
  println("welcome to YOUR city");
  println("the canvas is where you can draw things");
  println("right now, as of version 1.0, you can do the following");
  println("1. Add buildings, and populate them with people");
  println("coming up next: modify the size of buildings! modify the type of building");
  mouseClicked();
  
}
void draw() {
 
}
void mouseClicked() {
  //makes new Building(residential)
  structures.add(Buildings(structureID));//adds building
  structures.get(structureID).drawBuilding();
  
}
}
