//敵クラス：上から降って来る隕石、歩行する敵を制御するクラス

/*
隕石の表示（大きさなど）
 隕石の種類
 隕石の動き（真下に落下、プレイヤーに向かって落下など）
 隕石のあたり判定
 隕石の表示判定
 隕石の落下速度
 
 歩行する敵の表示（大きさなど）
 敵の種類
 歩行する敵の動き（直進、プレイヤーに向かってくるなど）
 敵のあたり判定
 敵の表示判定
 敵のHP
 敵の動く速さ
 
 
 */

//隕石クラス
abstract class Meteo {

  //隕石の出現座標
  float x = int(random(130, width));
  float y = 50;

  //
  boolean judge = false;

  //
  boolean sheeld_judge = false;

  //
  float rx = random(0, width);

  //
  boolean vertical = false;

  //
  float x2;
  float y2;

  //
  float mm2;
  float bb2;

  //
  boolean judge_rect = false;

  //
  int judge_rectt = 0;

  //隕石が描かれた道の上にいるかどうか。いない時にfalse
  boolean landingLine = false;

  PImage img = loadImage("icon-star.png");

  //隕石の表示
  void display() {
    image( img, x, y-13);
  }

  //隕石の当たり判定
  void hit(int hx, int hy) {
    if (dist(x+10, y, hx, hy+10) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+20) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+25) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+30) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+35) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+40) <= 20) judge = true;
    if (dist(x+10, y, hx, hy+45) <= 10) judge = true;
    
  }

  //隕石がボックスに当たった時の関数（引数は箱のx,y座標と幅と高さ）
  void hitbox(int a, int b, int c, int d) {
    if (x >= a && x <= a + c) {
      if (y >= b && y <= b + d) {
        judge_rect = true;
        judge_rectt = 1;
      }
    }
  }

  //シールドに隕石が当たった時の関数
  void sheeld_hit() {

    //

    if ( (x >= mouseX && x <= road.x0) || (x >= road.x0 && x <=mouseX) ) {

      //切片
      float b = - (road.y0 - mouseY) / (road.x0 - mouseX) * road.x0 + road.y0;

      float h = (road.y0 - mouseY) / (road.x0 - mouseX) * x + b;

      //　の時
      if (y + 12.5 >= h - 1 && y + 12.5 <= h + 1) {


        //隕石反射時の傾き
        if ((road.y0 - mouseY)/(road.x0 - mouseX) != 0) {

          float m2 = -1/((road.y0 - mouseY)/(road.x0 - mouseX));

          x2 = x;
          vertical = true;

          float b2 = -m2 * x + y;

          bb2 = b2;
          mm2 = m2;
        } else {
          vertical = true;
          mm2 = 0;
        }
      }
    }
  }


  //
  void land(boolean drawroad, int x0, int y0, float sx, float mx) {

    //受け取った二つのx座標の大小をわかりやすくする変数
    float smallx;
    float largex;

    //二つのx座標の大小を決める
    if (sx >= mx) {
      largex = sx;
      smallx = mx;
    } else {
      largex = mx;
      smallx = sx;
    }

    //シールド（道）が引かれている時
    if (drawroad == true) {

      //隕石が道の範囲内にいる時
      if (x >= smallx && x <= largex) {

        //y座標に重なった時       
        if ( dist(x, y, x0, y0)  <= 4 ) {
          landingLine = true;
        }
        //
        else if (landingLine == true) {
          landingLine = false;
        }
      }
      //隕石が範囲内にいない時
      else if (x < smallx || x > largex) {
        landingLine = false;
      }
    }
    //シールド（道）が引かれていない時
    else {
      landingLine = false;

      //
      if (y >= height-20) {
      }
    }
  }
}

//隕石、継承クラス
class nomalMeteo extends Meteo {

  //
  void move_1() {

    //隕石が下まで行ったらx座標をランダムでまた落とす
    if (y >= height) {
      y = 0;
      x = int( random(0, 350) );
    }

    //
    if (vertical == true) {

      //
      if (mm2>0) {
        x--;
        y = mm2*x + bb2; 
        //
      } else if (mm2<0) {
        x++;
        y = mm2*x + bb2;
      } else if (mm2 == 0) {
        y--;
      }


      //
      if (y <= 0) {
        x = int(random(0, 350));
        vertical = false;
      }
    }
    //
    else y++;
  }

  //
  void move_2() {

    //
    if (y>=height) {
      y=0;
      x = int(random(470, width));
    }

    //
    if (vertical == true) {

      //
      if (mm2>0) {
        x--;
        y = mm2*x + bb2; 
        //
      } else if (mm2<0) {
        x++;
        y = mm2*x + bb2;
      } else if ( mm2 == 0) {
        y--;
      }

      //
      if (y<= 0) {
        x = int( random(470, width) );
        vertical = false;
      }
    }
    //
    else y++;
  }
}


//歩く敵クラス
class Walk_En {

  void disply() {
    //To do
  }

  void move() {
    //To do
  }
}
