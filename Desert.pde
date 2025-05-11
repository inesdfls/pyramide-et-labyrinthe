int iposX = 1;
int iposY = -1;

int posX = iposX;
int posY = iposY;
int mx = 1;
int my = 0;

int H = 0;
int N = H;
int dirX = 0;
int dirY = 1;
int dx = 0;
int dy = 1;
int odirX = 0;
int odirY = 1;
int WALLD = 1;

int anim = 0;
boolean animT=false;
boolean animR=false;

boolean inLab = true;

int LAB_SIZE = 21;
int size = LAB_SIZE;
char labyrinthe [][];
char sides [][][];

PShape laby0;
PShape ceiling0;
PShape ceiling1;
PShape pyramide;
PShape momie;
PShape handL, handR;

PImage  texture0;
PImage  texture1;
PImage textureSand;
PImage  textureSol;
PImage  texturePlafond;
PImage  texturePortail;

int cols, rows;
int scl = 20;

float[][] terrain;

void Pyramide(){ //fonction pour créer la pyramide autour des labyrinthes
//textureMode(NORMAL);
texture1 = loadImage("py_stone.jpg");
  pushMatrix();
  translate(-50, -50, -50);
  int Taille = 21; //21 car c'est la taille initiale du LAB_SIZE 
  for(int z = 0; z<=10; z++){ //z<=21 pour la hauteur de la pyramide (rien a voir avec le LAB_SIZE)
    for(int i=0 ; i<=Taille-1; i++){
      for(int j=0; j<=Taille-1; j++){
        if(z==0){
          //boucle spéciale pour l'étage 0 car porte d'entrée :)
          if(i==0){
           beginShape(QUADS);
           texture(texture1);
              vertex(0,Taille*50,0,0,0);
              vertex(0,Taille*50,50*2,0,1);
              vertex(0,0,50*2,1,1);
              vertex(0,0,0,1,0);
            endShape();
          }
            if(i==Taille-1){
             beginShape(QUADS);
             texture(texture1);
                vertex(Taille*50,0,0,1,1);
                vertex(Taille*50,0,50*2,1,0);
                vertex(Taille*50,Taille*50,50*2,0,0);
                vertex(Taille*50,Taille*50,0,0,1);
              endShape();
          }
          if(j==0){
            beginShape(QUADS);
            texture(texture1);
                vertex(120,0,0,0,1);
                vertex(120,0,50*2,0,0);
                vertex(Taille*50,0,50*2,1,0);
                vertex(Taille*50,0,0,1,1);
              endShape();
              beginShape(QUADS);
              texture(texture1);
                vertex(120,0,0,0,1);
                vertex(120,0,50*2,0,0);
                vertex(120,27,50*2,1,0);
                vertex(120,27,0,1,1);
              endShape();
              beginShape(QUADS);
              texture(texture1);
                vertex(0,0,0,0,1);
                vertex(0,0,50*2,0,0);
                vertex(73,0,50*2,1,0);
                vertex(73,0,0,1,1);
              endShape();
               beginShape(QUADS);
               texture(texture1);
                vertex(73,0,0,0,1);
                vertex(73,0,50*2,0,0);
                vertex(73,30,50*2,1,0);
                vertex(73,30,0,1,1);
              endShape();
          }
          if(j==Taille-1){
            beginShape(QUADS);
            texture(texture1);
                vertex(0,Taille*50,0,0,1);
                vertex(0,Taille*50,50*2,0,0);
                vertex(Taille*50,Taille*50,50*2,1,0);
                vertex(Taille*50,Taille*50,0,1,1);
              endShape();
          }
        
        }else{
          if(i==0){
             beginShape(QUADS);
             texture(texture1);
                vertex(0,Taille*50,0,1,1);
                vertex(0,Taille*50,50*2,1,0);
                vertex(0,0,50*2,0,0);
                vertex(0,0,0,0,1);
              endShape();
          }
          if(i==Taille-1){
             beginShape(QUADS);
             texture(texture1);
                vertex(Taille*50,0,0,1,1);
                vertex(Taille*50,0,50*2,1,0);
                vertex(Taille*50,Taille*50,50*2,0,0);
                vertex(Taille*50,Taille*50,0,0,1);
              endShape();
          }
          if(j==0){
            beginShape(QUADS);
            texture(texture1);
                vertex(0,0,0,0,1);
                vertex(0,0,50*2,0,0);
                vertex(Taille*50,0,50*2,1,0);
                vertex(Taille*50,0,0,1,1);
              endShape();
          }
          if(j==Taille-1){
            beginShape(QUADS);
            texture(texture1);
                vertex(0,Taille*50,0,0,1);
                vertex(0,Taille*50,50*2,0,0);
                vertex(Taille*50,Taille*50,50*2,1,0);
                vertex(Taille*50,Taille*50,0,1,1);
              endShape();
          }
        }
      }
      translate(0,0,50*2);
            beginShape(QUADS);
            texture(texture1);
              vertex(0,0,0,0,0);
              vertex(Taille*50,0,0,1,0);
              vertex(Taille*50-25,25,0,1,1);
              vertex(25,25,0,0,1);
            endShape();
            beginShape(QUADS);
            texture(texture1);
              vertex(Taille*50,0,0,0,0);
              vertex(Taille*50,Taille*50,0,0,1);
              vertex(Taille*50-25,Taille*50-25,0,1,1);
              vertex(Taille*50-25,25,0,1,0);
            endShape();
            beginShape(QUADS);
            texture(texture1);
              vertex(Taille*50,Taille*50,0,1,1);
              vertex(0,Taille*50,0,0,1);
              vertex(25,Taille*50-25,0,0,0);
              vertex(Taille*50-25,Taille*50-25,0,1,0);
            endShape();
            beginShape(QUADS);
            texture(texture1);
              vertex(0,Taille*50,0,0,1);
              vertex(0,0,0,0,0);
              vertex(25,25,0,1,0);
              vertex(25,Taille*50-25,0,1,1);
            endShape();
      translate(0,0,-50*2);
    }
    Taille = Taille - 1;
    translate(25,25,50*2);
  }
  //le "chapeau" de la pyramide :))
    beginShape(TRIANGLE);
            texture(texture1);
              vertex(0, 0,0,0,0);
              vertex(50*10,0,0,1,0);
              vertex((11*50)/2,(11*50)/2,800,0,1);
              vertex(0,0,0,0,0);
              vertex(0,50*10,0,1,0);
              vertex((11*50)/2,(11*50)/2,800,1,1);
              vertex(0,50*10,0,0,0);
              vertex(50*10,50*10,0,1,0);
              vertex((11*50)/2,(11*50)/2,800,0,1);
              vertex(50*10,50*10,0,0,0);
              vertex(50*10,0,0,1,0);
              vertex((11*50)/2,(11*50)/2,800,1,1);
            endShape();
  translate(50, 50, 50);
  popMatrix();
}

