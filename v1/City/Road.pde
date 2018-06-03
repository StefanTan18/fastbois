class Road extends Building {
  
  int id;
  int width;//size of road
  int capacity;//number of people that can use this road
  int xcor,ycor;//start point of the road
  boolean orientation;//orientation of the road
  //DLList lane;//stores traffic data
  
  Road(int width) {//constructs a road of specified width. Wider==higher capacity
    this.width=width;
  }
  void drawRoad(boolean isVertical, int x, int y) {//draws a road w/ specified width(and also determines if its vertical
  orientation=isVertical;
    if(isVertical) {
      fill(255);
      rect(x,0, width, y+1000);
      xcor=x;
      ycor=y;
    }
    else {
      fill(255);
      rect(150,y,y+1000,width);
      xcor=x;
      ycor=y;
    }
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
    
    rect(xcor,ycor,width,mouseY);
    }
   int getxpos() {
    return xcor;
   }
   int getypos() {
     return ycor;
   }
   int getType() {//tells program its a road
     return 1;
   }
   int getWidth() {
     return width;
   }
   boolean vertical() {
     return orientation;
   }
   int getID() {
     return 100;
   }
  
}
