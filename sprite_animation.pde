import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

PImage bgImg;
Sprite player; //create player (stp.1)
StopWatch sw = new StopWatch();

final float PLAYER_VAL = 1000;
final int PLAYER_STOPPED = 0;
final int PLAYER_LEFT = -1;
final int PLAYER_RIGHT =1;
void setup(){
  size(1000,750);
  bgImg = loadImage("BG.png");
  //(,,col,row,can be any num)
  player = new Sprite(this,"d37899c20bb6dda3da5e1971e2a45f61.png",8,2,1);
  player.setXY(width/2,height/2);
  player.setFrameSequence(7,9,0.1f);

  player.setVelXY(0.0f,0.0f); //velocity value when initiated
  
  player.setDomain(0,0,width,height,Sprite.HALT);
  
  registerMethod("keyEvent",this); //method for keyboard control
  
  registerMethod("pre",this);
  
}
void pre(){
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
}
void keyEvent(KeyEvent e){
  if(key == CODED){
    switch(keyCode){
    case DOWN:
    case UP:
    player.setVelX(0);
    player.setFrameSequence(7,9,0.3f);
    break;
    case LEFT:
    player.setVelX(PLAYER_VAL*PLAYER_LEFT);
    player.setFrameSequence(9,16,0.05f);
    

    break;
    case RIGHT:
    player.setVelX(PLAYER_VAL*PLAYER_RIGHT);
      player.setFrameSequence(0,8,0.05f);

    break;
    }
  }
}
void draw(){
  background(bgImg);
  S4P.drawSprites();
}
