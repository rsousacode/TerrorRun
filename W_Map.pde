class Map {
  Ptmx map;
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> batery;
  ArrayList<HighBattery> batery2;

  StringDict[] collisionMap;
  StringDict[] lowbatteriesPos;
  StringDict[] highbatteriesPos;
  StringDict[] trapsPos;
  StringDict[] GhostsPos;
  int collisionOffset = 10;
  Map(PApplet papplet) {
    map = new Ptmx(papplet, "tr.tmx");
    map.setDrawMode(CORNER); 
    map.setPositionMode("CANVAS");
    collisionMap = map.getObjects(2);
    lowbatteriesPos = map.getObjects(3);
    highbatteriesPos=map.getObjects(4);
    trapsPos=map.getObjects(5);
    GhostsPos=map.getObjects(6);
  }
  void update() {
  }

  void display() {
        map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);

    map.draw(1, camera.position.x - width / 2, camera.position.y - height / 2);
  }


}