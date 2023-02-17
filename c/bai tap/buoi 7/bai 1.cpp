#include<stdio.h>
#include<conio.h>

int main(){
	
	int cap;
	printf("Nhap vao kich thuoc: ");
	scanf("%d",&cap);
	int a[cap];
	for(int i=0;i<cap;i++){
		printf("Nhap vao phan tu %d: ");
		scanf("%d",&a[i]);
	}
	
	return 0;
}
