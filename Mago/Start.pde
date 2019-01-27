class Start{
  
  PImage img = loadImage("utyu.jpg");
  
  boolean start = false;
  
  void display(){
    image(img, 0, 0, width, height);
    //background(255);
    //fill(0);
    textSize(50);
    text("あああああ",width/2-150, height/2+45);
    textSize(15);
  }
  
 void keyPressed(){
      if(key == ENTER || key == RETURN){
        start = true;
      }
 }
  
}
