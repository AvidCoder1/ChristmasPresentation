class santaMove {
  PVector sPos, sVel;
  
  void santaTL() {
    if(tick % 4 == 0) {
      //santaGif.play();
      santaGif.loop();
    }
    else {
      santaGif.pause();
    }
    pushMatrix();
    image(santaGif, 0, 0);
    popMatrix();
  }
  
  void santaTR() {
    if(tick % 4 == 0) {
      //santaGif.play();
      santaGif.loop();
    }
    else {
      santaGif.pause();
    }
    pushMatrix();
      scale(-1.0, 1.0);
      image(santaGif, -santaGif.width, 0);
    popMatrix();
  }
}