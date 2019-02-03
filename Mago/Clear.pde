//ステージクリア画面クラス

class Clear {

  PImage img = loadImage("happy.png");
  
  void cleardisplay() {

    background(255);
    image(img , 0, 0);

    textAlign(CENTER);

    PFont  font = createFont("Yu Gothic", 64, true);
    textFont(font);

    textSize(64);
    fill(100);
    text("クリアー", width/2+80, height/2);
  }
}
