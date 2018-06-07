class Building {//generic building, can be typed as something else!
PGraphics pg;//gui representation
  ArrayList<Person> residents=new ArrayList<Person>();//directory of residents
  protected int id;//id of building
  protected int xpos;//location of building
  protected int ypos,size;//location,size of building
  protected int cap;//capacity of building
  protected int typeCode;//type of building(to be used in future)0--Residential, 100--Road, 2--Commercial, 3--park,4--school
  protected String buildingName;//name of building(if its a landmark)
  Building() {
    this.id=0;
  }
  Building(int id) {//initializes a generic building
    this.id=id;
  }
  //temporary cons
  Building(int id, int xcor, int ycor) {
    this.id = id;
    this.xpos = xcor;
    this.ypos= ycor;
    pg=createGraphics(40,40);
  }
  Building(int id, int xcor, int ycor, int typeCode, int size) {
    this(id,xcor,ycor);
    this.typeCode=typeCode;
    this.size=size;
    pg=createGraphics(size,size);
  }
  
  void drawBuilding() {//makes a building
  pg.beginDraw();
  if(typeCode==2) {
    pg.background(0,255,255);
  }
  else if(typeCode==3) {
    
     pg.background(0,128,0);
  }
  else {
    pg.background(255,0,0);
  }
  pg.noFill();
  pg.endDraw();
  image(pg,xpos,ypos);
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
  int getType() {
    return typeCode;
  }
  int getSize() {
    return size;
  }
  void addPeople(int population) {
    if (typeCode ==0){
    for(int i=0; i< population; i++) {
      Person newGuy=new Person();
      residents.add(newGuy);
      newGuy.setAddress(this);
      newGuy.drawPeople();
    }
    }
  }
  void info() {
  }
  void setcap() {//sets capactiy of building
  }
  int getID() {
    return 0;
  }
  void demolishBuilding() {
  }
}
