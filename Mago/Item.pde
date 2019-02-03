//アイテムを制御するクラス

/*
アイテムの表示
 アイテムの表示場所
 
 キノコアイテム
 キノコの効果
 キノコの表示判定
 キノコの動き
 キノコの速さ
 
 
 カギアイテム
 カギの効果
 カギの表示判定
 カギを取得した際の表示
 */


class Box {

  //箱の寸法
  int box_x = 395;
  int box_y = 90;
  int box_w = 60;
  int box_h = 60;

  //箱の表示
  void display() {
    rect(box_x, box_y, box_w, box_h);

    //To do
  }

  void move() {
    //To do
  }
}


class Key {
  int x = 425, y=105;
  boolean touch = false;

  void display() {

    stroke(255, 241, 15);
    strokeWeight(3);
    fill(255, 241, 15);
    ellipse(x, y, 20, 20);
    line(x, y+10, x, y+40);
    line(x, y+22, x+10, y+22);
    line(x, y+28, x+10, y+28);
    strokeWeight(1);
    fill(255);
    stroke(0);
  }
  void get_key_display() {

    x = 800;
    y = 10;
    display();

    fill(0);
    textSize(16);
    text("かくとく！", 700, 30);
    fill(255);
  }
  void hit(int hx, int hy) {
    if (dist(x, y+22, hx, hy+20) <= 20) touch = true;
  }
}
