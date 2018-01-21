class Map {
  Ptmx map;
  StringDict[] collisionMap;
  StringDict[] lowbatteriesPos;
  StringDict[] highbatteriesPos;
  StringDict[] trapsPos;
  StringDict[] GhostsPos;
  StringDict[] entryLeftObjects;
  StringDict[] entryRightObjects;
  StringDict[] exitLeftObjects;
  StringDict[] exitRightObjects;
  StringDict[] flashlightPos;
  StringDict[] scarygirlPos;
  StringDict[] pack5bulletsPos;
  StringDict[] leftTriggerPos; //Deactivate jump left trigger
  StringDict[] rightTriggerPos; //Deactivate jump left trigger

  Map(PApplet papplet) 
  {
    map = new Ptmx(papplet, "tr.tmx");
    map.setDrawMode(CORNER); 
    map.setPositionMode("CANVAS");
    collisionMap = map.getObjects(2);
    lowbatteriesPos = map.getObjects(3);
    highbatteriesPos=map.getObjects(4);
    trapsPos=map.getObjects(5);
    GhostsPos=map.getObjects(6);
    entryLeftObjects = map.getObjects(7);
    entryRightObjects = map.getObjects(8);
    exitLeftObjects = map.getObjects(9);
    exitRightObjects = map.getObjects(10);
    flashlightPos = map.getObjects(11);
    scarygirlPos= map.getObjects(12);
    pack5bulletsPos = map.getObjects(13);
    leftTriggerPos= map.getObjects(14);
    rightTriggerPos = map.getObjects(15);
    
  }
  void display() 
  {
    map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);
    map.draw(1, camera.position.x - width / 2, camera.position.y - height / 2);
  }

  void update() 
  {
  }
}