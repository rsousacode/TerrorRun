private class Rectangle {
  float x, y, w, h;
  Rectangle(StringDict obj) {
    this.x = parseFloat(obj.get("x"));
    this.y = parseFloat(obj.get("y"));
    this.w = parseFloat(obj.get("width"));
    this.h = parseFloat(obj.get("height"));
  }
}