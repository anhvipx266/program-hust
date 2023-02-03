#include<stdio.h>
#include<conio.h>

int main(){
	
	float t,l,h,tbc;
	
	printf("Nhap vao diem toan, ly, hoa");
	
	scanf("%f %f %f", &t,&l,&h);
	
	tbc = (t+l+h)/3;
	
	printf("Diem toan, ly, hoa lan luot la %.2f %.2f %.2f",
	t,l,h);
	
	// in xep loai
	printf("\nXep loai ");
	if (tbc>8)
		printf("xuat xac");
	else if (tbc>7)
		printf("gioi");
	else if (tbc>6)
		printf("kha");
	else if (tbc>5)
		printf("trung binh");
	else
		printf("yeu, can co gang");
	
	
	
	getch();
	return 0;
}