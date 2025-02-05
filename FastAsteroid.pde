class FastAsteroid extends BaseAsteroid implements Animated {
    float pulseSize;
    PImage img;
    
    FastAsteroid(float x, float y, float speedX, float speedY) {
        super(x, y, speedX * 1.5, speedY * 1.5, 30);
        pulseSize = size;
        img = loadImage("fast-asteroid.png");
    }
    
    void display() {
        pushMatrix();
        translate(x, y);
        rotate(rotation);
        imageMode(CENTER);
        tint(255, 255);
        image(img, 0, 0, pulseSize, pulseSize);
        noTint();
        popMatrix();
        rotation += rotationSpeed * 2;
    }
    
    void animate() {
        pulseSize = size + sin(frameCount * 0.1) * 5;
    }
}
