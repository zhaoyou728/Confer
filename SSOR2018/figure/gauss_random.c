
#include"stdio.h"
#include"stdlib.h"
#include"time.h"
#include"math.h"

#define I 10   //the amount of base
#define J 30   //the amount of venue
#define K 15   //the amount of vehicle
#define N 3    //the amount of rank
#define e 3    //preparation time
#define M 1500 //big-M
#define L 50
#define s 16   //the amount of 15 to 30
#define lower 15 //the lower severce time
#define u 1440   //the upper bound of warnning time

#define length 40 
#define width 40  
#define speed 100

int BASE_SET();    
int VENUE_SET();
int VEHICLE_SET();
int RANK_SET();
int DISTANCE_AND_TIME();
int WARNNING_TIME();
int SERVICE_TIME_G();
int DEMAND_VEHICLE();
int PREPARATION_TIME();
int BIG_M();
int BIG_M_2();
double rand_normal( double mu, double sigma );
double Uniform( void );

FILE *pf=NULL;

int main(void){

pf=fopen("181025_data_rand.dat","w");

  srand((unsigned)time(NULL));
  BASE_SET();
  VENUE_SET();
  VEHICLE_SET();
  RANK_SET();
  DISTANCE_AND_TIME();
  WARNNING_TIME();
  SERVICE_TIME_G();
  DEMAND_VEHICLE();
  PREPARATION_TIME();
  BIG_M();
  BIG_M_2();

  fclose(pf);  
  return 0;
}

int BASE_SET(){

  int a;
  fprintf(pf,"set I:= ");
  for(a=1;a<=I;a++){
    fprintf(pf," %d",a);
  }
  fprintf(pf,";\n");
  return 0;
}

int VENUE_SET(){
  int a;
  fprintf(pf,"set J:= ");
  for(a=1;a<=J;a++){
    fprintf(pf," %d",a);
    
  }
  fprintf(pf,";\n");
  return 0;

}

int VEHICLE_SET(){
   int a;
   fprintf(pf,"set K:= ");
  for(a=1;a<=K;a++){
    fprintf(pf," %d",a);
    
  }
  fprintf(pf,";\n");
   fprintf(pf,"set A:= ");
  for(a=1;a<=K;a++){
    fprintf(pf," %d",a);
    
  }
  fprintf(pf,";\n");
  return 0;


}
int RANK_SET(){
 int a;
 fprintf(pf,"set N:= ");
  for(a=1;a<=N;a++){
    fprintf(pf," %d",a);
  }
  fprintf(pf,";\n");
  fprintf(pf,"set B:= ");
  for(a=1;a<=N;a++){
    fprintf(pf," %d",a);
  }
  fprintf(pf,";\n\n");
    for(int c=1;c<=100;c++){
      fprintf(pf,"#");
    }
    fprintf(pf,"\n\n");
  return 0;

}



int DISTANCE_AND_TIME(){
  int a,b;
  int x_b[I],y_b[I];
  int x_v[J],y_v[J];
  double d;
  double t;

  fprintf(pf,"param t:");
  for(b=1;b<=J;++b){
    fprintf(pf," %d",b);
  }
  fprintf(pf,":=");
  
  for(a=0;a<I;++a){
    x_b[a]=0+rand()%length;
    y_b[a]=0+rand()%width;
    printf("%d\t%d\n",x_b[a],y_b[a]);
  }
  printf(" \n");
  for(b=0;b<J;++b){

    x_v[b]=0+rand()%length;
    y_v[b]=0+rand()%width;
    if(x_b[a]==x_v[b]&&y_b[a]==y_v[b]){
      --b;
      continue;
    }
     printf("%d\t%d\n",x_v[b],y_v[b]);
  }
  
  for(a=0;a<I;++a){
    fprintf(pf,"\n");
    for(b=0;b<J;++b){
      d=sqrt((x_b[a]-x_v[b])*(x_b[a]-x_v[b])+(y_b[a]-y_v[b])*(y_b[a]-y_v[b]));
      t=(d/speed)*60;
      fprintf(pf,"%d %.2f",a+1,t);
      // printf("%f\n",t);
    }
  }
  fprintf(pf,"\n;");
  fprintf(pf,"\n\n\n");
  return 0;
}


int WARNNING_TIME(){
  int a;
  int b;
  fprintf(pf,"param u:=\n");
  for(a=1;a<=J;a++){
    fprintf(pf,"\n");
    b=0+rand()%u;
    fprintf(pf,"%d %d",a,b);
  }
  fprintf(pf,"\n;\n\n");
  return 0;
}


int SERVICE_TIME_G(){
  int a;
  int b;
  double mu =20.0;
  double sigma=20.0;
  fprintf(pf,"param s:=\n");
  for(a=1;a<=J;a++){
    fprintf(pf,"\n");
    b=rand_normal(mu,sigma);
    fprintf(pf,"%d %d",a,b);
  }
  fprintf(pf,"\n;\n\n");
  return 0;
}

int DEMAND_VEHICLE(){
  int a;
  int b[a];
  fprintf(pf,"param d:=\n");
  for(a=1;a<=J;a++){
    fprintf(pf,"\n");
    b[a]=rand()%2+1;
    fprintf(pf,"%d %d",a,b[a]);
  }
  fprintf(pf,"\n;\n\n");
  return 0;
}


int PREPARATION_TIME(){
  
  fprintf(pf,"param e:= %d;\n\n",e);
  return 0;
  
}


int BIG_M(){
  
  fprintf(pf,"param M:=%d;\n\n",M);
  
  return 0;
  
}

int BIG_M_2(){
  
  fprintf(pf,"param L:=%d;\n\n",L);
  fprintf(pf,"end;\n");
  return 0;
  
}

double rand_normal( double mu, double sigma ){
    double z=sqrt( -2.0*log(Uniform()) ) * sin( 2.0*M_PI*Uniform() );
    return mu + sigma*z;
 }

double Uniform( void ){
  
  return ((double)rand())/((double)RAND_MAX+1.0);
}



/*




int main(){
  double lambda=0.2;

  srand((unsigned int)time(NULL));
  for(int i=1;i<=10;i++){
    
    printf("%lf\n",rand_normal(mu,sigma));
    
    }
  
  double gaussrand();

  return 0;
*/