void SortieLAB(int h){
  texturePortail = loadImage("portail.jpg");
  beginShape(QUADS);
    texture(texturePortail);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-20,h*100-71,0,0);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-115,h*100-71,1,0);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-115,h*100+51,1,1);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-20,h*100+51,0,1);
    fill(0,0,0);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25+48,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-20,h*100+51);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25+48,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-105,h*100+51);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25-(width/(LAB_SIZE+H))-150,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-105,h*100+51);
    vertex(h*40+(width/(LAB_SIZE+H))*LAB_SIZE-25-(width/(LAB_SIZE+H))-150,h*40+LAB_SIZE*(width/(LAB_SIZE+H))-(width/(LAB_SIZE+H))-20,h*100+51);
  endShape();
}
void EntreeLAB(int h){
  texturePortail = loadImage("portail.jpg");
  beginShape(QUADS);
    texture(texturePortail);
    vertex(h*40+20,h*40-20,h*100-51,0,0);
    vertex(h*40+(width/(LAB_SIZE+H-N))+35,h*40-20,h*100-51,1,0);
    vertex(h*40+(width/(LAB_SIZE+H-N))+35,h*40-20,h*100+51,1,1);
    vertex(h*40+20,h*40-20,h*100+51,0,1);
    fill(0,0,0);
    vertex(h*40+20,h*40-25,h*100-51);
    vertex(h*40+(width/(LAB_SIZE+H-N))+35,h*40-25,h*100-51);
    vertex(h*40+(width/(LAB_SIZE+H-N))+35,h*40+40,h*100-51);
    vertex(h*40+20,h*40+40,h*100-51);
  endShape();
}

