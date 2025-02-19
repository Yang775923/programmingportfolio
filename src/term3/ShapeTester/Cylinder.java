class Cylinder {
  double r;
  double h;

  Cylinder(double r, double h) {
      this.r = r;
      this.h = h;
  }

  public double calcVol() {
    double vol = Math.PI * Math.pow(r, 2) * h;
    return vol;
  }
  
  public double calcSA() {
    double sa = 2 * Math.PI * r * (r + h);
    return sa;
  }
}