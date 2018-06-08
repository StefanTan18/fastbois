class Building {//generic building, can be typed as something else!
PGraphics pg;//gui representation
  ArrayList<Person> residents=new ArrayList<Person>();//directory of residents
  protected int id;//id of building
  protected int xpos;//location of building
  protected int ypos,size;//location,size of building
  protected int cap;//capacity of building
  protected int typeCode;//type of building(to be used in future)0--Residential, 100--Road, 2--Commercial, 3--park,4--school
  protected String buildingName;//name of building(if its a landmark)
  int offer;//what a commercial building can offer to its clients
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
    if(typeCode==1 || (typeCode>3 && typeCode!=100)) {
    this.typeCode=0;
    }
    else if(typeCode==2) {
      this.typeCode=2;
      offer=(int)(random(0,30000));
    }
    else {
      this.typeCode=typeCode;
    }
    this.size=size;
    pg=createGraphics(size,size);
    cap=300;
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
  int getCap() {
    return cap;
  }
  void setxpos(int p) {
    xpos=p;
  }
  void setypos(int q) {
   ypos=q;
  }
  void addPeople(int population) {
    if (typeCode ==0 && population+this.getpop()<300){
    for(int i=0; i< population; i++) {
      Person newGuy=new Person();
      residents.add(newGuy);
      people.add(newGuy);
      
      newGuy.setAddress(this);
      newGuy.drawPeople();
    }
    }
    if(typeCode==2 && population+this.getpop()<300) {//diff procedure if its a commercial
      for(Building i: structures) {//goes through list of buildings
      println("going through building");
      if(residents.size()>300) {
        break;
      }
        for(Person j: i.residents) {//goes through list of people for each building
          println("going through residents");
          if(j.income<offer) {
            
            println("YAY");
            residents.add(j);
            j.setWork(this);//sets workplace to new workplace!
          }
        }
    }
  }
  }
 
  void statsWindow() {
    
    pg=createGraphics(300,300);
    pg.beginDraw();
    pg.stroke(255);
    pg.rect(0,0,300,300);
  pg.textFont(f, 16);
  pg.fill(0);
  pg.textAlign(LEFT);
  pg.text("Stats for building "+this.getID(), 0, 16);
  pg.text("remove building", 0, 45);
  pg.text("building type: "+this.getType(),0,60);
  pg.text("population"+this.getpop(), 0, 75);
  pg.text("capacity"+this.getCap(), 0, 100);
  pg.text("manage people",0,140);
  int format=156;
  int formatx=0;//for formatting list of ppl
  for(Person i:residents) {
    if(format>284) {
      formatx+=75;
      format=156;
    }
    pg.text(i.name+" "+i.getID()+" "+i.income,formatx,format);
    format+=16;
  }
  pg.text("CLICK OUTSIDE TO CLOSE WINDOW",0,300);
  pg.endDraw();
  image(pg, 300, 300);
  }
  void setcap() {//sets capactiy of building
  }
  int getID() {
    return id;
  }
  void demolishBuilding() {
    pg.beginDraw();
    pg.clear();
    pg.endDraw();
    //println("building demolished");
  }
}    
