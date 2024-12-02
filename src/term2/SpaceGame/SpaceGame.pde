// Tiger Yang | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser, fart;
Spaceship s1;
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Rocks> rocks = new ArrayList<Rocks>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
int score, level, rockRate, lpower, lolRate;
boolean play;
Timer lTime, puTime, lolTime; //l = r

void setup() {
  size(800, 800);
  lpower = 3;
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  lolRate = 500;
  lTime = new Timer(rockRate);
  lTime.start();
  lolTime = new Timer(lolRate);
  lolTime.start();
  puTime = new Timer(int(random(5000, 10000)));
  puTime.start();
  laser = new SoundFile(this, "laserSound.wav");
  fart = new SoundFile(this, "fartt.wav");
}

void draw() {
  if (!play) {
    startScreen();
  } else if (play) {
    background(0);
    if (frameCount % 1000 == 0) {
      level++;
      rockRate -= 50;
      lTime.totalTime -= 75;
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 't') {
        powups.remove(pu);
        s1.health += 2;
        s1.laserCount += 1000;
        s1.turretCount ++;
        if (s1.turretCount >= 3) {
          powups.remove(pu);
          s1.health += 20;
          s1.laserCount += 20000;
          score += 10000;
        }
      } else if (pu.intersect(s1) && pu.type == 'a') {
        powups.remove(pu);
        s1.health += 2;
        s1.laserCount += 1000;
        lpower += 5;
      } else if (pu.intersect(s1) && pu.type == 's') {
        powups.remove(pu);
        fart.play();
        fill(255);
        textSize(300);
        text("LOL", width/2, 400);
      } else if (pu.intersect(s1) && pu.type == 'k') {
        powups.remove(pu);
        s1.health += 30;
        s1.laserCount += 30000;
        score += 20000;
      }

      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rocks rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= lpower;
          if (rock.diam < 1) {
            rocks.remove(rock);
            score += 100;
          }
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    if (lTime.isFinished()) {
      rocks.add(new Rocks());
      lTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rocks rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        s1.turretCount = 1;
        score -= 10;
        s1.health -= 100;
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        s1.health -= 1;
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }
}

void keyPressed() {
  if (lolTime.isFinished()) {
    laser.play();
    lolTime.start();
  }
  if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y, lpower));
    s1.laserCount--;
  } else if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x + 30, s1.y, lpower));
    lasers.add(new Laser(s1.x - 30, s1.y, lpower));
    s1.laserCount--;
  } else if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x + 30, s1.y, lpower));
    lasers.add(new Laser(s1.x, s1.y, lpower));
    lasers.add(new Laser(s1.x - 30, s1.y, lpower));
    s1.laserCount--;
  } else {
    lasers.add(new Laser(s1.x + 30, s1.y, lpower));
    lasers.add(new Laser(s1.x, s1.y, lpower));
    lasers.add(new Laser(s1.x - 30, s1.y, lpower));
    s1.laserCount--;
  }
}

void mousePressed() {
  laser.play();
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y, lpower));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-30, s1.y, lpower));
    lasers.add(new Laser(s1.x+30, s1.y, lpower));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x-30, s1.y, lpower));
    lasers.add(new Laser(s1.x, s1.y, lpower));
    lasers.add(new Laser(s1.x+30, s1.y, lpower));
    s1.laserCount--;
  } else {
    lasers.add(new Laser(s1.x-30, s1.y, lpower));
    lasers.add(new Laser(s1.x, s1.y, lpower));
    lasers.add(new Laser(s1.x+30, s1.y, lpower));
    s1.laserCount--;
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(30);
  text("Score: " + score, 100, 36);
  text("Health: " + s1.health, 300, 36);
  text("Level: " + level, 475, 36);
  text("Ammo: " + s1.laserCount, 650, 36);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(60);
  text("Welcome to SpaceGame!", width/2, 200);
  textSize(10);
  text("This game was made by:  Tiger Yang", width/2, 240);
  text("Recommanded to use the spacebar until farther in the game ", width/2, 260);
  text("The powerups will be the big pretty bows", width/2, 280);
  text("The power ups are almost completely random, but they all, except one, guarentee a health boost, ammo boost, and one special other effect", width/2, 300);
  text("You'll know when you see the small colored text above the powerup)", width/2, 320);
  text("One powerup will give you another turret, one will give a massive buff to many things, one increases damage, and one is completely useless", width/2, 340);
  text("You will start with 1 hp, each rock collision will lose 100 hp. Game will be over at 0 health (or less)", width/2, 360);

  textSize(60);
  text("Please click to start! ", width/2, 640);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Gave Over!", width/2, 200);
  text("Score: " + score, width/2, 300);
  text("Level: " + level, width/2, 400);
}

void ticker() {
}
