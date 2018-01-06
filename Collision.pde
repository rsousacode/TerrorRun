class Collision {
  boolean collision;
  
    void check(float px, float py, float ox, float oy, float pw, float ph){
    if (dist(px, py, ox, oy + ph/2)< pw/2+ph/2)
    {
      collision = true;
      //darkning.diameter-=77;
    }
    else collision = false;
  }
    
  
}