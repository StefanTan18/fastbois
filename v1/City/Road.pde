//each LLNode represents 10 pixels, and an LLNode can be inserted by this class
class Road extends Building {
  int time;
  ArrayList<Road> p;//represents each "lane" of the road
  int id;
  int width;//size of road
  int capacity;//number of people that can use this road
  int xcor, ycor;//start point of the road
  boolean orientation;//orientation of the road
  boolean go;//whether or not the queue is moving forward(there is a STOP gate, preventing traffic from moving forward in the queue
  int num_intersections;//returns the number of times that the Queue has to "break"
  LLNode<Transportation> currently_occupied;//stores traffic data
  //Queue lane;//stores cars, moves them up
  Road(int width) {//constructs a road of specified width. Wider==higher capacity
    this.width=width;
    capacity=width;//governs capacity of road(per 10 pixels)
    //lane=new Queue(capacity);
    
    
  }
  void drawRoad(boolean isVertical, int x, int y) {//draws a road w/ specified width(and also determines if its vertical
    orientation=isVertical;
    if (isVertical) {
      fill(255);
      rect(x, 0, width, y+1000);
      xcor=x;
      ycor=y;
    } else {
      fill(255);
      rect(150, y, y+1000, width);
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

    rect(xcor, ycor, width, mouseY);
  }
  ArrayList<Road> getIntersections() {//gets a list of intersections
    ArrayList<Road> p=new ArrayList<Road>();
    for(Building i: structures) {
      if(i.getType()==100) {
        Road intersect=(Road) i;
        if(!(intersect.vertical() && this.vertical())) {
         p.add(intersect);
          
        }
       else if(!(this.vertical()) && intersect.vertical()) {
         p.add(intersect);
        }
      }
    }
    return p;
  }
  int getxpos() {
    return xcor;
  }
  int getypos() {
    return ycor;
  }
  int getType() {//tells program its a road
    return 100;
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
  int trafficLevel() {//returns how "full" each lane is
    return 0;
  }/*
  //adds to our modified queue!
  boolean add(Transportation p) {
    if (!(lane.enqueue(p))) {
      return false;
    }
    return true;
    
    
  }
  void subtract(Transportation p) {//dictates whether cars can proceed
    if(!(p.status) || time%50>25) {
      go=false;
      time+=10;
    }
    else {
      go=true;
      time+=10;
    }
  }
  int allocateLane() {
    return 1;
  }*/
}
