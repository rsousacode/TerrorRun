import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


int state;
final int STATE_MENU=1;
final int STATE_GAMEOVER=2;
final int STATE_HELP=3;
final int STATE_END=4;
final int STATE_GAME=0;
PImage background_menu;
PImage background_help;
Bullet bullet;
Handler handler;
AssetManager assetManager;
Camera camera;
Controller controller;
Player player;
Canon canon;
Menu menu;
Help help;
Darkning darkning;
HUD hud;
Rectangle rectangle;
End end;
Map map;
Minim audio;

AudioPlayer dieghost;
AudioPlayer ghostbullet;
AudioPlayer vannishgirl;
AudioPlayer malelaugh;
AudioPlayer lightson;
AudioPlayer backgroundmusic;
AudioPlayer jumpEffect;
AudioPlayer coinEffect;
AudioPlayer scarygirlLaugh;
AudioPlayer catchlantern;
AudioPlayer vannish;

void settings() {
  smooth(33);
  fullScreen(P2D);
  //size(800, 600, P2D);
  //size(400,300);
}

void setup()
{
  audio = new Minim(this);
  assetManager = new AssetManager();
  controller = new Controller();
  frameRate(100);
  setState(STATE_MENU);
}

//initialization states
void setState(int state) {
  this.state = state;
  switch(state) {
  case STATE_GAME:
    map = new Map(this);
    handler = new Handler();
    player = new Player(624, 1056, new PVector(0, 0), ID.Player);
    canon = new Canon();
    camera = new Camera(player.position());
    darkning = new Darkning();
    hud = new HUD();
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
  } else if (state== STATE_HELP ) {
    help.display();
  } else if ( state== STATE_GAME) {
    background(0);
    controller.apply();
    player.update();
    canon.render();

    map.update();
    handler.update();
    darkning.update(); 
    hud.update();
    camera.update();
    camera.apply();
    map.display();
    handler.display();
    player.display();
    darkning.apply(); 
    hud.display();
  } else if (state== STATE_END ) {
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
  controller.keyPressed(key);
}

void keyReleased() {
  controller.keyReleased(key);
}

void mousePressed() {
  StatesInter();
}