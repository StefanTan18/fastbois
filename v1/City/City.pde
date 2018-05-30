
//generates city
ArrayList<Building> structures=new ArrayList<Building>();
int structureID=0;//this is the Nth structure 
PFont f;

void setup() {
  size(1000, 1000);
  background(0);
  for (int i = 0; i < 100; i++) {
    Building b = new Building(i, (int) random(50, 600), (int) random(50, 600));
    structures.add(b);
    b.drawBuilding();
  }


  println("welcome to YOUR city");
  println("the canvas is where you can draw things");
  println("right now, as of version 1.0, you can do the following");
  println("1. Add buildings, and populate them with people");
  println("coming up next: modify the size of buildings! modify the type of building");
  println("right now, all text prints to console");
  mouseClicked();
  rect(0, 0, 50, 100);
  f = createFont("Arial", 16, true);
}
void draw() {
  textFont(f, 16);
  fill(255);
  textAlign(CENTER);
  text("Hello World", 50, 50);
}
void mouseClicked() {
  if (cityCheck()) {//if there is nothing on site
    //makes new Building(residential)
    Building newStruc=new Building(structureID, mouseX, mouseY);
    structures.add(newStruc);//adds building

    structures.get(structureID).drawBuilding();
    structureID++;
  } else {
    for (Building str : structures) {
      if (abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {
        //println(str.info());//this function allows us to use the menu (which will be on the upper left corner), and get stats, modify the population etc.
        println("Pop of building at"+str.getxpos()+" is "+str.getpop());
      }
    }
  }
}

boolean cityCheck() {
  for (Building str : structures) {
    if (abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {//if we are in range of building
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