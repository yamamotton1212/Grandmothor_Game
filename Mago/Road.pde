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


  //float mouse_x ;
 // float mouse_y ;

int mouse_x;
int mouse_y;

  //道が描かれているかどうかの判定
  boolean drawroad = false;

  //線を描く関数
  void drawline() {
    //マウスが押されている時線を引く
    if (mousePressed == true) {
      drawroad = true;
      //if (dist(x0, y0, mouseX, mouseY) <= 200) {

      line(x0, y0, mouseX, mouseY);

      mouse_x = mouseX;
      mouse_y = mouseY;


      text("x0 = ", 400, 100);
      text(x0, 430, 100);

      text("y0 = ", 400, 120);
      text(y0, 430, 120);

      text("mouseX = ", 400, 140);
      text(mouseX, 460, 140);

      text("mouseY = ", 400, 160);
      text(mouseY, 460, 160);

      //To do
      // } else {
      // line(x0, y0, mouse_x, mouse_y);
      // }
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
