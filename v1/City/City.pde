
//generates city, and GUI Interface
ArrayList<Building> structures=new ArrayList<Building>();

int structureID=0;//this is the Nth structure 
int xcor, ycor;//coordinate tracking system
int buildingType;
PFont f;
PGraphics pg;


void setup() {
  size(1024, 768);
  background(0);
  //road setup and spawn algorithm
  genWorld();
  mouseClicked();
  fill(255);
  rect(0, 0, 150, 250);

  f = createFont("Arial", 16, true);
  pg=createGraphics(400,400);
}
void genWorld() {
  int seedX=(int) random(150, 250);
  int seedY= (int) random(150, 250);
  int spacing= (int) random(80, 160);
  int cons, consY;
  for (int j=0; j<25; j++) {//generates a random grid of roads
    Road newRoad=new Road(5);//make a road of width 5
    newRoad.drawRoad(true, seedX, seedY);//Y axis road
    structures.add(newRoad);
    Road crosstown=new Road(5);//make a road of width 5
    crosstown.drawRoad(false, seedX, seedY);//X axis road
    structures.add(crosstown);
    spacing= (int) random(100, 240);
    seedX+=spacing;
    seedY+=spacing;
  }//construct roads first
  buildingConstructor();//constructs buildings
}

void buildingConstructor() {
  int consX, consY,rand;
  ArrayList<Building> temp=new ArrayList<Building>();
  consY=0;//gets y position of most recent road
  consX=200;//gets x pos of most recent road
  for (int q=0; q<structures.size(); q++) {//goes through list of structures
    Building a=structures.get(q);
    consY=0;//gets y position of most recent road
    consX=200;//gets x pos of most recent road
    if (a.getID()==100) {
      Road i=(Road) a;//to access methods in road
      //constructor for x-axis roads
      if (!(i.vertical())) {
        consY=a.getypos();
        for (int p=0; p<25; p++) {//constructs 25 buildings
        rand=(int) random(0,5);
          Building b=new Building(structureID, consX, i.getypos()-40,rand,40);//constrcuts new building along x axis road, along upper side
          xcor=consX;
          ycor=consY;
          if (cityCheck()) {//if nothing is occupying, then...
            structureID++;
            structures.add(b);
            b.drawBuilding();//constcut building
              b.addPeople(40);
            
          }
          Building d=new Building(structureID, consX, i.getypos()+i.getWidth(),rand,40);//constructs building on other side   
          if (cityCheck()) {
            structureID++;
            structures.add(d);
            d.drawBuilding();
              d.addPeople(40);
          }
          consX+=40;
        }
      }
      else {//constrcuting for y axis road
       consX=a.getxpos();
        
        for (int p=0; p<25; p++) {//constructs 25 buildings
          xcor=consX;
          ycor=consY;
          rand=(int) random(0,5);
          Building b=new Building(structureID, i.getxpos()-60, consY,rand,60);//constrcuts new building along x axis road, along upper side
          if (cityCheck()) {
            structures.add(b);
            b.drawBuilding();
              b.addPeople(40);
          }
          Building d=new Building(structures.size(),i.getxpos()+i.getWidth(), consY,rand,60);//constructs building on other side   
          if (cityCheck()) {
            structures.add(d);
            d.drawBuilding();
              d.addPeople(40);
          }
          consY+=40;
        }
      }
    }
  }
}

void draw() {
  textFont(f, 16);
  fill(0);
  textAlign(LEFT);
  text("City Simulation", 0, 25);

  textAlign(LEFT);
  text("Add people", 0, 100);
  text("Road", 0, 150);
  text("Residence", 0, 200);
   pg.beginDraw();
}
void mouseClicked() {
  if (picker()) {//if we are in the menu area

    menu();

    //constructor();
  } else if (cityCheck()) {//if there is nothing on site
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
  boolean ret= true;
  for (Building str : structures) {
    //special case for road
    if (str.getType()==100) {
      Road ster=(Road) str;
      int word=ster.getWidth();
      if (ster.vertical()&&((ster.getxpos()-this.getXPos()>-39 && this.getXPos()>ster.getxpos()) || (ster.getxpos()-this.getXPos()<word && ster.getxpos()>this.getXPos()))) {
        //println("fail");
        ret=false;
      } else if ((ster.getypos()-this.getYPos()>-39 && this.getYPos()>ster.getypos()) || (ster.getypos()-this.getYPos()<word && ster.getypos()>this.getXPos())) {
        //println("faily");
        ret=false;
      }
    }
    else if (abs(str.getxpos()-this.getXPos())<str.getSize() && abs(str.getypos()-this.getYPos())<str.getSize()) {//if we are in range of building
      println("failb");
      ret=false;
    }
  }
  return ret;
}
void constructor() {//constructs what needs to be constructed
  if (buildingType==1) {
    Road newStruc=new Road(10);
    structures.add(newStruc);//adds building
    //newStruc.drawRoad();
    structureID++;
  }
}
int getXPos() {//gets "address of mouse"
  return xcor;
}
int getYPos() {
  return ycor;
}
//checks to see if in window for picking items
boolean picker() {
  if (mouseX<150 && mouseY<250) {
    return true;
  }
  return false;
}
//allows you to Build new building
void menu() {

  if (mouseX<200 && mouseY>75 && mouseY<125) {
    buildingType=1;
    println("pick where to put human");
    textFont(f, 16);


    fill(0);
    textAlign(LEFT);
    text("fill city", 0, 125);
  }
}
