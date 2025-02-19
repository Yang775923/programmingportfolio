class Pyramid {
    double l;
    double w;
    double h;

    Pyramid(double l, double w, double h) {
        this.l = l;
        this.w = w;
        this.h = h;
    }

    public double calcVol() {
        double vol = (l * w * h) / 3.0;  
        return vol;
    }

    public double calcSA() {
        double sa = (l * w) + (l * Math.sqrt(Math.pow(w / 2.0, 2) + Math.pow(h, 2))) + (w * Math.sqrt(Math.pow(l / 2.0, 2) + Math.pow(h, 2)));
        return sa;
    }
}