PShape myMummy(){
  noStroke();
  PShape head = createShape();
  PShape eyeL = createShape(SPHERE, 4);
  PShape irisL = createShape(SPHERE, 2);
  PShape eyeR = createShape(SPHERE, 4);
  PShape irisR = createShape(SPHERE, 2);
  PShape body = createShape();
  PShape armL = createShape();
  PShape armR = createShape();
  handR = loadShape("hand2.obj");
  handL = loadShape("hand1.obj");
  PShape all = createShape(GROUP);
  //tete de la momie
  head.beginShape(QUAD_STRIP);
  pushMatrix();
  head.translate(0, -20);
  for (float i = 0; i < 20; i+=0.1){
    float a = 6*i * PI/12;
    float h = i;
    float b = i-10;
    float r = sqrt(15*15-b*b)*0.7;
    float n = 3*noise(i/1.0);
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);
    head.fill(175+n2, 170+n2, 2+n1);
    head.vertex(r*cos(a), h+n, r*sin(a));
    head.fill(175+n1, 170+n1, 2+n2);
    head.vertex(r*cos(a), h+5+n, r*sin(a));
  }
  popMatrix();
  head.endShape();
  all.addChild(head);
  //Oeil gauche
  pushMatrix();
  eyeL.setFill(color(255));
  eyeL.translate(-4, -10, 7);
  eyeL.scale(1, 0.75);
  popMatrix();
  all.addChild(eyeL);
  pushMatrix();
  irisL.setFill(color(0));
  irisL.translate(-8, -7.5, 10);
  irisL.scale(0.6, 1);
  popMatrix();
  all.addChild(irisL);
  //Oeil droit
  pushMatrix();
  eyeR.setFill(color(255));
  eyeR.translate(4, -10, 7);
  eyeR.scale(1, 0.75);
  popMatrix();
  all.addChild(eyeR);
  pushMatrix();
  irisR.setFill(color(0));
  irisR.translate(8, -7.5, 10);
  irisR.scale(0.6, 1);  
  popMatrix();
  all.addChild(irisR);
  //corps de la momie
  body.beginShape(QUAD_STRIP);
  pushMatrix();
  for (float i = 0; i < 80; i+=0.1){
    float a = 6*i * PI/12;
    float h = i;
    float b = i-35;
    float r = (50-abs(b))*0.25 + abs(b)*0.1;
    float n = 3*noise(i/1.0);
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);
    body.fill(175+n2, 170+n2, 2+n1);
    body.vertex(r*cos(a), h+n, r*sin(a));
    body.fill(175+n1, 170+n1, 2+n2);
    body.vertex(r*cos(a), h+5+n, r*sin(a));
  }
  popMatrix();
  body.endShape();
  all.addChild(body);
  //main gauche
  pushMatrix();
  handL.rotateZ(PI);
  handL.rotateY(-PI/12);
  for (int i = 0; i < 1931; i+=50){
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);  
    handL.getChild(i).setFill(color(175+n2, 170+n2, 2+n1));
    for (int j = 1;  j < 50; j++){ 
      if (i + j < 1931) handL.getChild(i+j).setFill(color(175+n2, 170+n2, 2+n1));
    }
  }
  handL.translate(-24, 18, 25);
  popMatrix();
  all.addChild(handL);
  //bras gauche
  armL.beginShape(QUAD_STRIP);
  pushMatrix();
  armL.translate(-8, 15, -5);
  armL.rotateY(-PI/12);  
  for (float i = 0; i < 32; i+=0.1){
    float a = 6*i * PI/12;
    float h = i+5;
    float b = i-16;
    float r = (30-abs(b))*0.2;
    float n = 3*noise(i/1.0);
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);
    armL.fill(175+n2, 170+n2, 2+n1);
    armL.vertex(r*sin(a), r*cos(a), h+n);
    armL.fill(175+n1, 170+n1, 2+n2);
    armL.vertex(r*sin(a), r*cos(a), h+5+n);
  }
  popMatrix();
  armL.endShape();
  all.addChild(armL);
  //main droite
  pushMatrix();
  handR.rotateZ(PI);
  handR.rotateY(PI/12);
  for (int i = 0; i < 1931; i+=50){
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);
    handR.getChild(i).setFill(color(175+n2, 170+n2, 2+n1));
    for (int j = 1;  j < 50; j++){ 
      if (i + j < 1931) handR.getChild(i+j).setFill(color(175+n2, 170+n2, 2+n1));
    }
  }
  handR.translate(24, 18, 25);
  popMatrix();
  all.addChild(handR);
  //bras droit
  armR.beginShape(QUAD_STRIP);
  pushMatrix();
  armR.translate(8, 15, -5);
  armR.rotateY(PI/12);
  for (float i = 0; i < 32; i+=0.1){
    float a = 6*i * PI/12;
    float h = i+5;
    float b = i-16;
    float r = (30-abs(b))*0.2;
    float n = 3*noise(i/1.0);
    float n1 = 60*noise(i/2.0);
    float n2 = 100*noise(i/3.0);
    armR.fill(175+n2, 170+n2, 2+n1);
    armR.vertex(r*sin(a), r*cos(a), h+n);
    armR.fill(175+n1, 170+n1, 2+n2);
    armR.vertex(r*sin(a), r*cos(a), h+5+n);
  }
  popMatrix();
  armR.endShape();
  all.addChild(armR);
  return all;
}

