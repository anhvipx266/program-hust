#include <stdio.h>

int main(void) {
  //if - else if - else
  //Xet HL cua hs: Gioi, kha, tbinh, yeu
float dtb;
  printf("Hay nhap diem TB cua ban vao: ");
  scanf("%f", &dtb);
  //TH1: Gioi dtb>=8.0
  //TH2: Kha 6.5<=dtb<8.0
  //TH3: TBinh 5.0 <=dtb <6.5
  //TH4: Yeu dtb < 5.0
  if (dtb >= 8.0){
    printf("HL Gioi");
  }
  else if(dtb >=6.5) {
    printf("HL kha");
  }
  else if(dtb>=5.0) {
    printf("HL Tbinh");
  }  
  else {
    printf("HL Yeu");
  }
}