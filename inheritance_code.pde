Character[] characters;
Pikachu[] Pikas;

void setup() {
  size(1200, 1200);
  background(255);

  characters = new Character[5];
  Pikas = new Pikachu[3];
  
  // 라이츄 생성
  int raichuX = width * 3 / 4 + 10;
  int raichuY = height / 4;
  int raichuSize = 80;
  Pikas[0] = new Raichu(raichuX, raichuY, raichuSize);

  // 피카츄 생성
  int pikachuX = width / 2 - 10;
  int pikachuY = height / 4;
  int pikachuSize = 70;  
  Pikas[1] = new Pikachu(pikachuX, pikachuY, pikachuSize);

  // 피츄 생성
  int pichuX = width / 4 - 20;
  int pichuY = height / 4;
  int pichuSize = 50; 
  Pikas[2] = new Pichu(pichuX, pichuY, pichuSize);

  // 부모 캐릭터 생성
  float parentX = width / 4;
  float parentY = height / 2;
  float parentSize = 120; 
  characters[0] = new Character(parentX, parentY, parentSize);

  // 첫 번째 자식 캐릭터 생성 (모자 캐릭터)
  float hatX = width / 2;
  float hatY = height / 2 ;
  float hatSize = 120; 
  float hatOffsetY = hatSize * 0.5; // 모자가 머리에 붙는 위치 조정
  characters[1] = new HatCharacter(hatX, hatY, hatSize, hatOffsetY);

  // 두 번째 자식 캐릭터 생성 (머리 캐릭터)
  float hairX = width * 3 / 4;
  float hairY = height / 2 ; 
  float hairSize = 120; // 캐릭터 크기를 120으로 조정
  characters[2] = new HairCharacter(hairX, hairY, hairSize);
  
  // 세 번째 자식 캐릭터 생성 (노인 캐릭터)
  float oldX = width / 4;
  float oldY = height * 3 / 4 - 50; 
  float oldSize = 120;  
  characters[3] = new OldCharacter(oldX,oldY,oldSize);

  // 네 번째 자식 캐릭터 생성 (약한 캐릭터)
  float weakX = width / 2;
  float weakY = height  * 3 / 4 - 50; 
  float weakSize = 120;  
  characters[4] = new WeakCharacter(weakX,weakY,weakSize);
}

void draw() {
  background(255);

  // 캐릭터 그리기
  for (Character character : characters) {
    character.display();
  }
  for (Pikachu Pikachu : Pikas) {
    Pikachu.display();
  }
}
// 피카츄 그림 class
class Pikachu {
  float x;
  float y;
  float a, b, r, s;

  Pikachu(float startX, float startY, float size) {
    x = startX;
    y = startY;
    s = size;
  }
  void pikachuear(){
  ellipse(x-0.8*s,y-s,s*0.45,s*2);//귀, 노
  ellipse(x+0.8*s,y-s,s*0.45,s*2);
  circle(x,y,2.5*s);//얼굴, 노
  fill(0,0,0);//검
  arc(x-s*0.8,y-s*1.5,s*0.38,s*1.05,PI,PI*2);//귀 끝, 검
  arc(x+s*0.8,y-s*1.5,s*0.38,s*1.05,PI,PI*2);
  }
  void drawface(){
  fill(0,0,0);//검
  daeching(s*0.6,s*0.45,s*0.6, x, y);//눈, 검
  triangle(x-s*0.1,y+s*0.1,x+s*0.1,y+s*0.1,x,y+s*0.2);//코, 검
  fill(255,255,255);//흰
  daeching(s*0.55,s*0.55,s*0.25, x, y);//눈동자, 흰
  fill(255,255,0);//노
  noFill();
  bezier(x-s*0.35,y+s*0.5,x-s*0.2,y+s*0.6,x-s*0.1,y+s*0.6,x,y+s*0.5);//입
  bezier(x+s*0.35,y+s*0.5,x+s*0.2,y+s*0.6,x+s*0.1,y+s*0.6,x,y+s*0.5);
  }
  void drawball(){
  daeching(s*0.85,-s*0.55,s*0.5, x, y);// 볼, 빨
  }
  void daeching(float a,float b,float r, float x, float y){ // 대칭인 원 그리기 
  //(기준 x로 부터의 거리,기준 x로 부터의 거리,원의 크기,기준x, 기준y)
   x=x-a;
   y=y-b;
   circle(x,y,r);
   x=x+a*2;
   circle(x,y,r);
  }
  void display(){
    fill(255,255,0);//배경색, 노
    pikachuear();
    drawface();
    fill(255,0,0);//빨
    drawball();
  }
}