void MDir( int M){
  if(M==1){
    dx = 48;
    dy = 0;
  }else if(M==2){
    dx = -48;
    dy = 0;
  }else if(M==3){
    dx = 0;
    dy = 48;
  }else if(M==4){
    dx = 0;
    dy = -48;
  }
}
  
void setup() { 
  frameRate(100);
  if(H>0 || inLab==true){
    textureMode(IMAGE);
  }else{
    textureMode(NORMAL);
  }
  pixelDensity(2);
  randomSeed(2);
  texture0 = loadImage("stones.jpg");
  textureSol = loadImage("sol.jpg");
  texturePlafond = loadImage("plafond.jpg");
  size(1000, 1000, P3D);
  labyrinthe = new char[LAB_SIZE][LAB_SIZE];
  sides = new char[LAB_SIZE][LAB_SIZE][4];
  int todig = 0;
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      sides[j][i][0] = 0;
      sides[j][i][1] = 0;
      sides[j][i][2] = 0;
      sides[j][i][3] = 0;
      if (j%2==1 && i%2==1) {
        labyrinthe[j][i] = '.';
        todig ++;
      } else
        labyrinthe[j][i] = '#';
    }
  }
  int gx = 1;
  int gy = 1;
  while (todig>0 ) {
    int oldgx = gx;
    int oldgy = gy;
    int alea = floor(random(0, 4)); // selon un tirage aleatoire
    if      (alea==0 && gx>1)          gx -= 2; // le fantome va a gauche
    else if (alea==1 && gy>1)          gy -= 2; // le fantome va en haut
    else if (alea==2 && gx<LAB_SIZE-2)   gx += 2; // .. va a droite
    else if (alea==3 && gy<LAB_SIZE-2)   gy += 2; // .. va en bas

    if (labyrinthe[gy][gx] == '.') {
      todig--;
      labyrinthe[gy][gx] = ' ';
      labyrinthe[(gy+oldgy)/2][(gx+oldgx)/2] = ' ';
    }
  }

  labyrinthe[0][1]                   = ' '; // entree
  labyrinthe[LAB_SIZE-2][LAB_SIZE-1] = ' '; // sortie

  for (int j=1; j<LAB_SIZE-1; j++) {
    for (int i=1; i<LAB_SIZE-1; i++) {
      if (labyrinthe[j][i]==' ') {
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]==' ' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]=='#')
          sides[j-1][i][0] = 1;// c'est un bout de couloir vers le haut 
        if (labyrinthe[j-1][i]==' ' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]=='#')
          sides[j+1][i][3] = 1;// c'est un bout de couloir vers le bas 
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]==' ' && labyrinthe[j][i+1]=='#')
          sides[j][i+1][1] = 1;// c'est un bout de couloir vers la droite
        if (labyrinthe[j-1][i]=='#' && labyrinthe[j+1][i]=='#' &&
          labyrinthe[j][i-1]=='#' && labyrinthe[j][i+1]==' ')
          sides[j][i-1][2] = 1;// c'est un bout de couloir vers la gauche
      }
    }
  }
  // un affichage texte pour vous aider a visualiser le labyrinthe en 2D
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      print(labyrinthe[j][i]);
    }
    println("");
  }
  
  float wallW = width/(LAB_SIZE+H);
  float wallH = height/(LAB_SIZE+H);
  ceiling0 = createShape();
  ceiling1 = createShape();
  
  ceiling1.beginShape(QUADS);
  ceiling0.beginShape(QUADS);
  
  laby0 = createShape();
  laby0.beginShape(QUADS);
  laby0.texture(texture0);
  laby0.noStroke();
  laby0.translate(H*40, H*40, 0);
  ceiling1.translate(H*40, H*40, 0);
  ceiling0.translate(H*40, H*40, 0);
  for (int j=0; j<LAB_SIZE; j++) {
    for (int i=0; i<LAB_SIZE; i++) {
      if (labyrinthe[j][i]=='#') {
        
        laby0.fill((i*25), (j*25), 255-i*10+j*10);
        if (j==0 || labyrinthe[j-1][i]==' ') {
          laby0.normal(0, -1, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex(((i*wallW-wallW/2)+(k+0)*wallW/WALLD), (j*wallH-wallH/2), (l+0)*50/WALLD+100*H, k/(float)WALLD*(texture0.width), (0.5+l/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+1)*wallW/WALLD), (j*wallH-wallH/2), (l+0)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+l/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+1)*wallW/WALLD), (j*wallH-wallH/2), (l+1)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+0)*wallW/WALLD), (j*wallH-wallH/2), (l+1)*50/WALLD+100*H, k/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
            }
        }

        if (j==LAB_SIZE-1 || labyrinthe[j+1][i]==' ') {
          laby0.normal(0, 1, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex(((i*wallW-wallW/2)+(k+0)*wallW/WALLD), (j*wallH+wallH/2), (l+1)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+1)*wallW/WALLD), (j*wallH+wallH/2), (l+1)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+1)*wallW/WALLD), (j*wallH+wallH/2), (l+0)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex(((i*wallW-wallW/2)+(k+0)*wallW/WALLD), (j*wallH+wallH/2), (l+0)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
            }
        }

        if (i==0 || labyrinthe[j][i-1]==' ') {
          laby0.normal(-1, 0, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2+(k+0)*(wallW/WALLD)), (l+1)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2+(k+1)*(wallW/WALLD)), (l+1)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2+(k+1)*(wallW/WALLD)), (l+0)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2+(k+0)*(wallW/WALLD)), (l+0)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
            }
        }

        if (i==LAB_SIZE-1 || labyrinthe[j][i+1]==' ') {
          laby0.normal(1, 0, 0);
          for (int k=0; k<WALLD; k++)
            for (int l=-WALLD; l<WALLD; l++) {
              laby0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2+(k+0)*(wallW/WALLD)), (l+0)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2+(k+1)*(wallW/WALLD)), (l+0)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+0)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2+(k+1)*(wallW/WALLD)), (l+1)*50/WALLD+100*H, (k+1)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
              laby0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2+(k+0)*(wallW/WALLD)), (l+1)*50/WALLD+100*H, (k+0)/(float)WALLD*(texture0.width), (0.5+(l+1)/2.0/WALLD)*texture0.height);
            }
        }
        ceiling1.fill(32, 255, 0);
        ceiling1.vertex((i*wallW-wallW/2), (j*wallH-wallH/2), 50+100*H);
        ceiling1.vertex((i*wallW+wallW/2), (j*wallH-wallH/2), 50+100*H);
        ceiling1.vertex((i*wallW+wallW/2), (j*wallH+wallH/2), 50+100*H);
        ceiling1.vertex((i*wallW-wallW/2), (j*wallH+wallH/2), 50+100*H);
      } else {
        if(i!=0 && j!=0){
        laby0.fill(192); // ground
        //texture(textureSol);
        laby0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2), -50+100*H, 0, 0);
        laby0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2), -50+100*H, 0, 1);
        laby0.vertex((i*wallW+wallW/2), (j*wallH+wallH/2), -50+100*H, 1, 1);
        laby0.vertex((i*wallW-wallW/2), (j*wallH+wallH/2), -50+100*H, 1, 0);
        }
        if(i!=LAB_SIZE-1 && j!=LAB_SIZE-1){
        ceiling0.fill(32); // top of walls
        ceiling0.vertex((i*wallW-wallW/2), (j*wallH-wallH/2), 50+100*H);
        ceiling0.vertex((i*wallW+wallW/2), (j*wallH-wallH/2), 50+100*H);
        ceiling0.vertex((i*wallW+wallW/2), (j*wallH+wallH/2), 50+100*H);
        ceiling0.vertex((i*wallW-wallW/2), (j*wallH+wallH/2), 50+100*H);
        }
      }
    }
  }
  
  laby0.endShape();
  ceiling0.endShape();
  ceiling1.endShape();
  momie = myMummy();
  //Le code qui suit concerne le sol exterieur
  pushMatrix();
  textureMode(NORMAL);
  pixelDensity(1);
  randomSeed(2);
  noiseSeed(0);
  cols = width*10 / scl;
  rows = height*10 / scl;
  terrain = new float[cols][rows];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  textureSand = createImage(512, 512, RGB);
  textureSand.loadPixels();
  for(int j=0; j<512; j++){
    for(int i=0; i<512; i++){
      float r = random(100, 255);
      textureSand.pixels[i+j*textureSand.width] = color(r, r, 0);
    }
  }
  textureSand.updatePixels();
  popMatrix();
}

