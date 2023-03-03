#include<stdio.h>
#include<conio.h>

int main(){
	// Nhập vào nguyên dương n. Đếm các ước số chẵn của n
	int n, i;
	int count = 0;
	do{
		printf("Nhap vao so nguyen duong: ");
		scanf("%d", &n);
	}while(n <= 0);
	
	for(int i = 2; i <= n; i += 2){
		if(!(n % i)){
			count++;
		}
	}
	printf("So uoc chan cua n la: %d", count);
	getch();
	return 0;
}