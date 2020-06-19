PImage imgBalloon;
void setup(){
  size(800,600);
  imgBalloon=loadImage("balloon.png"); 
}
int nowN=0;
float[] ballX=new float[200], ballY=new float[200], ballSize=new float[200];
boolean[] ballRelease=new boolean[200];
void draw(){
  background(128,128,255);
  //fill(0); text(nowN, 100,100);
  for(int i=0;i<nowN;i++){
    image(imgBalloon, ballX[i]-ballSize[i]*3/4/2, ballY[i]-ballSize[i], ballSize[i]*3/4, ballSize[i]);
    if(ballRelease[i]==true)ballY[i]-=3;
    if(ballY[i]-ballSize[i]<0)ballY[i]=ballSize[i];
    if(ballRelease[i]==false) ballSize[i]*=1.07;
  }
}
void mousePressed(){
  if(mouseButton==LEFT){
    ballX[nowN]=mouseX;
    ballY[nowN]=mouseY;
    ballSize[nowN]=10;
    ballRelease[nowN]=false;
    nowN++;
  }else{
    for(int i=0;i<nowN;i++){
      if(dist(mouseX, mouseY, ballX[i], ballY[i])<ballSize[i]){
        background(255,0,0);
    for(int k=i+1; k<nowN; k++){
          ballX[k-1]=ballY[k];
          ballY[k-1]=ballY[k];
          ballSize[k-1]=ballSize[k];
        }
        nowN--;
      }
    }
  }
}
void mouseReleased(){
  if(mouseButton==LEFT) ballRelease[nowN-1]=true;
}
