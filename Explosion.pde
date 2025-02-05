class Explosion extends GameObject implements Animated {
    float size;
    float alpha = 255;
    PImage img;
    
    Explosion(float x, float y) {
        super(x, y, 0, 0);
        size = 10;
        img = loadImage("explosion.png");
    }
    
    void display() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    tint(255, alpha);
    image(img, 0, 0, size, size);
    noTint();
    popMatrix();
}
    
    
    void move() {
        size += 2;
    }
    
    void animate() {
        alpha -= 10;
    }
    
    boolean isDead() {
        return alpha <= 0;
    }
}