void draw() {
  background(107, 92, 211);
  //ambientLight(255, 187, 49, 500, 500, -500);
  sphereDetail(6);
  if (anim>0) anim--;
  //LE SOL
  pushMatrix();
  if(inLab == true){
  ambientLight(255, 132, 0, 500, 500, -500);
 fill(255,235,162);
  beginShape(QUADS);
  texture(textureSand);
     vertex(-3000,-3000,-75,0,0);
     vertex(-3000,3000,-75,0,1);
     vertex(3000,3000,-75,1,1);
     vertex(3000,-3000,-75,1,0);
  endShape();
  }else{
  ambientLight(255, 187, 49, 500, 500, -500);
  //directionalLight(255, 255, 255, 500, 500, -500);
  translate(-1000, -1000, -10*6);
  scale(20, 20, 20);
  for (int y = 0; y < rows-1; y++) {
    beginShape(QUAD_STRIP);
    texture(textureSand);
    for (int x = 0; x < cols-1; x++) {
      vertex(x * scl, y * scl, terrain[x][y], 0, 0);
      vertex(x * scl, (y + 1) * scl, terrain[x][y + 1], 0, 1);
      vertex((x + 1) * scl, y * scl, terrain[x + 1][y], 1, 0);
      vertex((x + 1) * scl, (y + 1) * scl, terrain[x + 1][y + 1], 1, 1);
    }
    endShape();
    }
  }
  popMatrix();
  //LA PYRAMIDE
  pushMatrix();
  Pyramide();
  popMatrix();
  pushMatrix();
  if (H>0){
    EntreeLAB(H);
  }
  popMatrix();
  SortieLAB(H);
  //LA MOMIE
  if(H==0){
  pushMatrix();
  translate(width/(LAB_SIZE+H), 20, 10);
  rotateX(-PI/2);
  scale(0.6,0.6,0.6);
  shape(momie, 0, 0);
  if(frameCount%10==0){
  MDir(int(random(1,4.9)));
  if(dx == 0 && dy == 48 && (my+1)<=LAB_SIZE && labyrinthe[my+1][mx]!='#'){
    pushMatrix();
    momie.translate(0 /*-X*/, 0, width/(LAB_SIZE+H) /*-Y*/);
    //momie.rotateY(PI);
    my = my+1;
    popMatrix();
  }else if(dx == 0 && dy == -48 && (my-1)>=0 && labyrinthe[my-1][mx]!='#'){
    pushMatrix();
    momie.translate(0 /*-X*/, 0, -width/(LAB_SIZE+H) /*-Y*/);
    //momie.rotateY(-PI);
    my = my-1;
    popMatrix();
  }else if(dx == 48 && dy == 0 && (mx+1)<=LAB_SIZE && labyrinthe[my][mx+1]!='#'){
    pushMatrix();
    momie.translate(width/(LAB_SIZE+H) /*-X*/, 0, 0 /*-Y*/);
    //momie.rotateY(PI/2);
    mx = mx+1;
    popMatrix();
  }else if(dx == -48 && dy == 0 && (mx-1)>=0 && labyrinthe[my][mx-1]!='#'){
    pushMatrix();
    momie.translate(-width/(LAB_SIZE+H) /*-X*/, 0, 0 /*-Y*/);
    //momie.rotateY(-PI);
    mx = mx-1;
    popMatrix();
  }
  }
  popMatrix();
  }
  float wallW = width/(LAB_SIZE+H);
  float wallH = height/(LAB_SIZE+H);

  perspective();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  noLights();
  stroke(0);
  for (int j=0; j<(LAB_SIZE); j++) {
    for (int i=0; i<(LAB_SIZE); i++) {
      if (labyrinthe[j][i]=='#') {
        fill(i*25, j*25, 255-i*10+j*10);
        pushMatrix();
        translate(50+i*wallW/8, 50+j*wallH/8, 50);
        box(wallW/10, wallH/10, 5);
        popMatrix();
      }
    }
  }
  pushMatrix();
  fill(0, 255, 0);
  noStroke();
  translate((50+(posX-H)*(wallW/8)), (50+(posY-H)*(wallH/8)), 50);
  sphere(3);
  popMatrix();
  stroke(0);
  float DX = H*(wallW/LAB_SIZE+H);
  float DY = H*(wallW/LAB_SIZE+H);
  float PX=0;
  float PY=0;
  if(N==2){
    PX=-0.25*N;
    PY=N*N;
  }else if (N==3){
    PX=-1.25;
    PY=(N*N)+2;
  }
    
  if (inLab) {
    perspective(2*PI/3, float(width)/float(height), 1, 1000);
    if (animT)
      camera(((posX+PX)-dirX*anim/20.0)*wallW-DX,      (((posY+PY)+H-N*H)-dirY*anim/20.0)*wallH-DY,      -15+2*sin(anim*PI/5.0)+100*H, 
             ((posX+PX)-dirX*anim/20.0+dirX)*wallW-DX, (((posY+PY)+H-N*H)-dirY*anim/20.0+dirY)*wallH-DY, -15+4*sin(anim*PI/5.0)+100*H, 0, 0, -1);
    else if (animR)
      camera((posX+PX)*wallW-DX, ((posY+PY)+H-N*H)*wallH-DY, -15+100*H, 
            ((posX+PX)+(odirX*anim+dirX*(20-anim))/20.0)*wallW-DX, (((posY+PY)+H-N*H)+(odirY*anim+dirY*(20-anim))/20.0)*wallH-DY, -15-5*sin(anim*PI/20.0)+100*H, 0, 0, -1);
    else {
      camera(((posX+PX))*wallW-DX, (((posY+PY)+H-N*H))*wallH-DY, -15+100*H, 
             ((posX+PX)+(dirX))*wallW-DX, (((posY+PY)+H-N*H)+(dirY))*wallH-DY, -15+100*H, 0, 0, -1);
    }
    lightFalloff(0.0, 0.01, 0.0001);
    pointLight(255, 172, 88, (posX)*wallW, (posY)*wallH, 15+100*H);
  } else{
    lightFalloff(0.0, 0.05, 0.0001);
    pointLight(255, 172, 88, (posX)*wallW, (posY)*wallH, 15+100*H);
  }
  if(inLab == false){
    perspective(2*PI/3, float(width)/float(height), 1, 1000);
    if (animT)
      camera(((posX)-dirX*anim/20.0)*wallW, ((posY)-dirY*anim/20.0)*wallH,      -15+2*sin(anim*PI/5.0)+400, 
             ((posX)-dirX*anim/20.0+dirX)*wallW, ((posY)-dirY*anim/20.0+dirY)*wallH, -15+4*sin(anim*PI/5.0)+400, 0, 0, -1);
    else if (animR)
      camera((posX)*wallW, (posY)*wallH, -15+400, 
            ((posX)+(odirX*anim+dirX*(20-anim))/20.0)*wallW, ((posY)+(odirY*anim+dirY*(20-anim))/20.0)*wallH, -15-5*sin(anim*PI/20.0)+400, 0, 0, -1);
    else {
      camera(((posX))*wallW, (posY)*wallH, -15+400, 
             ((posX)+(dirX))*wallW, ((posY)+(dirY))*wallH, -15+400, 0, 0, -1);
    }
    }

  noStroke();
  for (int j=0; j<(LAB_SIZE); j++) {
    for (int i=0; i<(LAB_SIZE); i++) {
      pushMatrix();
      translate(i*wallW+H*40, j*wallH+H*40, 0+100*H);
      if (labyrinthe[j][i]=='#') {
        beginShape(QUADS);
        if (sides[j][i][3]==1) {
          pushMatrix();
          translate(0, -wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }

        if (sides[j][i][0]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
         if (sides[j][i][1]==1) {
          pushMatrix();
          translate(-wallW/2, 0, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
         
        if (sides[j][i][2]==1) {
          pushMatrix();
          translate(0, wallH/2, 40);
          if (i==posX || j==posY) {
            fill(i*25, j*25, 255-i*10+j*10);
            sphere(5);              
            spotLight(i*25, j*25, 255-i*10+j*10, 0, -15, 15, 0, 0, -1, PI/4, 1);
          } else {
            fill(128);
            sphere(15);
          }
          popMatrix();
        }
      } 
      popMatrix();
    }
  }
  shape(laby0, 0, 0);
  if (inLab)
    shape(ceiling0, 0, 0);
  //else
    //shape(ceiling1, 0, 0);
    
}

void keyPressed() {
  if(inLab==false){
    if ((key=='l' || key=='L')){
      inLab = !inLab;
      posX = 1;
      posY = -1;
      animT = false;
      animR = false;
      setup();
      draw();
    }
    if (anim==0 && keyCode==38) {
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
  }
  if (anim==0 && keyCode==40) {
    posX-=dirX; 
    posY-=dirY;
  }
  if (anim==0 && keyCode==37) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    int tmp = dirX; 
    dirX=dirY; 
    dirY=-tmp;
    animT = false;
    animR = true;
  }
  if (anim==0 && keyCode==39) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    animT = false;
    animR = true;
    int tmp = dirX; 
    dirX=-dirY; 
    dirY=tmp;
  }
    
  }
if(inLab==true){
  if ((key=='l' || key=='L')){
    inLab = !inLab;
    posX = -10;
    posY = -10;
    animT = false;
    animR = true;
    setup();
    draw();
  }
  if (anim==0 && keyCode==38) {
    if ((posX-H)+dirX>=0 && (posX-H)+dirX<LAB_SIZE && (posY-H)+dirY>=0 && (posY-H)+dirY<LAB_SIZE &&
      labyrinthe[(posY-H)+dirY][(posX-H)+dirX]!='#') {
      posX+=dirX; 
      posY+=dirY;
      anim=20;
      animT = true;
      animR = false;
    }
  }
  if (anim==0 && keyCode==40 && labyrinthe[(posY-H)-dirY][(posX-H)-dirX]!='#') {
    posX-=dirX; 
    posY-=dirY;
  }
  if (anim==0 && keyCode==37) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    int tmp = dirX; 
    dirX=dirY; 
    dirY=-tmp;
    animT = false;
    animR = true;
  }
  if (anim==0 && keyCode==39) {
    odirX = dirX;
    odirY = dirY;
    anim = 20;
    animT = false;
    animR = true;
    int tmp = dirX; 
    dirX=-dirY; 
    dirY=tmp;
  }
  if((key=='q' || key=='Q') && H<6 ){
    odirX = 1;
    odirY = -1;
    anim = 20;
    H = H+2;
    N = N+1;
    posX = (1+H);
    posY = (0+H);
    dirX = 0;
    dirY = 1;
    LAB_SIZE = LAB_SIZE-H;
    println(H);
    animT = false;
    animR = true;
    setup();
  }
  if((key=='w' || key=='W') && H<6 ){
    odirX = 1;
    odirY = -1;
    anim = 20;
    LAB_SIZE = LAB_SIZE+H;
    H = H-2;
    N = N-1;
    posX = (1-H);
    posY = (0-H);
    dirX = 0;
    dirY = 1;
    println(H);
    animT = false;
    animR = true;
    setup();
  }
}
}
