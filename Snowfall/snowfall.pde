import ddf.minim.*;
import ddf.minim.effects.*;
import gifAnimation.*;

Minim minim;
AudioPlayer rock;

Gif santaGif;

ArrayList<snowflake> snow = new ArrayList<snowflake>();

int tick = 0;

PImage flake;
PImage tree;
PImage house;
PImage presentPic;
PImage s;

santaMove movingSanta;

int build = 0;

void setup() {
  fullScreen();
  
  flake = loadImage("flake.png");
  tree = loadImage("tree.png");
  house = loadImage("house.png");
  presentPic = loadImage("present.png");
  
  minim = new Minim(this);
  rock = minim.loadFile("rock.mp3", 2048);
  
  santaGif = new Gif(this, "santa.gif");
  s = loadImage("santa.gif");
  
  movingSanta = new santaMove();
}

void draw() {
  fill(255);
  System.gc();
  background(0);
  
  movingSanta.santaTR();
  
  tick++;
  
  //println(floor(map(mouseX, 0, width, 1, 10)));
  
  
  if(tick % floor(random(1, 5)) == 0) { 
  snow.add(new snowflake(random(0, width), //X
                          -20, //Y
                          (int)random(1, 10) + (int)random(1, 10), //Size
                          flake, //Picture
                          (int)random(1, 500)) ); //Present chance
  }
  
  for(int i = 0; i <= snow.size() - 1; i++) {
    snowflake test = snow.get(i);
    
    if(test != null) {
      test.update();
      test.show();
    } 
    
    
    if(test.pos.y >= height - (build / 500) - 60 && test.p == true) {
      println("go");
      test.pos.y = height - (build / 500) - 60;
      test.stop(); 
    }
    if(test.pos.y >= height + 20 && test.p == false && test.stop1 == false) {
         test.destroy();
         snow.remove(test);
         build++;
     }
  }
  
  /*
  //How many snowflakes exist
  
  pushMatrix();
  fill(255);
  textSize(30);
  text(snow.size(), 0, 50);
  popMatrix();
  */
  
  
  
  buildUp();
  
  /*
  //Height max of 100
  
  pushMatrix();
  textSize(96);
  fill(0);
  text("*=~=* Merry Christmas *=~=*", (width/2)-(textWidth("*=~=* Merry Christmas *=~=*")/2), height - 20);
  popMatrix();
  */
  
  scene();
  
}