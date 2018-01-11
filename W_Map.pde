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
    batery = new ArrayList<LowBattery>();
    batery2 = new ArrayList<HighBattery>();
    enemies = new ArrayList<Enemy>();
    firetraps = new ArrayList <FireTrap>();


    map.setDrawMode(CORNER); 
    map.setPositionMode("CANVAS");
    collisionMap = map.getObjects(2);
    lowbatteriesPos = map.getObjects(3);
    highbatteriesPos=map.getObjects(4);
    trapsPos=map.getObjects(5);
    GhostsPos=map.getObjects(6);
    createObjects();
  }
  void update() {
    updateObjects();
  }

  void display() {
        map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);

    map.draw(1, camera.position.x - width / 2, camera.position.y - height / 2);
    displayObjects();
  }

  void updateObjects()
  {

    ArrayList<LowBattery> buffer = new ArrayList<LowBattery>();
    for (LowBattery obj : batery) {
      obj.update();
      LowBattery bg = obj.collision();
      if (bg != null)
        buffer.add(bg);
    }
    batery.removeAll(buffer);
    ArrayList<HighBattery> buffer2 = new ArrayList<HighBattery>();
    for (HighBattery obj : batery2) {
      obj.update();
      HighBattery bg2 = obj.collision2();
      if (bg2 != null)
        buffer2.add(bg2);
    }
    batery2.removeAll(buffer2);
    for (FireTrap obj : firetraps) {
      obj.update();
    }
    ArrayList<Enemy> buffer4 = new ArrayList<Enemy>();
    for (Enemy obj : enemies) {
      obj.update();
      Enemy en = obj.collision4();
      if (en != null)
        buffer4.add(en);
    }
    enemies.removeAll(buffer4);
  }

  void displayObjects()
  {
    for (LowBattery obj : batery)
      obj.display();
    for (HighBattery obj : batery2)
      obj.display();
    for (FireTrap obj : firetraps)
      obj.display();
    for (Enemy obj : enemies)
      obj.display();
  }

  void createObjects()
  {
    for (StringDict obj : lowbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      LowBattery newBattery = new LowBattery (rect.x, rect.y, ID.LowBattery); 
      batery.add(newBattery);
    }
    for (StringDict obj : highbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      HighBattery newBatery2 = new HighBattery (rect.x, rect.y); 
      batery2.add(newBatery2);
    }
    for (StringDict obj : trapsPos) {
      Rectangle rect = new Rectangle(obj);
      FireTrap newFireTrap = new FireTrap (rect, ID.Traps); 
      firetraps.add(newFireTrap);
    }
    for (StringDict obj : GhostsPos) {
      Rectangle rect = new Rectangle(obj);
      Enemy newEnemy = new Enemy (rect); 
      enemies.add(newEnemy);
    }
  }
  void CheckCollisionTraps()
  {
    float objY=0, objX=0;
    float objHeight=0, objWidth=0;
    for (StringDict obj : trapsPos)
    {
      objX = parseFloat(obj.get("x"));
      objY = parseFloat(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));
      float xi = Math.max (player.position().x-player.image.width/2+collisionOffset, objX);
      float yi = Math.max (player.position().y-player.image.height/2, objY);
      float wi = Math.min ((player.position().x-player.image.width/2-collisionOffset)+ player.image.width, objX + objWidth) - xi;
      float hi = Math.min ((player.position().y-player.image.height/2)+ player.image.height, objY + objHeight) - yi;
      if (wi >= 0 && hi >= 0)
      {
        if (wi > hi)
          hud.setLives(0);
        else
          hud.setLives(0);
      }
    }
  }
}