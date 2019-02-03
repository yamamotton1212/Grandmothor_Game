//道クラス:マウスのドラッグで道を生成するクラス

/*
線をひくメソッド（ドラッグ）
 線の描ける長さがの設定
 線の色
 線の太さ
 線の効果
 線の耐久度
 線のあたり判定
 
 */


//道を描くクラス
class Road {

  //線の始点の変数
  float x0;
  float y0;

  int mouse_x;
  int mouse_y;

  //道が描かれているかどうかの判定
  boolean drawroad = false;

  //線を描く関数
  void drawline() {
    //マウスが押されている時線を引く
    if (mousePressed == true) {
      drawroad = true;

      line(x0, y0, mouseX, mouseY);

      mouse_x = mouseX;
      mouse_y = mouseY;
    } 
    //押されていない時線の始点を設定
    else {
      drawroad = false;
      x0 = mouseX;
      y0 = mouseY;
    }
  }

  //線の当たり判定
}
