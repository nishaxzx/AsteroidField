class Player extends GameObject {
    float speed = 5;
    int direction = 0; // 0=up, 1=right, 2=down, 3=left
    PImage img;
    
    Player(float x, float y) {
        super(x, y, 0, 0);
        img = loadImage("player.png");
    }
    
    void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(90 * direction));
    imageMode(CENTER);
    tint(255, 255);  // Full opacity
    image(img, 0, 0, 40, 40);  // Adjusted size
    noTint();
    popMatrix();
}
    
    
    void move() {
        x = width/2;
        y = height/2;
    }
    
    boolean collides(GameObject other) {
        float distance = dist(x, y, other.x, other.y);
        if (other instanceof BaseAsteroid) {
            return distance < 25 + ((BaseAsteroid)other).size/2;
        }
        return distance < 35;
    }
    
    void setDirection(int newDirection) {
        direction = newDirection;
    }
}
