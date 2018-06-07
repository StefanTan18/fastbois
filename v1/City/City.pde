
//generates city, and GUI Interface
ArrayList<Building> structures=new ArrayList<Building>();

int structureID=0;//this is the Nth structure 
int xcor, ycor;//coordinate tracking system
int buildingType;
PFont f;
PGraphics pg;
PGraphics ab;
boolean menuCond=true;
Building interact;


void setup() {
  size(1024, 768);
  background(0);
  //road setup and spawn algorithm
  genWorld();
  mouseClicked();
  fill(255);
  rect(0, 0, 150, 250);

  f = createFont("Arial", 16, true);
  pg=createGraphics(400, 400);
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
  int consX, consY, rand;
  //ArrayList<Building> temp=new ArrayList<Building>();
  consY=0;//gets y position of most recent road
  consX=200;//gets x pos of most recent road
  for (int q=0; q<structures.size(); q++) {//goes through list of structures
    Building a=structures.get(q);
    consY=0;//gets y position of most recent road
    consX=200;//gets x pos of most recent road
    if (a.getType()==100) {
      Road i=(Road) a;//to access methods in road
      //constructor for x-axis roads
      consX=a.getxpos();

      for (int p=0; p<25; p++) {//constructs 25 buildings
        xcor=consX;
        ycor=consY;
        rand=(int) random(0, 4);
        Building b=new Building(structureID, i.getxpos()-60, consY, rand, 60);//constrcuts new building along x axis road, along upper side
        structureID++;
        if (cityCheck()) {
          structures.add(b);
          b.drawBuilding();
          b.addPeople(40);
        }
        else {
          b.demolishBuilding();
        }
        Building d=new Building(structures.size(), i.getxpos()+i.getWidth(), consY, rand, 60);//constructs building on other side   
        structureID++;
        if (cityCheck()) {
          structures.add(d);
          d.drawBuilding();
          d.addPeople(40);
        }
        else {
          b.demolishBuilding();
        }
        consY+=40;
      }
    }
  }
}
//}
void draw() {
  textFont(f, 16);
  fill(0);
  textAlign(LEFT);
  text("City Simulation", 0, 25);

  textAlign(LEFT);
  text("Add people", 0, 100);
  text("Road", 0, 150);
  text("Residence", 0, 200);
  //pg.beginDraw();
}
void mouseClicked() {//has all the menu instructions
  
  ab=createGraphics(150, 500);
  if( mouseY>300 && mouseX<250 && mouseY<400) {
          println("adding...");
          interact.addPeople(20);
          statMenu(interact);
          
        }
   else if(mouseY>200 && mouseX<250 && mouseY<300) {
     interact.demolishBuilding();
   }
   else {
    for (Building str : structures) {
     if (abs(str.getxpos()-mouseX)<str.getSize() && abs(str.getypos()-mouseY)<str.getSize()) {
        println(str.getpop());//this function allows us to use the menu (which will be on the upper left corner), and get stats, modify the population etc.
        interact=str;
        statMenu(interact);
        
     }
    }
        //mousePressed();
 
          
    
      
    
  }
}
void statMenu(Building str) {
  f = createFont("Arial", 16, true);
        PFont g=createFont("Arial", 40, true);
        ab.beginDraw();
        ab.background(255);
        ab.textFont(f, 16);
        ab.fill(0);
        ab.textAlign(LEFT);
        ab.text("Stats for building"+str.getID(), 0, 16);
        ab.text("remove building", 0, 45);
        ab.text("population"+str.getpop(), 0, 60);
        ab.text("capacity"+str.getCap(), 0, 100);
        ab.text("add people",0,120);
        ab.textFont(g, 40);
        ab.text("Exit editor", 0, 484);
        ab.endDraw();
        image(ab, 0, 250);
        menuCond=false;
   
}
//checks to see if there is something occupying the current space
boolean cityCheck() {
  boolean ret= true;
  for (Building str : structures) {
    //special case for road
    if (str.getType()==100) {
      Road ster=(Road) str;
      //  int word=ster.getWidth();
      //  if (ster.vertical()&&((ster.getxpos()-this.getXPos()>-50 && this.getXPos()>ster.getxpos()) || (ster.getxpos()-this.getXPos()<word && ster.getxpos()>this.getXPos()))) {
      //    //println("fail");
      //    ret=false;
      //  } else if ((ster.getypos()-this.getYPos()>-50 && this.getYPos()>ster.getypos()) || (ster.getypos()-this.getYPos()<word && ster.getypos()>this.getXPos())) {
      //    //println("faily");
      //    ret=false;
      //  }
      //}
      //else if (abs(str.getxpos()-this.getXPos())<str.getSize() && abs(str.getypos()-this.getYPos())<str.getSize()) {//if we are in range of building
      //  println("failb");
      //  ret=false;
      //}
      if (this.getXPos() == ster.getxpos() || this.getYPos() == ster.getypos() || abs(this.getXPos() -ster.getxpos()) <60 || abs(this.getYPos()- ster.getypos()) <60) {
        ret = false;
      }
    }
    if (abs(str.getxpos()-this.getXPos())<str.getSize()+5 && abs(str.getypos()-this.getYPos())<str.getSize()+5) {//if we are in range of building
      println("failb");
      ret=false;
    } else {
      
      ret = true;
    }
  }
  return ret;
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
