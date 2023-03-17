#include<stdio.h>
#include<conio.h>
#include<string.h>

// le
int main(){
	int a[100];
	int n, i, x;
	long int sum = 0;
	do{
		printf("Nhap vao n: ");
		scanf("%d", &n);
	}while(n <= 0 || n > 100);
	// input
	printf("Nhap vao cac phan tu:");
	for(i = 0; i < n; i++){
		printf("[%d] = ", i);
		scanf("%d", &a[i]);
	}
	// print 
	printf("Cac phan tu vua nhap: ");
	for(i = 0; i < n; i++){
		printf("\n[%d] = %d", i, a[i]);
	}
	// in gia tri chan va tong
	printf("\nCac phan tu tri chan vua nhap: ");
	for(i = 0; i < n; i++){
		if(a[i] % 2 == 0){
			printf("\n[%d] = %d", i, a[i]);
			sum += a[i];
		}
	}
	printf("\nTong la: %d", sum);
	// tim vi tri x
	printf("\nNhap vao gia tri x: ");
	scanf("%d", &x);
	printf("Cac vi tri cua x: ");
	for(i = 0; i < n; i++){
		if(a[i] == x){
			printf("%d ", i);
		}
	}
	
	getch();
	return 0;
}
