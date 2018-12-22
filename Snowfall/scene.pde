PVector buildSnow = new PVector(0, 900);

void buildUp() {
  
    //println("false: build: " + build + " Y: " + buildSnow.y);
  pushMatrix();
  fill(255);
  rect(buildSnow.x, buildSnow.y, width, height);
  fill(255);
  noStroke();
  popMatrix();
  
  if(buildSnow.y > height - 100) {
    //println("true: build: " + build + " Y: " + buildSnow.y);
    buildSnow.y = height - (build / 500) - 25;
    //buildSnow.y = height - 100;
  }
}

void scene() {
  pushMatrix();
  image(house, (width/4) - 350, height-(house.height/1.75)+5, house.width/1.75, house.height/1.75); 
  
  image(tree, (width/2) + 150, height-(tree.height/1.5), tree.width/1.5, tree.height/1.5);
  popMatrix();
}