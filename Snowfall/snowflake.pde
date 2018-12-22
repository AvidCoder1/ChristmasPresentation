class snowflake {
  PVector pos, acc, vel, wind;
  
  int size;
  
  int pWidth;
  int pHeight;
  
  float aCoef = 0.0001;
  
  boolean p = false;
  
  boolean stop1 = false;
  
  private PImage flake;
  
  snowflake(float x, float y, int size, PImage flake1, int present) {
     pos = new PVector(x, y);
     acc = new PVector(0, 0);
     //0.005
     wind = new PVector(0,0);
     
     if(present != 250) {
       this.p = false;
       this.size = size;
       acc.add(0, (aCoef * (size * 10)));
       this.flake = flake1;
       vel = new PVector(0, 2);
     }
     else {
       this.p = true;
       this.size = 50; 
       acc.add(0, 0.01);
       this.flake = presentPic;
       vel = new PVector(0, 4);
     }
  }
  
  void show() {
    //ellipse(this.pos.x, this.pos.y, size, size);
    
    image(this.flake, this.pos.x, this.pos.y, size, size);
  }
  
  void stop() {
    stop1 = true;
  }
  
  void update() {
    if(stop1 == false) {
      this.wind.add(random(-0.25, 0.25), random(-0.25, 0.25));
      if(this.wind.x > 2) {
        this.wind.x = 2; 
      }
      else if(this.wind.x < -2) {
        this.wind.x = -2;
      }
      if(this.wind.y > 2) {
        this.wind.y = 2; 
      }
      else if(this.wind.y < -4.25) {
        this.wind.y = -4.25; 
      }
      
      this.pos.add(this.vel);
      this.vel.add(this.acc);
      this.pos.add(this.wind);
      
      if(this.vel.y > 4) {
        this.vel.y = 4; 
      }
    }
  }
  
  void destroy() {
    if(stop1 == false) {
      pos = null;
      acc = null;
      vel = null;
    }
  }
}