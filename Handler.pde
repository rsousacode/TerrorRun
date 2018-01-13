class Handler {
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> lowBatteries;
  ArrayList<HighBattery> highBatteries;
  int collisionOffset = 10;
  Handler() {
    lowBatteries = new ArrayList<LowBattery>();
    highBatteries = new ArrayList<HighBattery>();
    enemies = new ArrayList<Enemy>();
    firetraps = new ArrayList <FireTrap>();


    createObjects();
  }

  void createObjects()
  {
    for (StringDict obj : map.lowbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      LowBattery newBattery = new LowBattery (rect.x, rect.y, ID.LowBattery); 
      lowBatteries.add(newBattery);
    }
    for (StringDict obj : map.highbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      HighBattery newBatery2 = new HighBattery (rect.x, rect.y); 
      highBatteries.add(newBatery2);
    }
    for (StringDict obj : map.trapsPos) {
      Rectangle rect = new Rectangle(obj);
      FireTrap newFireTrap = new FireTrap (rect, ID.Traps); 
      firetraps.add(newFireTrap);
    }
    for (StringDict obj : map.GhostsPos) {
      Rectangle rect = new Rectangle(obj);
      Enemy newEnemy = new Enemy (rect); 
      enemies.add(newEnemy);
    }
  }
  void update() {
    ArrayList<LowBattery> buffer = new ArrayList<LowBattery>();
    for (LowBattery obj : lowBatteries) {
      obj.update();
      LowBattery bg = obj.collision();
      if (bg != null)
        buffer.add(bg);
    }
    lowBatteries.removeAll(buffer);
    ArrayList<HighBattery> buffer2 = new ArrayList<HighBattery>();
    for (HighBattery obj : highBatteries) {
      obj.update();
      HighBattery bg2 = obj.collision2();
      if (bg2 != null)
        buffer2.add(bg2);
    }
    highBatteries.removeAll(buffer2);
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

  void display() {

    for (LowBattery obj : lowBatteries)
      obj.display();
    for (HighBattery obj : highBatteries)
      obj.display();
    for (FireTrap obj : firetraps)
      obj.display();
    for (Enemy obj : enemies)
      obj.display();
  }



  void CheckCollisionTraps()
  {
    float objY=0, objX=0;
    float objHeight=0, objWidth=0;
    for (StringDict obj : map.trapsPos)
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