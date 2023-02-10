#include<stdio.h>
#include<conio.h>
#include<algorithm>
int main(){
	
	float a,b,c;
	char m;
	printf("Nhap vao 3 so: ");
	scanf("%f%f%f",&a,&b,&c);
	
	// Menu
	printf("\nVui long chon menu:");
	printf("\nTong - s    Tbc - a   Max - m(So lon nhat)");
	
	do{
		printf("\nNhap menu: ");
		scanf("%c",m);
	} while(c!='s' || c!='a'|| c!='m')
	switch(c){
	case 's':
		printf("\nTong cua 3 so la: %.2f",a + b + c);
		break;
	case 'a':
		printf("\nTrung binh cong 3 so la: %.2f",(a + b + c)/3);
		break;
	case 'm':
		printf("\nSo lon nhat trong 3 so la: ",max())
		break;
	}
	getch();
}
