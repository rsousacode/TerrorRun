class Handler {
  ArrayList<Ghost> ghosts;
  ArrayList<Scarygirl> scarygirls;
  ArrayList<FireTrap> firetraps;
  ArrayList<LowBattery> lowBatteries;
  ArrayList<HighBattery> highBatteries;
  ArrayList <Flashlight> flashlights;
  ArrayList<Rectangle> exitsLeft;
  ArrayList<Rectangle> exitsRight;
  ArrayList<Rectangle> entriesLeft;
  ArrayList<Rectangle> entriesRight;
  ArrayList<Bullet> bullets;
  ArrayList<BulletsPackFive> packfive;
  PVector gravity = new PVector(0, 10);

  final int ncasas = 200;
  int[] casas = new int[ncasas]; 
  int playerIsAt =0;
  int collisionOffset = 10;
  ArrayList<LowBattery>[] lowbatteries = (ArrayList<LowBattery>[])new ArrayList[ncasas];
  ArrayList<HighBattery>[] highbatteries = (ArrayList<HighBattery>[])new ArrayList[ncasas];
  ArrayList<Ghost>[] ghostss = (ArrayList<Ghost>[])new ArrayList[ncasas];
  ArrayList<Flashlight>[] flashlightss = (ArrayList<Flashlight>[])new ArrayList[ncasas];
  ArrayList<Scarygirl>[] scarygirlss = (ArrayList<Scarygirl>[])new ArrayList[ncasas];
  ArrayList<BulletsPackFive>[] packfives = (ArrayList<BulletsPackFive>[])new ArrayList[ncasas];

  Handler() {

    randomFunction();

    lowBatteries = new ArrayList<LowBattery>();
    highBatteries = new ArrayList<HighBattery>();
    flashlights = new ArrayList <Flashlight>();
    scarygirls = new ArrayList <Scarygirl>();
    ghosts = new ArrayList<Ghost>();
    firetraps = new ArrayList <FireTrap>();
    exitsLeft = new ArrayList <Rectangle>();
    exitsRight = new ArrayList <Rectangle>();
    entriesRight = new ArrayList<Rectangle>();
    entriesLeft = new ArrayList<Rectangle>();
    bullets = new ArrayList<Bullet>();
    packfive = new ArrayList<BulletsPackFive>();

    spawnTraps();
    spawnBatteries();
    spawnEnemies();
    spawnTelle();
  }

  void randomFunction() {

    for (int i = 0; i < casas.length; i++) {
      float r = random(4, 6);
      casas[0]=0;
      if (i < 3)
      r= random(1,3);
      else if(i < 6 )
      r =random(2,4);
      else if (i >= 6)
      r = random(4,7);
      
      
        
      casas[i] = (int)r;
     // println(casas[0], casas[1], casas[2], casas[3], casas[4], casas[5], casas[6],casas[7], casas[8], casas[9]);
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

    for (int d = 0; d != ncasas; d++) {
      lowbatteries[d] = new ArrayList<LowBattery>(lowBatteries);
    }

    for (StringDict obj : map.highbatteriesPos) {
      Rectangle rect = new Rectangle(obj);
      HighBattery newBatery2 = new HighBattery (rect.x, rect.y); 
      highBatteries.add(newBatery2);
    }

    for (int e = 0; e != ncasas; e++) {
      highbatteries[e] = new ArrayList<HighBattery>(highBatteries);
    }

    for (StringDict obj : map.flashlightPos) {
      Rectangle rect = new Rectangle(obj);
      Flashlight newflashlight = new Flashlight (rect.x, rect.y); 
      flashlights.add(newflashlight);
    }

    for (int c = 0; c!= ncasas; c++) {
      flashlightss[c] = new ArrayList <Flashlight>(flashlights);
    }

    for (StringDict obj : map.ghostbulletsPos) {
      Rectangle rect = new Rectangle(obj);
      BulletsPackFive newpack = new BulletsPackFive (rect.x, rect.y); 
      packfive.add(newpack);
    }

    for (int l = 0; l!= ncasas; l++) {
      packfives[l] = new ArrayList <BulletsPackFive>(packfive);
    }
  }

  void spawnEnemies() {

    for (StringDict obj : map.GhostsPos) {
      Rectangle rect = new Rectangle(obj);
      Ghost newEnemy = new Ghost (rect); 
      ghosts.add(newEnemy);
    }

    for (int g = 0; g != ncasas; g++) {
      ghostss[g] = new ArrayList<Ghost>(ghosts);
    }

    for (StringDict obj : map.scarygirlPos) {
      Rectangle rect = new Rectangle(obj);
      Scarygirl newgirl = new Scarygirl (rect); 
      scarygirls.add(newgirl);
    }

    for (int f = 0; f != ncasas; f++) {
      scarygirlss[f] = new ArrayList<Scarygirl>(scarygirls);
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

    for (Flashlight obj : flashlightss[playerIsAt])
      obj.display();

    for (BulletsPackFive obj : packfives[playerIsAt])
      obj.display();
  }

  void displayEnemies() {

    for (Ghost obj : ghostss[playerIsAt])
      obj.display();
    for (Scarygirl obj : scarygirlss[playerIsAt])
      obj.display();



    for (Bullet obj : bullets) {
      obj.display();
    }
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

    ArrayList<Flashlight> buffer7 = new ArrayList<Flashlight>();
    for (Flashlight obj : flashlightss[playerIsAt]) {
      obj.update();
      Flashlight fl = obj.collision2();
      if (fl != null)
        buffer7.add(fl);
    }

    flashlightss[playerIsAt].removeAll(buffer7);

    ///

    ArrayList<BulletsPackFive> buffer13 = new ArrayList<BulletsPackFive>();
    for (BulletsPackFive obj : packfives[playerIsAt]) {
      obj.update();
      BulletsPackFive bp = obj.collision2();
      if (bp != null)
        buffer13.add(bp);
    }

    packfives[playerIsAt].removeAll(buffer13);

    //


    ArrayList<Ghost> buffer4 = new ArrayList<Ghost>();
    for (Ghost obj : ghostss[playerIsAt]) {
      obj.update();
      Ghost en = obj.collision4();
      if (en != null)
        buffer4.add(en);
    }
    ghostss[playerIsAt].removeAll(buffer4);

    ArrayList<Scarygirl> buffer11 = new ArrayList<Scarygirl>();
    for (Scarygirl obj : scarygirlss[playerIsAt]) {
      obj.update();
      Scarygirl sg = obj.collision4();
      if (sg != null)
        buffer11.add(sg);
    }
    scarygirlss[playerIsAt].removeAll(buffer11);

    ArrayList<Bullet> nextMyBullets = new ArrayList <Bullet>();
    for (Bullet obj : bullets) {
      obj.update(0.016);
      obj.applyForce(gravity);
      Bullet bl = obj.collision1();
      if (bl != null)
        nextMyBullets.add(bl);
    }
    bullets.removeAll(nextMyBullets);
  }



  void CheckCollisionTraps(float objX, float objY, float objWidth, float objHeight)
  {

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
        if (wi > hi) {
          if (!devmode)
            state=STATE_END;
        } else {
          if (!devmode)
            state=STATE_END;
        }
      }
    }
  }
}