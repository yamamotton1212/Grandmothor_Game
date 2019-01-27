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


class Mush{
  void display(){
    rect(395,90,60,60);
    
    //To do
  }
  
  void move(){
  //To do
  }
  
}


class Key{
  int x = 425,y=105;
  boolean touch = false;
  
    void display(){
      
      stroke(255,241,15);
      strokeWeight(3);
      fill(255,241,15);
      ellipse(x,y,20,20);
      line(x,y+10,x,y+40);
      line(x,y+22,x+10,y+22);
      line(x,y+28,x+10,y+28);
      strokeWeight(1);
      fill(255);
      stroke(0);
      
  }
  void hit(int hx,int hy){
    if(dist(x,y+22,hx,hy) <= 30) touch = true;
  }
  
  void move(){
  //To do
  }
  
}
