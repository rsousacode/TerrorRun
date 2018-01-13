class Map {
  Ptmx map;
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> batery;
  ArrayList<HighBattery> batery2;
  ArrayList<Rectangle> exitsLeft;
  ArrayList<Rectangle> exitsRight;
  ArrayList<Rectangle> entriesLeft;
  ArrayList<Rectangle> entriesRight;
  int[] casas = new int[40000]; 
  int playerIsAt =0;

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
    StringDict[] exitLeftObjects = map.getObjects(9);
    StringDict[] exitRightObjects = map.getObjects(10);
    StringDict[] entryLeftObjects = map.getObjects(7);
    StringDict[] entryRightObjects = map.getObjects(8);
    exitsLeft = new ArrayList <Rectangle>();
    exitsRight = new ArrayList <Rectangle>();
    entriesRight = new ArrayList<Rectangle>();
    entriesLeft = new ArrayList<Rectangle>();

    for (StringDict exitLeftObject : exitLeftObjects)
      exitsLeft.add(new Rectangle(exitLeftObject));
    for (StringDict exitRightObject : exitRightObjects)
      exitsRight.add(new Rectangle(exitRightObject));
    for (StringDict entryLeftObject : entryLeftObjects)
      entriesLeft.add(new Rectangle(entryLeftObject));
    for (StringDict entryRightObject : entryRightObjects)
      entriesRight.add(new Rectangle(entryRightObject));

    for (int i = 0; i < casas.length; i++) {
      float r = random(1, 3);
      casas[0]=0;
      //if (i == 0)
      //r=0;

      casas[i] = (int)r;
    }
  }
  void update() {


    for (Rectangle obj : exitsRight) {

      Rectangle rec = obj.collision();

      if (rec != null) 
      {
        playerIsAt++;

        player.setPositionTo(entriesRight.get(casas[playerIsAt]).x-16, entriesRight.get(casas[playerIsAt]).y+exitsLeft.get(0).h/2);
                camera.mpfmftr();

      }
    }

    for (Rectangle obj : entriesLeft) {

      Rectangle rec = obj.collision();
      if (rec != null) {
        playerIsAt--;

        player.setPositionTo(exitsLeft.get(casas[playerIsAt]).x+64, exitsLeft.get(casas[playerIsAt]).y+exitsLeft.get(0).h/2);
                camera.mpfmftl();

      }
    }
  }

  void display() {
    map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);

    map.draw(1, camera.position.x - width / 2, camera.position.y - height / 2);
  }
}