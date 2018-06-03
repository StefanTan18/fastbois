class Person {
  //id of person(static??)
  public final static int id_attrib=0;
  //attributes
  
  
  int income, age, address,genderCode, prefCode, happiness, raceCode;//instance vars
  String profession, name;//some fun stuff we will add later on
  Person() {//generates a new person
    income=0;
    age=0;
    name="Carl";//will be replaced with a name generator
    genderCode=0;
    prefCode=1;
    happiness=100;
    raceCode=0;
  }
  //methods
  void setAddress(Building newAddress) {//sets new house
    address=newAddress.getxpos();
  }
  //void wayfind() 
  //int moveLinear()
}
