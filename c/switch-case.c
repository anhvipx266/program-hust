#include <stdio.h>

int main(void) {
  // De bai: Nhap vao thang trong nam, in ra mua tuong ung.
  int month;
  printf("Nhap thang vao day: ");
  scanf("%d", &month);
  switch(month){
    case 1:
    case 2: 
    case 3:
      printf("Mua Xuan");
      break;
    case 4:
    case 5:
    case 6:
      printf("Mua he");
      break;
    case 7:
    case 8:
    case 9:
      printf("Mua thu");
      break;
    case 10:
    case 11:
    case 12:
      printf("Mua dong");
      break;
    default:
      printf("Vui long nhap dung thang tu 1->12");
  }
}