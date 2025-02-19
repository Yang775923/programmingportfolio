class Box {
  double l;
  double w;
  double h;

  Box(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  public double calcVol() {
    double vol = l*w*h;
    return vol;
  }
  
  public double calcSA() {
    double sa = 2*l*w + 2*l*h + 2*h*w;
    return sa;
  }
  
}