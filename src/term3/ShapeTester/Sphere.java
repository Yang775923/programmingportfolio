class Sphere {
    double r;

    Sphere(double r) {
        this.r = r;
    }

    public double calcVol() {
        double vol = (4.0 / 3.0) * Math.PI * Math.pow(r, 3); 
        return vol;
    }

    public double calcSA() {
        double sa = 4 * Math.PI * Math.pow(r, 2);
        return sa;
    }
}