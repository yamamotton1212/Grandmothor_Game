//スタート画面クラス

class Start {

  //画像の読み込み
  PImage img = loadImage("bba.png");
  PImage img2 = loadImage("boy.png");

  //ゲームスタートの判定（falseでゲーム画面表示、trueでゲームプレイ画面表示）
  boolean start = false;

  //画面表示
  void display() {

    background(67, 135, 233);
    //画像の挿入
    image(img, 0, 0);
    image(img2, width/2, 0);

    //四角い枠の表示
    fill(255, 128);
    rect(width/2-190, height/2+70, 400, 70);

    //テキストを表示
    PFont  font = createFont("Yu Gothic", 64, true);
    textFont(font);
    textAlign(CENTER);
    fill(0);

    textSize(60);

    drawOutlineText("お婆ちゃんと一緒!!!!", width/2, 0, 100, color(255), color(0));


    textSize(45);
    text("クリックスタート !", width/2, height/2+120);
    textSize(15);
  }

  void drawOutlineText(String text, float x, float y, int size, int fgColor, int bgColor) {
    float outlineWidth = (float)(size / 24.0);
    textSize(size);
    fill(bgColor);
    text(text, x - outlineWidth, y + size - outlineWidth);
    text(text, x + outlineWidth, y + size - outlineWidth);
    text(text, x - outlineWidth, y + size + outlineWidth);
    text(text, x + outlineWidth, y + size + outlineWidth);
    fill(fgColor);
    text(text, x, y + size);
  }

  //スタートボタンクリック時の動作
  void mouseReleased() {

    //クリック時のマウスの場所が白い枠内だった時
    if (mouseX >= width/2-170 && mouseX <= width/2 -170 + 400) {
      if (mouseY >= height/2 + 50 && mouseY <= height/2 + 120 ) {
        start = true;
      }
    }
  }
}
