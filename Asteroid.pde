abstract class BaseAsteroid extends GameObject {
    float size;
    float rotation = 0;
    float rotationSpeed;
    
    BaseAsteroid(float x, float y, float speedX, float speedY, float size) {
        super(x, y, speedX, speedY);
        this.size = size;
        this.rotationSpeed = random(-0.05, 0.05);
    }
    
    void move() {
        x += speedX;
        y += speedY;
        
        if (x < -size) x = width + size;
        if (x > width + size) x = -size;
        if (y < -size) y = height + size;
        if (y > height + size) y = -size;
    }
}

class Asteroid extends BaseAsteroid {
    PImage img;
    
    Asteroid(float x, float y, float speedX, float speedY, float size) {
        super(x, y, speedX, speedY, size);
        img = loadImage("asteroid.png");
    }
    
    void display() {
        pushMatrix();
        translate(x, y);
        rotate(rotation);
        imageMode(CENTER);
        tint(255, 255);
        image(img, 0, 0, size, size);
        noTint();
        popMatrix();
    }  
}
