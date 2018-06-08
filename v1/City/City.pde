
//generates city, and GUI Interface
ArrayList<Building> structures=new ArrayList<Building>();
ArrayList<Person> people=new ArrayList<Person>();

int structureID=0;//this is the Nth structure 
int xcor, ycor;//coordinate tracking system
int buildingType;
int time=0;//big time var
PFont f;
PGraphics pg;
PGraphics ab;
boolean menuCond=false;
Building interact;
boolean createMode=false;

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
  textFont(f, 16);
  fill(0);
  textAlign(LEFT);
  text("City Simulation", 0, 25);

  textAlign(LEFT);
  text("Add 250 people", 0, 50);
  //text("Road", 0, 150);
  text("CLICK button first \n then click again \n on map to place",0,75);
  text("Add Residence", 0, 150);
  text("Add Commercial",0,200);
  movePeople();
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
          if(b.getType()==0) {
          b.addPeople(40);
          }
        } else {
          b.demolishBuilding();
        }
        Building d=new Building(structures.size(), i.getxpos()+i.getWidth(), consY, rand, 60);//constructs building on other side   
        structureID++;
        if (cityCheck()) {
          structures.add(d);
          d.drawBuilding();
          if(d.getType()==0) {
          d.addPeople(40);
          }
        } else {
          b.demolishBuilding();
        }
        consY+=40;
      }
    }
  }
}

