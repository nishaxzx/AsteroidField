// Game objects
Star[] stars = new Star[200];
Player player;
ArrayList<BaseAsteroid> asteroids;
ArrayList<PowerUp> powerUps;
ArrayList<Explosion> explosions;

// Game state
int score = 0;
int highScore = 0;
boolean gameOver = false;
int lives = 3;

void setup() {
    size(800, 600);
    for (int i = 0; i < stars.length; i++) {
        stars[i] = new Star();
    }
    resetGame();
    loadHighScore();
}

void draw() {
    background(0);
    // Draw stars
    for (Star s : stars) {
        s.display();
    }
    
    if (!gameOver) {
        handleInput();
        updateGameObjects();
        checkCollisions();
    }
    
    displayGameObjects();
    displayHUD();
}


void handleInput() {
    if (keyPressed) {
        float dx = 0;
        float dy = 0;
        
        if (keyCode == LEFT) {
            dx = player.speed;
            player.setDirection(3);
        }
        if (keyCode == RIGHT) {
            dx = -player.speed;
            player.setDirection(1);
        }
        if (keyCode == UP) {
            dy = player.speed;
            player.setDirection(0);
        }
        if (keyCode == DOWN) {
            dy = -player.speed;
            player.setDirection(2);
        }
        
        moveAllObjects(dx, dy);
    }
}

void moveAllObjects(float dx, float dy) {
    for (BaseAsteroid a : asteroids) {
        a.x += dx;
        a.y += dy;
    }
    for (PowerUp p : powerUps) {
        p.x += dx;
        p.y += dy;
    }
}

void updateGameObjects() {
    player.move();
    
    for (BaseAsteroid a : asteroids) {
        a.move();
        if (a instanceof Animated) {
            ((Animated)a).animate();
        }
    }
    
    for (PowerUp p : powerUps) {
        p.move();
        p.animate();
    }
    
    for (int i = explosions.size() - 1; i >= 0; i--) {
        Explosion e = explosions.get(i);
        e.move();
        e.animate();
        if (e.isDead()) {
            explosions.remove(i);
        }
    }
}

void checkCollisions() {
    for (int i = asteroids.size() - 1; i >= 0; i--) {
        if (player.collides(asteroids.get(i))) {
            explosions.add(new Explosion(asteroids.get(i).x, asteroids.get(i).y));
            asteroids.remove(i);
            lives--;
            if (lives <= 0) {
                gameOver = true;
                if (score > highScore) {
                    highScore = score;
                    saveHighScore();
                }
            }
            return;
        }
    }
    
    for (int i = powerUps.size() - 1; i >= 0; i--) {
        PowerUp p = powerUps.get(i);
        if (player.collides(p)) {
            score += p.getScoreValue();
            powerUps.remove(i);
        }
    }
}

void displayGameObjects() {
    player.display();
    
    for (BaseAsteroid a : asteroids) {
        a.display();
    }
    
    for (PowerUp p : powerUps) {
        p.display();
    }
    
    for (Explosion e : explosions) {
        e.display();
    }
}

void displayHUD() {
    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("Score: " + score, 20, 30);
    text("High Score: " + highScore, 20, 60);
    text("Lives: " + lives, 20, 90);
    
    if (gameOver) {
        textAlign(CENTER);
        textSize(50);
        fill(255, 0, 0);
        text("Game Over", width/2, height/2);
        textSize(30);
        text("Press R to Restart", width/2, height/2 + 50);
    }
}

void keyPressed() {
    if (gameOver && (key == 'r' || key == 'R')) {
        resetGame();
    }
}

void resetGame() {
    score = 0;
    lives = 3;
    gameOver = false;
    player = new Player(width/2, height/2);
    asteroids = new ArrayList<BaseAsteroid>();
    powerUps = new ArrayList<PowerUp>();
    explosions = new ArrayList<Explosion>();
    spawnAsteroids();
    spawnPowerUps();
}

void spawnAsteroids() {
    while (asteroids.size() < 5) {
        float x = random(width);
        float y = random(height);
        if (dist(x, y, width/2, height/2) > 100) {
            if (random(1) < 0.7) {
                asteroids.add(new Asteroid(x, y, random(-2, 2), random(-2, 2), random(30, 60)));
            } else {
                asteroids.add(new FastAsteroid(x, y, random(-2, 2), random(-2, 2)));
            }
        }
    }
}

void spawnPowerUps() {
    while (powerUps.size() < 2) {
        float x = random(width);
        float y = random(height);
        if (dist(x, y, width/2, height/2) > 100) {
            powerUps.add(new PowerUp(x, y));
        }
    }
}

void saveHighScore() {
    String[] data = {str(highScore)};
    saveStrings("data/highscore.txt", data);
}

void loadHighScore() {
    try {
        String[] data = loadStrings("data/highscore.txt");
        if (data != null && data.length > 0) {
            highScore = int(data[0]);
        }
    } catch (Exception e) {
        highScore = 0;
    }
}
