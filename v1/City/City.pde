
//generates city
ArrayList<Building> structures=new ArrayList<Building>();
int structureID=0;//this is the Nth structure 

void setup() {
  size(1000,1000);
  background(0);
  
  println("welcome to YOUR city");
  println("the canvas is where you can draw things");
  println("right now, as of version 1.0, you can do the following");
  println("1. Add buildings, and populate them with people");
  println("coming up next: modify the size of buildings! modify the type of building");
  println("right now, all text prints to console");
  mouseClicked();
  rect(0,0,50,100);
  
}
void draw() {

}
void mouseClicked() {
  if(cityCheck()) {//if there is nothing on site
  //makes new Building(residential)
  Building newStruc=new Building(structureID,structureID);
  structures.add(newStruc);//adds building
  
  structures.get(structureID).drawBuilding();
  structureID++;
  }
  else {
    for(Building str: structures) {
      if(abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {
        //println(str.info());//this function allows us to use the menu (which will be on the upper left corner), and get stats, modify the population etc.
        println("Pop of building at"+str.getxpos()+" is "+str.getpop());
      }
    }
    
  }
  
}

boolean cityCheck() {
  for(Building str: structures) {
      if(abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {//if we are in range of building
        return false;
      }
  }
  return true;
}
int getXPos() {//gets "address of mouse"
  return mouseX;
}
int getYPos() {
  return mouseY;
}
