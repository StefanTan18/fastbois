
//generates city, and GUI Interface
ArrayList<Building> structures=new ArrayList<Building>();
int structureID=0;//this is the Nth structure 
int xcor,ycor;//coordinate tracking system
int buildingType;
PFont f;
PGraphics pg;


void setup() {
  size(1000, 1000);
  background(0);
  //road setup and spawn algorithm
  genWorld();
  mouseClicked();
   fill(255);
   rect(0, 0, 150, 250);
 
  f = createFont("Arial", 16, true);
}
void genWorld() {
  int seedX=(int) random(150,250);
  int seedY= (int) random(150,250);
  int spacing= (int) random(80,160);
  int cons,consY;
  for(int j=0; j<25; j++) {//generates a random grid of roads
    Road newRoad=new Road(5);//make a road of width 5
    newRoad.drawRoad(true,seedX,seedY);//Y axis road
    structures.add(newRoad);
    Road crosstown=new Road(5);//make a road of width 5
    crosstown.drawRoad(false,seedX,seedY);//X axis road
    structures.add(crosstown);
    spacing= (int) random(100,240);
    seedX+=spacing;
    seedY+=spacing;
    
  }//construct roads first
  buildingConstructor();//constructs buildings
  
    
  
    
    
  }

void buildingConstructor() {
  int consX,consY;
  ArrayList<Building> temp=new ArrayList<Building>();
  consY=0;//gets y position of most recent road
  consX=200;//gets x pos of most recent road
for(Building a: structures) {
  consY=0;//gets y position of most recent road
  consX=200;//gets x pos of most recent road
    if(a.getID()==100) {
      //println("road");
      Road i=(Road) a;
      //println("numero");
      //constructor for x-axis roads
      if(!(i.vertical())){
        consY=a.getypos();
        println(consY);
        xcor=consX;
        ycor=consY;
        for(int p=0; p<25; p++) {//constructs 25 buildings
          xcor=consX;
          ycor=consY;
        //println("crosstown");
        Building b=new Building(structureID,consX-40,i.getypos()-40);//constrcuts new building along x axis road, along upper side
        if(cityCheck()) {
          //println("building");
           temp.add(b);
          b.drawBuilding();
        }
        Building d=new Building(structures.size(),consX-40,i.getypos()+i.getWidth());//constructs building on other side   
        if (cityCheck()) {
        temp.add(d);
        d.drawBuilding();
        
        }
        consX+=40;
      }
      }
      //same concept for y axis roads
      /*Building c=new Building(structures.size(), crosstown.getxpos()-40,cons-40);//constrcuts new building along x axis road
      Building e=new Building(structures.size(), crosstown.getxpos()+i.getWidth(),cons-40);
      structures.add(c);
      c.drawBuilding();
      structures.add(e);
      e.drawBuilding();*/
    
    }
}
for(Building james: temp) {
  structures.add(james);
  
}
}

void draw() {
  textFont(f, 16);
  fill(0);
  textAlign(LEFT);
   text("City Simulation", 0, 25);
 
   textAlign(LEFT);
   text("Add people", 0, 100);
   text("Road",0,150);
   text("Residence",0,200);
}
void mouseClicked() {
  if(picker()) {//if we are in the menu area
  
  menu();
  
  //constructor();
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
  boolean ret= true;
  for (Building str : structures) {
    //special case for road
    if(str.getType()==1) {
      Road ster=(Road) str;
      int word=ster.getWidth();
      if(ster.vertical()&&((ster.getxpos()-this.getXPos()>-39 && this.getXPos()>ster.getxpos()) || (ster.getxpos()-this.getXPos()<11 && ster.getxpos()>this.getXPos()))) {
        //println("fail");
        ret=false;
      }
      else if((ster.getypos()-this.getYPos()>-39 && this.getYPos()>ster.getypos()) || (ster.getypos()-this.getYPos()<11 && ster.getypos()>this.getXPos())) {
        //println("faily");
        ret=false;
      }
    }
    else if (abs(str.getxpos()-this.getXPos())<40 && abs(str.getypos()-this.getYPos())<40) {//if we are in range of building
      ret=false;
    }
  }
  return ret;
}
void constructor() {//constructs what needs to be constructed
if(buildingType==1) {
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
  if(mouseX<150 && mouseY<250) {
    return true;
  }
  return false;
}
//allows you to Build new building
void menu() {
 
  if(mouseX<200 && mouseY>75 && mouseY<125) {
    buildingType=1;
    println("pick where to put human");
    textFont(f, 16);
    
    
    fill(0);
    textAlign(LEFT);
    text("fill city", 0, 125);
    
    
  }
  
}