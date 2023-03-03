#include<stdio.h>
#include<conio.h>

int main(){
	
	int n;
	do{
		printf("Nhap vao so nguyen duong: ");
		scanf("%d", &n);
	}while(n <= 0);
	for(int i = n ;i >= 1 ; i--){
		if(!(n % i) && i % 2){
			printf("Uoc so lon nhat cua n la: %d", i);
			break;
		}
	
	}
	
	getch();
	return 0;
}