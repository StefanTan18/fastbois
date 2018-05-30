
//generates city, and GUI Interface
ArrayList<Building> structures=new ArrayList<Building>();
int structureID=0;//this is the Nth structure 
int xcor,ycor;//coordinate tracking system
PFont f;

void setup() {
  size(1000, 1000);
  background(0);
  for (int i = 0; i < 100; i++) {
    xcor=(int) random(150,900);
    ycor=(int) random(150,900);
    if(cityCheck()) {
    
    Building b = new Building(i, xcor, ycor);
    structures.add(b);
    b.drawBuilding();
    }
  }

  mouseClicked();
  fill(255);
  rect(0, 0, 150, 250);
 
  f = createFont("Arial", 16, true);
}
void draw() {
  textFont(f, 16);
  fill(0);
  textAlign(LEFT);
  text("City Simulation", 0, 25);
}
void mouseClicked() {
  if(picker()) {//if we are in the menu area
  
  menu();
  }
  else if (cityCheck()) {//if there is nothing on site
    //makes new Building(residential)
    Building newStruc=new Building(structureID, mouseX, mouseY);
    structures.add(newStruc);//adds building

    structures.get(structureID).drawBuilding();
    structureID++;
  } else {//otherwise, display statistics
    for (Building str : structures) {
      if (abs(str.getxpos()-mouseX)<40 && abs(str.getypos()-mouseY)<40) {
        //println(str.info());//this function allows us to use the menu (which will be on the upper left corner), and get stats, modify the population etc.
        println("Pop of building at"+str.getxpos()+" is "+str.getpop());
      }
    }
  }
}
//checks to see if there is something occupying the current space
boolean cityCheck() {
  for (Building str : structures) {
    if (abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {//if we are in range of building
      return false;
    }
  }
  return true;
}
int getXPos() {//gets "address of mouse"
  return xcor;
}
int getYPos() {
  return ycor;
}
//checks to see if in window for picking items
boolean picker() {
  if(mouseX<150 && mouseY<250) {
    return true;
  }
  return false;
}
//allows you to Build new building
void menu() {
  f = createFont("Arial", 16, true);
    textFont(f, 16);
  fill(0);
  textAlign(LEFT);
  text("Buildings", 0, 100);
  text("Road",0,150);
  text("Residence",0,200);
  if(mouseX<200) {
    Building newStruc=new Building(structureID,mouseX, mouseY, 1);
    structures.add(newStruc);//adds building

    structures.get(structureID).drawBuilding();
    structureID++;
  }
}
