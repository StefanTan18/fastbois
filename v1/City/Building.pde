class Building {
  int id;
  Building(int id) {
    this.id=id;
  }
  Building(int id, int type) {
  }
  void drawBuilding() {
    fill(245,14,45);
  rect(mouseX,mouseY,40,40);
  }
}
