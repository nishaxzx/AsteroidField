class PowerUp extends GameObject implements Animated, Collectable {
    float angle = 0;
    float pulseSize = 20;
    PImage img;
    
    PowerUp(float x, float y) {
        super(x, y, random(-1, 1), random(-1, 1));
        img = loadImage("powerup.png");
    }
    
   void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    tint(255, 255);
    image(img, 0, 0, pulseSize, pulseSize);
    noTint();
    popMatrix();
}
    
    
    void move() {
        x += speedX;
        y += speedY;
        
        if (x < 0) x = width;
        if (x > width) x = 0;
        if (y < 0) y = height;
        if (y > height) y = 0;
    }
    
    void animate() {
        angle += 0.05;
        pulseSize = 20 + sin(frameCount * 0.1) * 5;
    }
    
    int getScoreValue() {
        return 100;
    }
}