void draw() {
  movePeople();
  time++;
  if(time>1200) {
    time=0;
  }
  PGraphics stat=createGraphics(1000,50);
  stat.beginDraw();
  stat.fill(255);
  stat.background(255);
  f = createFont("Arial", 16, true);
  
  stat.textFont(f, 16);
  stat.fill(0);
  stat.textAlign(LEFT);
  stat.text("TIME"+time, 0, 25);
  int total=0;
  int income=0;
  int unemployment=0;
  for(Building i: structures) {
    total+=i.getpop();
    for(Person p: i.residents) {
      income+=p.income;
      if(income==0) {
        unemployment+=1;
      }
      
    }
  }
  stat.fill(0);
  stat.text("POP"+total,100,16);
  stat.text("INCOME"+income,200,16);
  stat.text("UNEMPLOYMENT"+(100*((float)unemployment)/total),400,16);
  stat.endDraw();
  image(stat,0,700);

}
void mouseClicked() {//has all the menu instructions
  //clear();
  if(mouseY<50 && mouseX<100) {   }
  
  if(createMode) {
    println("CREATMODE");
    int xcor=mouseX;
    int ycor=mouseY;
    //if(cityCheck()) {
      interact=new Building(0,xcor,ycor,buildingType,60);
      structures.add(interact);
      interact.drawBuilding();
   // }
    
    createMode=false;
  }
  ab=createGraphics(150, 500);
  if(mouseY>125 && mouseX<100 && mouseY<175) {
    createMode=true;
    println("create");
    buildingType=0;
  }
  else if(mouseY>175 && mouseX<100 && mouseY<200) {
    createMode=true;
    println("create");
    buildingType=2;
   
  }
  else if ( mouseY>300 && mouseX<100 && mouseY<400) {
    println("adding...");
    interact.addPeople(20);
    statMenu(interact);//updates stat meny
  } else if (mouseY>200 && mouseX<100 && mouseY<300) {
    interact.demolishBuilding();
    
    /*ab.background(0);
    ab.fill(0);*/
    
  } else if (mouseY >399 && mouseX<100 && mouseY<400) {
    //interact.statsWindow();
    }
    /*lse if(menuCond) {//if the big menu is open!
    println("MENU CLOSED");
    
    interact.pg.clear();
   
    menuCond=false;*/
    
  else {
    for (Building str : structures) {
      if (abs(str.getxpos()-mouseX)<str.getSize() && abs(str.getypos()-mouseY)<str.getSize()) {
        //println(str.getpop());//this function allows us to use the menu (which will be on the upper left corner), and get stats, modify the population etc.
        interact=str;
        statMenu(interact);
        menuCond=true;
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
  ab.text("Stats for building "+str.getID(), 0, 16);
  ab.text("remove building", 0, 45);
  ab.text("building type: "+str.getType(),0,60);
  ab.text("population"+str.getpop(), 0, 75);
  ab.text("capacity"+str.getCap(), 0, 100);
  ab.text("add people", 0, 120);
  ab.text("manage people \n not working",0,140);
  ab.textFont(g, 40);
  ab.text("Exit editor", 0, 484);
  ab.endDraw();
  image(ab, 0, 250);
  //menuCond=false;
}
//checks to see if there is something occupying the current space
boolean cityCheck() {
  boolean ret= true;
  for (Building str : structures) {
    //special case for road
    if (str.getType()==100) {
      Road ster=(Road) str;
      //  int word=ster.getWidth();
      //  if (ster.vertical()&&((ster.getxpos()-this.getxpos()>-50 && this.getxpos()>ster.getxpos()) || (ster.getxpos()-this.getxpos()<word && ster.getxpos()>this.getxpos()))) {
      //    //println("fail");
      //    ret=false;
      //  } else if ((ster.getypos()-this.getypos()>-50 && this.getypos()>ster.getypos()) || (ster.getypos()-this.getypos()<word && ster.getypos()>this.getxpos())) {
      //    //println("faily");
      //    ret=false;
      //  }
      //}
      //else if (abs(str.getxpos()-this.getxpos())<str.getSize() && abs(str.getypos()-this.getypos())<str.getSize()) {//if we are in range of building
      //  println("failb");
      //  ret=false;
      //}
      //if the coordinates of the road are within size of the building-- first lets check the x axis road
      if (!(ster.vertical()) && this.getypos() < ster.getypos() && this.getypos() + 60 > ster.getypos()) {
        return false;
      }
      if (this.getxpos() == ster.getxpos() || this.getypos() == ster.getypos() || abs(this.getxpos() -ster.getxpos()) <60 || abs(this.getypos()- ster.getypos()) <60) {
        ret = false;
      }
    }
    if (abs(str.getxpos()-this.getxpos())<str.getSize()+5 && abs(str.getypos()-this.getypos())<str.getSize()+5) {//if we are in range of building
      println("failb");
      ret=false;
    } else {

      ret = true;
    }
  }
  return ret;
}
int getxpos() {//gets "pg of mouse"
  return xcor;
}
int getypos() {
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

void movePeople() {
  for (Person p : people) {
    if (p.go()) {
      //p.wayfinder(structures.get(((int)random(0, structures.size()))));//goes to a random destination
     // p.drawPeople();//animates them
    }
  }
}
void gridSnap(Building p) {//snaps building to road, still a bit glitchy
  xcor=p.getxpos();
  ycor=p.getypos();
  Road a=nearestXRoad();
  Road b=nearestYRoad();
  if(dist(a.getxpos(), a.getypos(), this.getxpos(), this.getypos())> dist(b.getxpos(), b.getypos(), this.xcor, this.ycor)) {//compare which one its closer to 
      
      
    }
  }
  

 Road nearestYRoad() {
    Road nearest = new Road(5);
    int min = 1000000;
    for (Building a : structures) {//search for roads
      if (a.getType() == 100) {//if the object is a road
      Road p=(Road) a;
      
        if (p.vertical() && min > (int) dist(a.getxpos(), a.getypos(), this.getxpos(), this.getypos())) {//searches through each road, and makes sure
          min = (int) dist(a.getxpos(), a.getypos(), this.getxpos(), this.getypos());
          nearest = (Road) a;
        }
      }
    }
    return nearest;
  }
  Road nearestXRoad() {
    Road nearest = new Road(5);
    int min = 1000000;
    for (Building a : structures) {
      if (a.getType() == 100) {
        if (! ((Road)a).vertical()) {
          if (min > (int) dist(a.getxpos(), a.getypos(), this.xcor, this.ycor)) {
            min = (int) dist(a.getxpos(), a.getypos(), this.xcor, this.ycor);
            nearest = (Road) a;
          }
        }
      }
    }
    return nearest;
  }
