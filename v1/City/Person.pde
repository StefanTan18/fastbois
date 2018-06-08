class Person {
  //id of person(static??)
  // public final static int id_attrib=0;
  //attributes
  Building address;
  Building work;
  ArrayList<Building> frequentDestinations;
  int income, age, genderCode, prefCode, happiness, raceCode;//instance vars
  int xcor, ycor;

  String profession, name;//some fun stuff we will add later on
  Person() {//generates a new person
    income=0;
    age=0;
    name="Carl";//will be replaced with a name generator
    genderCode=0;
    prefCode=1;
    happiness=100;
    raceCode=0;
    xcor=8000;
    ycor=9000;
  }
  //methods
  void drawPeople() {
    fill(255);
    ellipse(xcor, ycor, 2, 2);
  }
  void setWork(Building wo) {
    work=wo;
    income=wo.offer;
  }
  int getID() {
    return 0;
  }
  void setAddress(Building newAddress) {//sets new house
    address=newAddress;
    int randomGen=(int) random(0, newAddress.getSize());
    int randomY=(int) random(0, newAddress.getSize());
    xcor=newAddress.getxpos()+randomGen;
    ycor=newAddress.getypos()+randomY;
  }
  void moveXRight() {
    this.xcor++;
    this.drawPeople();
  }
  void moveXLeft() {
    this.xcor--;
    this.drawPeople();
  }
  void moveYUp() {
    this.ycor++;
    this.drawPeople();
  }
  void moveYDown() {
    this.ycor--;
    this.drawPeople();
  }

  Road nearestYRoad() {
    Road nearest = new Road(5);
    int min = 1000000;
    for (Building a : structures) {//search for roads
      if (a.getType() == 100) {//if the object is a road
      Road p=(Road) a;
      
        if (p.vertical() && min > (int) dist(a.getxpos(), a.getxpos(), address.getxpos(), address.getypos())) {//searches through each road, and makes sure
          min = (int) dist(a.getxpos(), a.getxpos(), address.getxpos(), address.getypos());
          nearest = (Road) a;
        }
      }
    }
    if (this.xcor != nearest.getxpos()) {
      this.moveXRight();
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

  void wayfinder(Building dest) {
    this.nearestYRoad(); 
     /*whil (this.ycor != dest.getypos()) {
     if (this.ycor < dest.getypos()) {
     this.moveYDown();
     } else {
     this.moveYUp();
     }
     while (abs(this.xcor - dest.getxpos()) > 60) {
     if (this.ycor == nearestXRoad().getypos()) {
     if (this.xcor < dest.getxpos()) {
     this.moveXRight();
     } else {
     this.moveXLeft();
     }
     }
     }
     } */
  }

  /*  boolean wayfind(Building dest) {//find the nearest road, travel on the road via. bus, or car or walking depending on mood
   if(abs(xcor-dest.getxpos())<40 && abs(ycor-dest.getypos())<40) {
   return true;
   }
   for(Building i: structures) {
   if(i.getID()==100) {
   (Road)i.isVertical();
   }
   }
   wayfindHelper(nextRoad);
   }
   boolean wayfindHelper(Road a) {
   if(abs(xcor-dest.getxcor())<60 && abs(ycor-dest.getycor())<40) {
   //we are at the destination
   return true;
   }
   else if(abs(xcor-dest.getxcor())<40) {
   //find nearest y-axis road
   wayfindHelper(a);
   
   }
   } */


boolean go() {//will the person go? We shall see 
     if(time>=800 && time<=1200) {
       return true;
     }
     else {
       return false;
     }
   }
}
