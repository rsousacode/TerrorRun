class Map {
  Ptmx map;
  StringDict[] collisionMap;
  StringDict[] lowbatteriesPos;
  StringDict[] highbatteriesPos;
  StringDict[] flashlightPos;
  StringDict[] scarygirlPos;
  StringDict[] ghostbulletsPos;
  StringDict[] trapsPos;
  StringDict[] GhostsPos;
  StringDict[] exitLeftObjects;
  StringDict[] exitRightObjects;
  StringDict[] entryLeftObjects;
  StringDict[] entryRightObjects;

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
    exitLeftObjects = map.getObjects(9);
    exitRightObjects = map.getObjects(10);
    entryLeftObjects = map.getObjects(7);
    entryRightObjects = map.getObjects(8);
    flashlightPos = map.getObjects(11);
    scarygirlPos= map.getObjects(12);
    ghostbulletsPos = map.getObjects(13);
  }
  void update() {
    
    
  }



  void display() {
    map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);
    map.draw(1, camera.position.x - width / 2, camera.position.y - height / 2);
  }
}