class Pichu extends Pikachu{
  Pichu (int startX, int startY, int size) {
  super(startX, startY, size);
  }
  void pichuear(){
  fill(0,0,0);//검
  quad(x-1.6*s,y-2.5*s, x-1.5*s,y-0.9*s, x-0.5*s,y-0.5*s, x-0.3*s,y-1.6*s);//귀끝, 검
  quad(x+1.6*s,y-2.5*s, x+1.5*s,y-0.9*s, x+0.5*s,y-0.5*s, x+0.3*s,y-1.6*s);//귀끝, 검
  fill(247,245,99);//배경색, 연노
  quad(x-1.4*s,y-2.15*s, x-1.28*s,y-0.82*s, x-0.5*s,y-0.5*s, x-0.34*s,y-1.45*s);//귀, 노
  quad(x+1.4*s,y-2.15*s, x+1.28*s,y-0.82*s, x+0.5*s,y-0.5*s, x+0.34*s,y-1.45*s);//귀, 노
  fill(0,0,0);//검
  triangle(x-1.53*s,y-2.22*s,x-1.28*s,y-1.92*s,x-1.38*s,y-2.32*s);
  triangle(x+1.53*s,y-2.22*s,x+1.28*s,y-1.92*s,x+1.38*s,y-2.32*s);
  fill(247,245,99);//배경색, 연노
  circle(x,y,2.5*s);//얼굴, 노
  }
  void display(){
  fill(247,245,99);//배경색, 연노
  pichuear();
  super.drawface();
  fill(255,0,0);
  super.drawball();
  }  
}

class Raichu extends Pikachu{

  Raichu (int startX, int startY, int size) {
  super(startX, startY, size);
  } 
  void raichuear(){
  fill(74,60,42);//귀, 갈색
  arc(x+s*1.1,y-s*1.5,s*1.38,s*1.65,PI *3/7,PI*11/7);
  arc(x-s*1.1,y-s*1.5,s*1.38,s*1.65,radians(257), radians(470));
  fill(247,245,99);//귀, 연노
  arc(x+s*1.9,y-s*1.5,s*2.38,s*2.15, PI * 7/10 ,PI * 13/10);
  arc(x-s*1.9,y-s*1.5,s*2.38,s*2.15, radians(306), radians(416));
  fill(255,255,255);//귀, 흰
  arc(x+s*2.7,y-s*1.5,s*3.6,s*3, PI * 20/25 ,PI * 30/25);
  arc(x-s*2.7,y-s*1.5,s*3.6,s*3, radians(325), radians(395));
  fill(247,133,10);//배경색, 주황
  circle(x,y,2.5*s);//얼굴, 주
  }
  void display(){
  fill(247,133,10);//배경색, 주황
  raichuear();
  super.drawface();
  fill(247,245,99);//볼, 연노
  super.drawball();
  }  
}

// 캐릭터 그림 class
class Character {
  float x;
  float y;
  float size;

  Character(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
    drawFace();
    drawMouth();
  }

  void drawFace() {
    // 얼굴 그리기
    fill(255, 220, 170);
    circle(x, y, size);

    // 왼쪽 눈 그리기
    fill(250, 250, 250);
    float leftEyeX = x - size * 0.2;
    float leftEyeY = y - size * 0.1;
    circle(leftEyeX, leftEyeY, size * 0.3);

    // 왼쪽 눈동자 그리기
    fill(0, 0, 0);
    circle(leftEyeX, leftEyeY, size * 0.12);

    // 오른쪽 눈 그리기
    float rightEyeX = x + size * 0.2;
    float rightEyeY = y - size * 0.1;
    fill(250, 250, 250);
    circle(rightEyeX, rightEyeY, size * 0.3);

    // 오른쪽 눈동자 그리기
    fill(0, 0, 0);
    circle(rightEyeX, rightEyeY, size * 0.12);

    // 코 그리기
    float noseX = x;
    float noseY = y + size * 0.15;
    fill(255, 0, 0);
    circle(noseX, noseY, size * 0.1);
  }

