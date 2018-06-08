class Person {
  //id of person(static??)
 // public final static int id_attrib=0;
  //attributes
  Building address;
  Building work;
  ArrayList<Building> frequentDestinations;
  int income, age,genderCode, prefCode, happiness, raceCode;//instance vars
  int xcor,ycor;
  
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
    fill(0);
    ellipse(xcor,ycor,2,2);
  }
  void setAddress(Building newAddress) {//sets new house
    address=newAddress;
    int randomGen=(int) random(0,newAddress.getSize());
    int randomY=(int) random(0,newAddress.getSize());
    xcor=newAddress.getxpos()+randomGen;
    ycor=newAddress.getypos()+randomY;
  }
  void moveXRight(){
  xcor++;
  }
  void moveXLeft(){
  xcor--;
  }
  void moveYUp(){
  ycor++;
  }
  void moveYDown(){
  ycor--;
  }
  
  Road nearestYRoad(){
  Road nearest;
  int min = 1000000;
  for(Building a: structures){
   if (a.getType() == 100){
     if (min > (int) dist(a.getxpos(), a.getxpos(), address.getxpos(), address.getypos())){
       min = (int) dist(a.getxpos(), a.getxpos(), address.getxpos(), address.getypos());
       nearest = a;
       }
       }
       }
       while(this.xcor != nearest.getXPos()){
       this.moveXRight();
       this.drawPeople();
       }
       return nearest; 
      }
       
 Road nearestXRoad(){
   Road nearest;
   int min = 1000000;
   for(Building a: structures){
   if (a.getType() == 100 && !a.vertical()){
     if (min > (int) dist(a.getXPos(), a.getYPos(), this.xpos, this.ypos)){
       min = (int) dist(a.getXPos(), a.getYPos(), this.xpos, this.ypos);
       nearest = a;
       }
       }
       }
       return nearest;
       }
  
  boolean wayfinder(Building dest){
  this.nearestYRoad(); 
  while(this.ycor != dest.getYPos()){
  if (this.ycor < dest.getYPos()){
          this.moveYDown(); 
       }
  else {
  this.moveYUp(); }
  while(abs(this.xcor - dest.getXPos()) > 60){
  if (this.ycor == nearestXRoad().getYPos()){
      if (this.xcor < dest.getXPos()){
          this.moveXRight(); }
      else{
          this.moveXLeft(); }
          }
          } 
  }
  return true;
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


}
