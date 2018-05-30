class Road extends Building {
  
  int id;
  int width;//size of road
  int capacity;//number of people that can use this road
  int xcor,ycor;//start point of the road
  Road(int width) {//constructs a road of specified width. Wider==higher capacity
    this.width=width;
  }
  void drawRoad() {//draws a road w/ specified width
    mouseClicked();
  }
  void mouseClicked() {
   draw();
  }
  void draw() {
    mouseMoved();
  }
  void mouseMoved() {
    fill(255);
    xcor=mouseX;
    ycor=mouseY;
    
    rect(xcor,ycor,width,mouseY-ycor);
    }
  
}
