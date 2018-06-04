class Person {
  //id of person(static??)
 // public final static int id_attrib=0;
  //attributes
  Building address;
  Building work;
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
    ellipse(xcor,ycor,2,2);
  }
  void setAddress(Building newAddress) {//sets new house
    address=newAddress;
    xcor=newAddress.getxpos();
    ycor=newAddress.getypos();
  }
  //void wayfind() 
  //int moveLinear()
}