import ddf.minim.*;

AssetManager assetManager;
Camera camera;
Controller controller;
Player player;
Menu menu;
Help help;
Darkning darkning;
HUD hud;
Rectangle rectangle;
End end;
World world;
Minim minim;
AudioPlayer music;     
AudioPlayer menumusic; //intent to have menu music and gameplay music
AudioSample sndJump, sndCoin;

int state;
final int STATE_MENU=1;
final int STATE_GAMEOVER=2;
final int STATE_HELP=3;
final int STATE_END=4;
final int STATE_GAME=0;
PImage background_menu;
PImage background_help;
PImage cursor;
PImage transcursor;

void settings() {
  smooth(33);
  fullScreen(P2D);
  //size(800, 600, P2D);
}

void setup()
{
  assetManager = new AssetManager();
  transcursor= loadImage("data/images/transcursor.png");
  controller = new Controller();
  frameRate(100);
  background_menu = loadImage("data/images/background4.jpg");
  //setState(STATE_MENU);
  setState(STATE_MENU);
}

//initialization states
void setState(int state) {
  this.state = state;
  switch(state) {
  case STATE_GAME:
    world = new World(this);
//    player = new Player(new PVector(0, 0), new PVector(0, 0));
    player = new Player(new PVector(622, 1088), new PVector(0, 0));
    camera = new Camera(player.position());
    darkning = new Darkning();  
    hud = new HUD();

    //tilled_get_map
  case STATE_END:
    end = new End();
  case STATE_MENU:
    menu = new Menu();
  case STATE_HELP:
    help = new Help();
  }
}

void draw()
{
  if (state== STATE_MENU ) {
    menu.display();
    menu.update();
    cursor= loadImage("data/images/cursor.png");
    Cursordisplay();
  } else if (state== STATE_HELP ) {
    cursor= loadImage("data/images/cursor.png");
    Cursordisplay();
    help.display();
  } else if ( state== STATE_GAME) {
    background(#FF0000);
    controller.apply();
    player.update();
    world.update();
    darkning.update(); 
    hud.update();
    camera.update();

    Cursordisplay();

    camera.apply();
    
    world.display();
    player.display();

    darkning.apply(); 
    hud.display();
  } else if (state== STATE_END ) {
    cursor= loadImage("data/images/cursor.png");
    Cursordisplay();
    end.display();
  }
}


float sqr(float value) {
  return value * value;
}

void StatesInter() {

  if (state == STATE_MENU ) {
    String result = menu.checkButtons();
    switch(result)
    {
    case "play":
      setState(STATE_GAME);

      break;
    } 
    switch(result)
    {
    case "help":
      setState(STATE_HELP);
      break;
    }
    switch(result)
    {
    case "exit":
      exit();
      break;
    }
  } 
  if (state == STATE_HELP ) {
    String result = help.checkButtons();
    switch(result)
    {
    case "gomenu":
      setState(STATE_MENU);
      break;
    }
  } else if (state == STATE_END ) {
    String result = end.checkButtons();
    switch(result)
    {
    case "gomenu":
      setState(STATE_MENU);

      break;
    }
  }
}

void keyPressed() {
  //  if (state == STATE_GAME)
  controller.keyPressed(key);
}

void keyReleased() {
  //    if (state == STATE_GAME)
  controller.keyReleased(key);
}

void mousePressed() {
  StatesInter();
}

void Cursordisplay() {
  if (state!=STATE_GAME ) {
    cursor(cursor);
  } else if (state==STATE_GAME) {
    cursor(transcursor);
  }
}