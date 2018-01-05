class Audio {
  
  void setup(){
    minim = new Minim(this);
    sndJump = minim.loadSample("jump.wav");
    sndCoin = minim.loadSample("coin.wav",100);
  }
  
  void draw() {
    
  }
  
  void stop() { // automatically called when program exits. here we'll stop and unload sounds.
  music.close();
  sndJump.close();
  sndCoin.close();

  minim.stop();

}
}