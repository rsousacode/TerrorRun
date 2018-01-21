class Handler {
  StopWatchTimer dieTime;
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
  int collisionOffset = 10;
  int getID;
  final int homesGenerated = 200;
  int[] homes = new int[homesGenerated]; 
  int playerIsAt =0;
  ArrayList<LowBattery>[] lowbatteries = (ArrayList<LowBattery>[])new ArrayList[homesGenerated];
  ArrayList<HighBattery>[] highbatteries = (ArrayList<HighBattery>[])new ArrayList[homesGenerated];
  ArrayList<Ghost>[] ghostss = (ArrayList<Ghost>[])new ArrayList[homesGenerated];
  ArrayList<Flashlight>[] flashlightss = (ArrayList<Flashlight>[])new ArrayList[homesGenerated];
  ArrayList<Scarygirl>[] scarygirlss = (ArrayList<Scarygirl>[])new ArrayList[homesGenerated];
  ArrayList<BulletsPackFive>[] packfives = (ArrayList<BulletsPackFive>[])new ArrayList[homesGenerated];

  Handler() {

    randomFunction();
    dieTime = new StopWatchTimer();
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


  void randomFunction() 
  {

    for (int i = 0; i < homes.length; i++) {
      float r = random(4, 6);
      homes[0]=0;
      if (i < 3)
        r= random(1, 3);
      else if (i < 6 )
        r =random(2, 4);
      else if (i >= 6)
        r = random(4, 7);
      homes[i] = (int)r;
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

  void spawnBatteries() 
  {


    for (StringDict obj : map.lowbatteriesPos) 
    {            


      Rectangle rect = new Rectangle(obj); 
      LowBattery allBatteries = new LowBattery (rect.x, rect.y, ID.LowBattery); 
      lowBatteries.add(allBatteries);
    }

    for (int d = 0; d != homesGenerated; d++) 
    {

      lowbatteries[d] = new ArrayList<LowBattery>(lowBatteries);
    }


    for (StringDict obj : map.highbatteriesPos) 
    {
      Rectangle rect = new Rectangle(obj); 
      HighBattery newBatery2 = new HighBattery (rect.x, rect.y); 
      highBatteries.add(newBatery2);
    }

    for (int e = 0; e != homesGenerated; e++) 
    {
      highbatteries[e] = new ArrayList<HighBattery>(highBatteries);
    }

    for (StringDict obj : map.flashlightPos) 
    {
      Rectangle rect = new Rectangle(obj); 
      Flashlight newflashlight = new Flashlight (rect.x, rect.y); 
      flashlights.add(newflashlight);
    }

    for (int c = 0; c!= homesGenerated; c++) 
    {
      flashlightss[c] = new ArrayList <Flashlight>(flashlights);
    }

    for (StringDict obj : map.ghostbulletsPos) 
    {
      Rectangle rect = new Rectangle(obj); 
      BulletsPackFive newpack = new BulletsPackFive (rect.x, rect.y); 
      packfive.add(newpack);
    }

    for (int l = 0; l!= homesGenerated; l++) 
    {
      packfives[l] = new ArrayList <BulletsPackFive>(packfive);
    }
  }

  void spawnEnemies() {

    for (StringDict obj : map.GhostsPos) 
    {
      Rectangle rect = new Rectangle(obj); 
      Ghost newEnemy = new Ghost (rect); 
      ghosts.add(newEnemy);
    }

    for (int g = 0; g != homesGenerated; g++) 
    {
      ghostss[g] = new ArrayList<Ghost>(ghosts);
    }

    for (StringDict obj : map.scarygirlPos) 
    {
      Rectangle rect = new Rectangle(obj); 
      Scarygirl newgirl = new Scarygirl (rect); 
      scarygirls.add(newgirl);
    }

    for (int f = 0; f != homesGenerated; f++) 
    {
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

  void telleCollision() 
  {

    for (Rectangle obj : exitsRight) 
    {
      Rectangle rec = obj.collision(); 

      if (rec != null) 
      {
        playerIsAt++; 
        player.setPositionTo(entriesRight.get(homes[playerIsAt]).x-16, entriesRight.get(homes[playerIsAt]).y+exitsLeft.get(0).h/2); 
        camera.reColocar();
      }
    }

    for (Rectangle obj : entriesLeft) 
    {
      Rectangle rec = obj.collision(); 

      if (rec != null) 
      {
        playerIsAt--; 

        player.setPositionTo(exitsLeft.get(homes[playerIsAt]).x+64+16, exitsLeft.get(homes[playerIsAt]).y+exitsLeft.get(0).h/2); 
        camera.reColocar();
      }
    }
  }

  void objectsCemitery() 
  {
    ArrayList<LowBattery> buffer = new ArrayList<LowBattery>(); 
    for (LowBattery obj : lowbatteries[playerIsAt]) 
    {           
      obj.update(); 
      LowBattery bg = obj.collision(); 
      if (bg != null) {
        buffer.add(bg);
        if (soundActivated) {
          catchBattery.rewind();
          catchBattery.play();
        }
      }
    }
    lowbatteries[playerIsAt].removeAll(buffer); 

    ArrayList<HighBattery> buffer2 = new ArrayList<HighBattery>(); 
    for (HighBattery obj : highbatteries[playerIsAt]) 
    {
      obj.update(); 
      HighBattery bg2 = obj.collision2(); 
      if (bg2 != null) {
        buffer2.add(bg2);
        assetManager.soundCatchBattery();
      }
    }
    highbatteries[playerIsAt].removeAll(buffer2); 


    ArrayList<Flashlight> buffer7 = new ArrayList<Flashlight>(); 
    for (Flashlight obj : flashlightss[playerIsAt]) 
    {
      obj.update(); 
      Flashlight fl = obj.collision2(); 
      if (fl != null) {
        buffer7.add(fl);
        assetManager.soundCatchLantern();
      }
    }

    flashlightss[playerIsAt].removeAll(buffer7); 

    ArrayList<BulletsPackFive> buffer13 = new ArrayList<BulletsPackFive>(); 
    for (BulletsPackFive obj : packfives[playerIsAt]) 
    {
      obj.update(); 
      BulletsPackFive bp = obj.collision2(); 
      if (bp != null)
        buffer13.add(bp);
    }

    packfives[playerIsAt].removeAll(buffer13); 


    ArrayList<Ghost> buffer4 = new ArrayList<Ghost>(); 
    for (Ghost obj : ghostss[playerIsAt]) 
    {
      obj.update(); 
      Ghost en = obj.collisionPlayer(); 
      if (en != null) {

        buffer4.add(en);
        //  PVector ghostPos = new PVector( en.position().x, en.position().x);
        dieTime.start();
        controlsEnabled=false;
        assetManager.soundVannish();
      }
      Ghost aw = obj.cullisionBullets(); 
      if  (aw!=null) {
        buffer4.add(aw);
      }
    }
    ghostss[playerIsAt].removeAll(buffer4); 

    ArrayList<Scarygirl> buffer11 = new ArrayList<Scarygirl>(); 
    for (Scarygirl obj : scarygirlss[playerIsAt]) 
    {
      obj.update(); 
      Scarygirl sg = obj.collisionPlayer(); 
      if (sg != null) {
        controlsEnabled=!controlsEnabled;
        assetManager.soundGirlaugh();
        buffer11.add(sg);
        dieTime.start();
      }

      Scarygirl bs = obj.collisionBullets();
      if (bs!=null) {
        buffer11.add(bs);
      }
    }
    scarygirlss[playerIsAt].removeAll(buffer11); 

    ArrayList<FireTrap> buffer15 = new ArrayList<FireTrap>(); 
    for (FireTrap obj : firetraps) 
    {
      obj.update(); 
      FireTrap fa = obj.PlayerColidingTraps(); 
      if (fa != null) {
        controlsEnabled=false;
        assetManager.soundMaleLaugh();
        buffer15.add(fa);
        dieTime.start();
      }
    }
    firetraps.removeAll(buffer15); 

    ArrayList<Bullet> nextMyBullets = new ArrayList <Bullet>(); 
    for (Bullet obj : bullets) 
    {
      obj.update(0.016); 
      obj.applyForce(gravity); 
      Bullet bl = obj.removeBullets(); 
      if (bl != null)
        nextMyBullets.add(bl);
    }
    bullets.removeAll(nextMyBullets);
  }


  void update() 
  {
    dieAction();

    objectsCemitery(); 
    telleCollision();
  }

  void display() 
  {
    displayBatteries(); 
    displayBullets();
    displayEnemies(); 
    displayTraps();
  }



  void displayBullets() {
    for (Bullet obj : bullets) {
      obj.display();
    }
  }

  void displayBatteries() {

    for (LowBattery obj : lowbatteries[playerIsAt]) 
    {
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
  }



  void displayTraps() 
  {
    for (FireTrap obj : firetraps)
      obj.display();
  }



  void dieAction() 
  {
    if (dieTime.second()>2.5)
      state = STATE_END;
  }
}