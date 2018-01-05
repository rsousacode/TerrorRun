class World {
  Ptmx map;
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<Batery> batery;
  ArrayList<Batery2> batery2;
  ArrayList<ExitSpawn> exitspawns;
  ArrayList<BackSpawn> backspawns;
  StringDict[] exitSpawnPos;
  StringDict[] backSpawnPos;
  StringDict[] collisionMap;
  StringDict[] bateriesPos;
  StringDict[] bluebateriesPos;
  StringDict[] trapPos;
  StringDict[] enemiesPos;
  World(PApplet papplet) {
    map = new Ptmx(papplet, "map0.tmx");
    batery = new ArrayList<Batery>();
    batery2 = new ArrayList<Batery2>();
    enemies = new ArrayList<Enemy>();
    firetraps = new ArrayList <FireTrap>();
    exitspawns = new ArrayList <ExitSpawn>();
    backspawns = new ArrayList <BackSpawn>();
    map.setDrawMode(CORNER); 
    map.setPositionMode("CANVAS");
    collisionMap = map.getObjects(1);
    bluebateriesPos=map.getObjects(3);
    bateriesPos = map.getObjects(2);
    trapPos=map.getObjects(4);
    enemiesPos=map.getObjects(5);
    exitSpawnPos=map.getObjects(6);
    backSpawnPos= map.getObjects(7);
    ObjectsDisplay();
  }
  void update() {
    ObjectsUpdate();
  }

  void display() {
    translate(0,0);
    map.draw(0, camera.position.x - width / 2, camera.position.y - height / 2);
  }

  void ObjectsUpdate()
  {
    ArrayList<ExitSpawn> buffer0 = new ArrayList<ExitSpawn>();
    for (ExitSpawn obj : exitspawns) {
      obj.update();
      ExitSpawn sp = obj.collision5();
      if (sp != null)
        buffer0.add(sp);
      obj.display();
    }
    ArrayList<BackSpawn> buffer03 = new ArrayList<BackSpawn>();
    for (BackSpawn obj : backspawns) {
      obj.update();
      BackSpawn bsp = obj.collision6();
      if (bsp != null)
        buffer03.add(bsp);
      obj.display();
    }
    ArrayList<Batery> buffer = new ArrayList<Batery>();
    for (Batery obj : batery) {
      obj.update();
      Batery bg = obj.collision();
      if (bg != null)
        buffer.add(bg);
      obj.display();
    }
    batery.removeAll(buffer);
    ArrayList<Batery2> buffer2 = new ArrayList<Batery2>();
    for (Batery2 obj : batery2) {
      obj.update();
      Batery2 bg2 = obj.collision2();
      if (bg2 != null)
        buffer2.add(bg2);
      obj.display();
    }
    batery2.removeAll(buffer2);
    ArrayList<FireTrap> buffer3 = new ArrayList<FireTrap>();
    for (FireTrap obj : firetraps) {
      obj.update();
      obj.display();
    }
    firetraps.removeAll(buffer3);
    ArrayList<Enemy> buffer4 = new ArrayList<Enemy>();
    for (Enemy obj : enemies) {
      obj.update();
      Enemy en = obj.collision4();
      if (en != null)
        buffer4.add(en);
      obj.display();
    }
    enemies.removeAll(buffer4);
  }

  void ObjectsDisplay()
  {
    for (StringDict obj : exitSpawnPos) {
      Rectangle rect = new Rectangle(obj);
      ExitSpawn newExitSpawn = new ExitSpawn (rect); 
      exitspawns.add(newExitSpawn);
    }
    for (StringDict obj : backSpawnPos) {
      Rectangle rect = new Rectangle(obj);
      BackSpawn newBackSpawn = new BackSpawn (rect); 
      backspawns.add(newBackSpawn);
    }
    for (StringDict obj : bateriesPos) {
      Rectangle rect = new Rectangle(obj);
      Batery newBatery = new Batery (rect.x, rect.y); 
      batery.add(newBatery);
    }
    for (StringDict obj : bluebateriesPos) {
      Rectangle rect = new Rectangle(obj);
      Batery2 newBatery2 = new Batery2 (rect.x, rect.y); 
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
      float xi = Math.max (player.position.x-player.image.width/2, objX+16);
      float yi = Math.max (player.position.y-player.image.height/2, objY);
      float wi = Math.min ((player.position.x-player.image.width/2)+ player.image.width, objX + objWidth) - xi;
      float hi = Math.min ((player.position.y-player.image.height/2)+ player.image.height, objY + objHeight) - yi;
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