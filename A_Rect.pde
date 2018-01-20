class Rectangle {
  int x, y, w, h, getID;
  Rectangle(StringDict obj) {
    this.x = int(obj.get("x"));
    this.y = int(obj.get("y"));
    this.w = int(obj.get("width"));
    this.h = int(obj.get("height"));
  
  }

  Rectangle collision() {
    Rectangle rec = null; //added w/2 to this collision to polish the teleport method
    if (dist(player.position().x, player.position().y, x+w/2, y + player.image.height/2)< player.image.width/2+player.image.height/2 )
    {
      rec=this;
      println(getID);
    }
    return rec;
  }

  //int id() {
  //  return myID;
  //}
}