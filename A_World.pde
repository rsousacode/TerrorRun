class World {
  Ptmx map;
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> batery;
  ArrayList<HighBatery> batery2;
  StringDict[] exitSpawnPos;
  StringDict[] backSpawnPos;
  StringDict[] collisionMap;
  StringDict[] bateriesPos;
  StringDict[] bluebateriesPos;
  StringDict[] trapPos;
  StringDict[] enemiesPos;
  int collisionOffset = 10;
  World(PApplet papplet) {
    map = new Ptmx(papplet, "map0.tmx");
    batery = new ArrayList<LowBattery>();
    batery2 = new ArrayList<HighBatery>();
    enemies = new ArrayList<Enemy>();
    firetraps = new ArrayList <FireTrap>();
    map.setDrawMode(CORNER); 
    map.setPositionMode("CANVAS");
    collisionMap = map.getObjects(1);
    bluebateriesPos=map.getObjects(3);
    bateriesPos = map.getObjects(2);
    trapPos=map.getObjects(4);
    enemiesPos=map.getObjects(5);
    exitSpawnPos=map.getObjects(6);
    backSpawnPos= map.getObjects(7);
    createObjects();
  }
  void update() {
    updateObjects();
  }

  void display() {
    map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);
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
    ArrayList<HighBatery> buffer2 = new ArrayList<HighBatery>();
    for (HighBatery obj : batery2) {
      obj.update();
      HighBatery bg2 = obj.collision2();
      if (bg2 != null)
        buffer2.add(bg2);
    }
    batery2.removeAll(buffer2);
    ArrayList<FireTrap> buffer3 = new ArrayList<FireTrap>();
    for (FireTrap obj : firetraps) {
      obj.update();
    }
    firetraps.removeAll(buffer3);
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
    for (HighBatery obj : batery2)
      obj.display();
    for (FireTrap obj : firetraps)
      obj.display();
    for (Enemy obj : enemies)
      obj.display();
  }

  void createObjects()
  {
    for (StringDict obj : bateriesPos) {
      Rectangle rect = new Rectangle(obj);
      LowBattery newBatery = new LowBattery (rect.x, rect.y); 
      batery.add(newBatery);
    }
    for (StringDict obj : bluebateriesPos) {
      Rectangle rect = new Rectangle(obj);
      HighBatery newBatery2 = new HighBatery (rect.x, rect.y); 
      batery2.add(newBatery2);
    }
    for (StringDict obj : trapPos) {
      Rectangle rect = new Rectangle(obj);
      FireTrap newFireTrap = new FireTrap (rect); 
      firetraps.add(newFireTrap);
    }
    for (StringDict obj : enemiesPos) {
      Rectangle rect = new Rectangle(obj);
      Enemy newEnemy = new Enemy (rect); 
      enemies.add(newEnemy);
    }
  }
  void CheckCollisionTraps()
  {
    float objY=0, objX=0;
    float objHeight=0, objWidth=0;
    for (StringDict obj : world.trapPos)
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