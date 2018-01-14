class Handler {
  ArrayList<Enemy> enemies;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> lowBatteries;
  ArrayList<HighBattery> highBatteries;
  ArrayList<Rectangle> exitsLeft;
  ArrayList<Rectangle> exitsRight;
  ArrayList<Rectangle> entriesLeft;
  ArrayList<Rectangle> entriesRight;
  final int casasn = 1000;
  int[] casas = new int[casasn]; 
  int playerIsAt =0;
  int collisionOffset = 10;
  ArrayList<LowBattery>[] lowbatteries = (ArrayList<LowBattery>[])new ArrayList[1000];
  ArrayList<HighBattery>[] highbatteries = (ArrayList<HighBattery>[])new ArrayList[1000];
  ArrayList<Enemy>[] inimigos = (ArrayList<Enemy>[])new ArrayList[1000];

  Handler() {

    randomFunction();

    lowBatteries = new ArrayList<LowBattery>();
    highBatteries = new ArrayList<HighBattery>();
    enemies = new ArrayList<Enemy>();
    firetraps = new ArrayList <FireTrap>();
    exitsLeft = new ArrayList <Rectangle>();
    exitsRight = new ArrayList <Rectangle>();
    entriesRight = new ArrayList<Rectangle>();
    entriesLeft = new ArrayList<Rectangle>();
    spawnTraps();
    spawnBatteries();
    spawnEnemies();
    spawnTelle();
  }

  void randomFunction() {

    for (int i = 0; i < casas.length; i++) {
      float r = random(1, 3);
      casas[0]=0;
      //if (i == 0)
      //r=0;
      casas[i] = (int)r;
    }
  }

  void spawnTraps()
  {
    for (StringDict obj : map.trapsPos) {
      Rectangle rect = new Rectangle(obj);
      FireTrap newFireTrap = new FireTrap (rect, ID.Traps); 
      firetraps.add(newFireTrap);
    }
  }

  void spawnBatteries() {

    for (StringDict obj : map.lowbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      LowBattery newBattery = new LowBattery (rect.x, rect.y, ID.LowBattery); 
      lowBatteries.add(newBattery);
    }

    for (int d = 0; d != casasn; d++) {
      lowbatteries[d] = new ArrayList<LowBattery>(lowBatteries);
    }

    for (StringDict obj : map.highbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      HighBattery newBatery2 = new HighBattery (rect.x, rect.y); 
      highBatteries.add(newBatery2);
    }

    for (int e = 0; e != casasn; e++) {
      highbatteries[e] = new ArrayList<HighBattery>(highBatteries);
    }
  }

  void spawnEnemies() {

    for (StringDict obj : map.GhostsPos) {
      Rectangle rect = new Rectangle(obj);
      Enemy newEnemy = new Enemy (rect); 
      enemies.add(newEnemy);
    }

    for (int g = 0; g != casasn; g++) {
      inimigos[g] = new ArrayList<Enemy>(enemies);
    }
  }

  void spawnTelle() {

    for (StringDict exitLeftObject : map.exitLeftObjects)
      exitsLeft.add(new Rectangle(exitLeftObject));
    for (StringDict exitRightObject : map.exitRightObjects)
      exitsRight.add(new Rectangle(exitRightObject));
    for (StringDict entryLeftObject : map.entryLeftObjects)
      entriesLeft.add(new Rectangle(entryLeftObject));
    for (StringDict entryRightObject : map.entryRightObjects)
      entriesRight.add(new Rectangle(entryRightObject));
  }

  void telleCollision() {

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

        player.setPositionTo(exitsLeft.get(casas[playerIsAt]).x+64+16, exitsLeft.get(casas[playerIsAt]).y+exitsLeft.get(0).h/2);

        camera.mpfmftl();
      }
    }
  }

  void displayBatteries() {

    for (LowBattery obj : lowbatteries[playerIsAt]) {
      obj.display();
    }

    for (HighBattery obj : highbatteries[playerIsAt])
      obj.display();
  }

  void displayEnemies() {

    for (Enemy obj : inimigos[playerIsAt])
      obj.display();
  }

  void displayTraps() {
    for (FireTrap obj : firetraps)
      obj.display();
  }


  void update() {
    objectsCemitery();
    telleCollision();
  }

  void display() {
    displayBatteries();
    displayEnemies();
    displayTraps();
  }

  void objectsCemitery() {
    ArrayList<LowBattery> buffer = new ArrayList<LowBattery>();
    for (LowBattery obj : lowbatteries[playerIsAt]) {
      obj.update();
      LowBattery bg = obj.collision();
      if (bg != null)
        buffer.add(bg);
    }
    lowbatteries[playerIsAt].removeAll(buffer);

    ArrayList<HighBattery> buffer2 = new ArrayList<HighBattery>();
    for (HighBattery obj : highbatteries[playerIsAt]) {
      obj.update();
      HighBattery bg2 = obj.collision2();
      if (bg2 != null)
        buffer2.add(bg2);
    }
    highbatteries[playerIsAt].removeAll(buffer2);
    for (FireTrap obj : firetraps) {
      obj.update();
    }

    ArrayList<Enemy> buffer4 = new ArrayList<Enemy>();
    for (Enemy obj : inimigos[playerIsAt]) {
      obj.update();
      Enemy en = obj.collision4();
      if (en != null)
        buffer4.add(en);
    }
    inimigos[playerIsAt].removeAll(buffer4);
  }



  void CheckCollisionTraps(float objX, float objY, float objWidth, float objHeight)
  {
    //float objY=0, objX=0;
    //float objHeight=0, objWidth=0;
    float objId=0;
    for (StringDict obj : map.trapsPos)
    {
      objX = parseFloat(obj.get("x"));
      objY = parseFloat(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));
      objId = parseFloat(obj.get("id"));

      float xi = Math.max (player.position().x-player.image.width/2+collisionOffset, objX);
      float yi = Math.max (player.position().y-player.image.height/2, objY);
      float wi = Math.min ((player.position().x-player.image.width/2-collisionOffset)+ player.image.width, objX + objWidth) - xi;
      float hi = Math.min ((player.position().y-player.image.height/2)+ player.image.height, objY + objHeight) - yi;
      if (wi >= 0 && hi >= 0)
      {
        if (wi > hi) {
          println(objId);
          hud.setLives(0);
        } else {
          println(objId);

          hud.setLives(0);
        }
      }
    }
  }
}