//ステージクラス :スタート、ゴール、障害物をステージ毎に生成するクラス

/*
大まかなステージのレイアウトのクラス
 スタート、ゴール、障害物のクラス
 
 */

class Stage {


  //ドアのオープン判定
  boolean dooropen = false;

  //ステージ３にいるかどうかの判定（鍵とドアに使用）
  boolean stage3_judge = false;

  //プレイヤーの移動距離に応じた画面の移動の変数
  int sm = 0;

  //ステージ1

  //1ステージの始点
  int s1sx = 0 ;
  int s1sy = height- 20 ;
  //1ステージの終点
  int s1gx = width;
  int s1gy = height - 20 ;

  //ステージ2

  //2ステージの始点(1)
  int s2sx = width + 0;
  int s2sy = height - 20;

  //2ステージの終点(1)
  int s2gx = 200+ width;
  int s2gy = height - 20;

  int s2sx_2 = 600 + width;
  int s2sy_2 = height -20;

  int s2gx_2 = width + width;
  int s2gy_2 = height -20;

  int s2sx_3 = 220 + width;
  int s2sy_3 = height - 100;

  int s2gx_3 = 550 + width;
  int s2gy_3 = height - 100;

  int s2sx_4 = width + 50;
  int s2sy_4 = height - 250;

  int s2gx_4 = 100 + width;
  int s2gy_4 = height -250;

  //ステージ３

  int s3sx = width * 2 + 0;
  int s3sy = height - 20;

  int s3gx = width * 2 + 200;
  int s3gy = height -20;

  int s3sx_2 = width * 2 + 400;
  int s3sy_2 = height - 200;

  int s3gx_2 = width * 2 + 450;
  int s3gy_2 = height - 200;

  int s3sx_3 = 800 + width * 2;
  int s3sy_3 = height - 20;

  int s3gx_3 = width * 2 + width;
  int s3gy_3 = height  - 20;


  //ステージ表示
  void stagedisplay() {
    background(67, 135, 233);

    line(s1sx - sm, s1sy, s1gx - sm, s1gy);

    line(s2sx - sm, s2sy, s2gx - sm, s2gy);
    line(s2sx_2 - sm, s2sy_2, s2gx_2 -sm, s2gy_2);
    line(s2sx_3 - sm, s2sy_3, s2gx_3 -sm, s2gy_3);
    line(s2sx_4 - sm, s2sy_4, s2gx_4 -sm, s2gy_4);

    line(s3sx - sm, s3sy, s3gx - sm, s3gy);
    line(s3sx_2 - sm, s3sy_2, s3gx_2 -sm, s3gy_2);
    line(s3sx_3 - sm, s3sy_3, s3gx_3 -sm, s3gy_3);
  }

  //ドアの表示
  void doordisplay() {

    //ドアが閉まっている時
    if (dooropen == false) fill(136, 111, 67);

    //ドアが開いている時
    else fill(0);

    rect(width-100, height-100, 80, 80);

    //
    if (dooropen == false) {
      line(width-60, height-100, width-60, height-20);
      ellipse(width-70, height-50, 10, 10);
      ellipse(width-50, height-50, 10, 10);
    }
  }

  //プレイヤーのx座標を受け取ってステージに対応するy座標を返す
  int stage1_y(int pdx, int py) {



    if (s1sx  <= pdx && pdx <= s1gx) {
      return s1sy;
    } else if (s2sx  <= pdx && pdx <= s2gx ) {

      if ( dist(pdx, py, pdx, s2sy_4) <= 1) {
        if (s2sx_4 <= pdx && pdx <= s2gx_4) {
          return s2gy_4;
        }
      }
      return s2gy;
    } else if (s2sx_2  <= pdx && pdx<=s2gx_2 ) {
      return s2gy_2;
    } else if (s2sx_3 <= pdx && pdx <= s2gx_3 ) {
      return s2gy_3 ;
    } else if (s3sx  <= pdx && pdx<=s3gx ) {
      return s3gy;
    } else if (s3sx_2 <= pdx && pdx <= s3gx_2 ) {
      return s3gy_2 ;
    } else if (s3sx_3  <= pdx && pdx<=s3gx_3 ) {
      return s3gy_3;
    }
    return 400;
  }

  //ドアの開閉の関数（引数はプレイヤーの座標）
  void hit(int hx, int hy) {

    //プレイヤーとドアの距離が30以下の時かつ三面にいる時
    if ( dist( width-60, height-50, hx, hy ) <= 30  && stage3_judge == true) {
      dooropen = true;
    }
  }

  //ステージの移り変わり関数(引数はプレイヤーの移動距離)
  void stageMove(int px) {

    //プレイヤーが一面にいる時
    if (px >= 0 && px < width) {
      sm = 0;
      stage3_judge = false;
    }
    //プレイヤーが二面にいる時
    else if (px <=  width * 2) {
      sm = width;
      stage3_judge = false;
    } 
    //プレイヤーが三面にいる時
    else if (px <= width * 3) {
      sm = width * 2;
      stage3_judge = true;
    }
  }
}
