class Building {//defaults as residential housing, in future updates will add different types(sub classes)
  ArrayList<Person> residents=new ArrayList<Person>();//directory of residents
  int id;//id of building
  int xpos;//location of building
  int ypos;//location of building
  int cap;//capacity of building
  int typeCode;//type of building(to be used in future)
  String buildingName;//name of building(if its a landmark)
  Building(int id) {//initializes a generic building
    this.id=id;
  }
  //temporary cons
  Building(int id, int xcor, int ycor) {
    this.id = id;
    this.xpos = xcor;
    this.ypos= ycor;
  }
  
  void drawBuilding() {//makes a building
    fill(245,14,45);
  rect(xpos,ypos,40,40);
  }
  int getxpos() {//returns "address" of place
    return xpos;
  }
  int getypos() {
    return ypos;
  }
  int getpop() {//gets number of residents
    return residents.size();
  }
  void info() {
  }
  void setcap() {//sets capactiy of building
  }
}