#include<stdio.h>
#include<conio.h>

int main(){
	// so hoan hao theo tong uoc
	int n, i;
	int sum = 0;
	do{
		printf("Nhap vao so nguyen duong: ");
		scanf("%d", &n);
	}while(n <= 0);
	// tinh tong cac uoc nho hon n
	for(int i = 1; i < n; i++){
		if(!(n % i)){
			sum += i;
		}
	}
	if(sum==n){
		printf("So n la so hoan hao");
	}
	else
		printf("So n khong hoan hao");
	getch();
	return 0;
}