  void drawMouth() {
    // 입 그리기
    float mouthX = x;
    float mouthY = y + size * 0.3;
    fill(0);
    circle(mouthX, mouthY, size * 0.25);
  }
}

class HatCharacter extends Character {
  float offsetY; // 모자의 Y 오프셋

  HatCharacter(float x, float y, float size, float offsetY) {
    super(x, y, size);
    this.offsetY = offsetY;
  }

  void display() {
    super.display(); // 얼굴과 입을 먼저 그립니다.
    drawHat(); // 그 후 모자를 그립니다.
  }

  void drawHat() {
    // 모자 그리기
    float hatX = x;
    float hatY = y - size * 0.8 + offsetY; // Y 오프셋을 적용하여 머리에 붙도록 조정
    float hatWidth = size * 0.8;
    float hatHeight = size * 0.4;

    // 모자 윗부분 그리기
    fill(0, 0, 255);
    beginShape();
    vertex(hatX - hatWidth / 2, hatY);
    vertex(hatX - hatWidth * 0.3, hatY - hatHeight);
    vertex(hatX + hatWidth * 0.3, hatY - hatHeight);
    vertex(hatX + hatWidth / 2, hatY);
    endShape(CLOSE);

    // 모자 둘레 그리기
    fill(0, 0, 255);
    arc(hatX, hatY, hatWidth, hatHeight, PI, TWO_PI);
  }
}

class HairCharacter extends Character {
  HairCharacter(float x, float y, float size) {
    super(x, y, size);
  }

  void drawFace() {
    super.drawFace();

    // 왼쪽 귀 그리기
    fill(0);
    ellipse(x - size * 0.35, y - size * 0.4, size * 0.4, size * 0.4); 

    // 오른쪽 귀 그리기
    ellipse(x + size * 0.35, y - size * 0.4, size * 0.4, size * 0.4); 
    // 머리 그리기
    fill(0);
    ellipse(x, y - size * 0.5, size * 0.8, size * 0.6);   
  }
}

class OldCharacter extends Character {
  OldCharacter(float x, float y, float size){
    super(x,y,size);
  }
  
  void drawWrinkle(){
    line(x-15,y+20,x-30,y+45);
    line(x+15,y+20,x+30,y+45);
    noFill();
    beginShape();
    curveVertex(x-20,y-45);curveVertex(x-20,y-45);
    curveVertex(x-10,y-40);curveVertex(x,y-45);curveVertex(x+10,y-50);
    curveVertex(x+20,y-45); curveVertex(x+20,y-45);
    endShape();
     beginShape();
    curveVertex(x-20,y-40);curveVertex(x-20,y-40);
    curveVertex(x-10,y-35);curveVertex(x,y-40);curveVertex(x+10,y-45);
    curveVertex(x+20,y-40); curveVertex(x+20,y-40);
    endShape();
    beginShape();
    curveVertex(x-20,y-35);curveVertex(x-20,y-35);
    curveVertex(x-10,y-30);curveVertex(x,y-35);curveVertex(x+10,y-40);
    curveVertex(x+20,y-35); curveVertex(x+20,y-35);
    endShape();
  }
  void drawFace() {
    super.drawFace();
    drawWrinkle();
  }
}

class WeakCharacter extends Character{
  WeakCharacter (float x, float y, float size){
    super(x,y,size);
  }
  void thin(){
    line (x-30,y+20,x-22,y+30);
    line (x-22,y+30,x-22,y+40);
    line (x+30,y+20,x+22,y+30);
    line (x+22,y+30,x+22,y+40);
  }
  void hair(){
    line(x-15, y-50, x-20,y-70);
    line(x+5, y-50, x+5,y-70);
    line(x+25, y-50, x+25,y-65);
  }
  void drawFace() {
    super.drawFace();
    thin();
    hair();
 }
}

    
