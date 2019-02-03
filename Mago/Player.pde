//プレイヤークラス：キーボードで操作してスタートからゴールまで行くプレイヤークラス

/* 
 プレイヤーのキャラ表示
 プレイヤーの動き
 プレイヤーの速さ
 プレイヤーの当たり判定
 プレイヤーの落下判定
 
 */

class Player {

  //入力キーの状態を格納する変数
  boolean keyUp;
  boolean keyLeft;
  boolean keyRight;



  //プレイヤーがジャンプ中の上昇時にtrue、下降時にfalse
  boolean jumpheight = false;

  //プレイヤーがいくつジャンプしているか
  int jumpdistance = 0;

  //プレイヤーの初期位置の変数
  int x;
  int y;

  //プレイヤーの移動距離x
  int dx = 0;


  //プレイヤーの空中判定
  boolean pjump = false;

  //プレイヤーが描かれた道の上にいるかどうか。いない時にfalse
  boolean landingLine = false;

  //プレイヤーの初期位置のコンストラクタ 三つ目は仮
  Player(int x0, int y0, int dx0) {
    x = x0;
    y = y0;

    dx = dx0;
  }

  PImage img = loadImage("obaa.png");

  //キャラの表示
  void display() {

    image( img, x-20, y);

    //画面上でのプレイヤーの座標が0より大きい時
    if ( x >= 0) x = x % width;
    //画面上でのプレイヤーの座標が0より小さい時
    else             x = width + x;
  }


  //プレイヤーのステージ上での移動
  void stage_move(boolean drawroad, float  y0) {

    //道が描かれているとき
    if (drawroad == true) {

      //道の上にいるとき
      if (landingLine == true) {
        move();
        y =  int(y0);
        pjump = false;
      }
      //道の上にいないとき
      else {
        move();
      }
    } 
    //道がないとき
    else {
      move();
    }
  }

  //プレイヤーの移動
  void move() {


    //左を押した時の動き
    if ((keyLeft)!=false) {
      //表示されているxの移動
      x -= 2;
      //xの移動距離
      dx -= 2;


      //左の壁(x = 0)に当たった時に移動しないようにする（移動距離が０になったら仮）
      if (dx<0) {
        //プレイヤーの表示位置
        x=0;
        //プレイヤーの移動距離
        dx = 0;
      }
    }
    //右を押した時の動き
    if ((keyRight)!=false) {
      //表示されているxの移動
      x += 2;
      //xの移動距離
      dx += 2;


      //右の壁(x = width)に当たった時に移動しないようにする（移動距離が2000になったら仮）
      if (dx >= width * 3) {
        //プレイヤーの表示位置
        x = width - 1;
        //プレイヤーの移動距離
        dx = width * 3 - 1;
      }
    }
  }



  //プレイヤーのジャンプ動作初動
  void jamp_start() {

    //上が押されている時
    if ((keyUp)!= false) {
      //ジャンプしていない時（pjumpはプレイヤーがジャンプして空中にいるかどうかの判定）
      if (pjump == false) {
        pjump = true;
        landingLine = false;
        jumpheight = true;
      }
    }
  }


  //プレイヤーのジャンプ動作(引数はジャンプの上昇値,　ジャンプの高さ)
  void jamp_move(int dy, int j_dist) {

    //プレイヤーが空中にいる時
    if (pjump == true) {

      //
      if ( jumpheight == true) {
        y -= dy;
        jumpdistance += dy;
      }
      //
      if (jumpdistance >= j_dist) {
        jumpheight = false;
        jumpdistance = 0;
      }
      //
      if (keyUp == false) {
        jumpheight = false;
        jumpdistance = 0;
      }

      //
      if (jumpheight == false ) {
        y += dy;
      }
    }
  }


  //プレイヤーの着地判定(道生成の有無、キャラのいる位置での道の止まるy座標、道の始点、道の終点、もともとあるステージのy座標)
  void Landing( boolean drawroad, int x0, int y0, float sx, float mx, int stage_y) {


    //距離を測るためのx座標の大小を比べるための変数
    float smallx;
    float largex;

    if (sx >= mx) {
      largex = sx;
      smallx = mx;
    } else {
      largex = mx;
      smallx = sx;
    }


    //道が引かれている時
    if (drawroad == true) {

      //キャラが道の範囲内にいる時
      if (x >= smallx && x <= largex) {


        //プレイヤーのx,y座標と線の着地位置のx,y座標間の距離が4以下の時　かつ　ジャンプ中の時   かつ　下降中の時     
        if ( dist(x, y, x0, y0)  <= 4 && pjump == true  && jumpheight == false) {
          if (y <= stage_y) pjump = false;
          landingLine = true;
        }
        //そうでない時
        else {
          pjump = true;
          if (dist(x, y, x, stage_y) <= 50 && dist(x, y, x, stage_y) >= 45 && y <= stage_y) {
            if (y <= stage_y)  pjump = false;
         
          }
        }
      }

      //キャラが道の範囲外の時
      else if (x <= smallx || x >= largex) {

        pjump = true;
        landingLine = false;

        if ( dist(x, y, x, stage_y) <= 50 && dist(x, y, x, stage_y) >= 45) {
          pjump = false;
        }
      }
    }

    //道が引かれていない時
    else {
      pjump = true;
      landingLine = false;


      if (dist(x, y, x, stage_y) <= 50 && dist(x, y, x, stage_y) >= 45) {
        if (y <= stage_y)  pjump = false;
      }
    }
  }



  //線を引かれた時のキャラの着地位置(y座標)
  float p_stop(float x0, float y0, float x1, float y1) {

    //線の傾きの変数
    float a; 

    if (x0 - x1 == 0) a = 0;
    else                       a =  ( y0  -  y1 ) / (x0 - x1);

    //接点
    float b = y0 - x0 * a;

    //着地位置のy座標
    float y = (x * a + b);



    return int(y)-50;
  }


  //キャラのあたり判定
  void hit() {
    //To do
  }

  //キャラの落下判定
  void isdead() {
    //To do
  }

  //プレイヤー内で使う関数
  //プレイヤーの入力キー判定
  void keyPressed() {
    if (key == CODED) {
      switch(keyCode) {

      case UP:
        keyUp =true;
        break;

      case LEFT:
        keyLeft=true;
        break;

      case RIGHT:
        keyRight=true;
        break;
      }
    }
  }
  void keyReleased() {
    if (key == CODED) {
      switch(keyCode) {

      case UP:
        keyUp=false;
        break;

      case LEFT:
        keyLeft=false;
        break;

      case RIGHT:
        keyRight=false;
        break;
      }
    }
  }
}
