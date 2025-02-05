class Star {
    float x, y;
    float brightness;
    
    Star() {
        reset();
    }
    
    void reset() {
        x = random(width);
        y = random(height);
        brightness = random(100, 255);
    }
    
    void display() {
        stroke(brightness);
        point(x, y);
    }
}
