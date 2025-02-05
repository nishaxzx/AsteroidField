// Base abstract class for all game objects
abstract class GameObject {
    float x, y;
    float speedX, speedY;
    
    GameObject(float x, float y, float speedX, float speedY) {
        this.x = x;
        this.y = y;
        this.speedX = speedX;
        this.speedY = speedY;
    }
    
    abstract void display();
    abstract void move();
}
