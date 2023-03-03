#include<stdio.h>
#include<conio.h>

int main(){
	
	int n;
	long long gt = 1;
	do{
		printf("Nhap vao so nguyen duong: ");
		scanf("%d", &n);
	}while(n <= 0);
	// in ra giai thua cua n
	for(int i = 2; i <= n; i++){
		gt*=i;
	}
	
	printf("Giai thua cua n la %d", gt);
	
	getch();
	return 0;
}