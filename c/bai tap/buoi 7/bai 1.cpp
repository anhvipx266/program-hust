#include<stdio.h>
#include<conio.h>

int main(){
	
	int cap,i;
	int eisum = 0; 
	
	
	printf("Nhap vao kich thuoc: ");
	scanf("%d",&cap);
	int a[cap];
	for(i=0;i<cap;i++){
		printf("Nhap vao phan tu %d: ");
		scanf("%d",&a[i]);
	}
	// in ra cac gia tri vua nhap 
	printf("Gia tri cua cac phan tu vua nhap:\n");
	for(i=0;i<cap;i++)
		printf("[%d] = %d\n",i+1,a[cap]);
	// tong cac gia tri co chi so chan
	for(i=0;i<cap;i+=2)
		eisum+=a[i];
	printf("\nTong cac phan tu chi so chan la: %d",eisum);
	// in ra man hinh cac gia tri le
	printf("\nCac phan tu le la:\n");
	for(i=0;i<cap;i++){
		if(a[cap]%2==1){
			printf("[%d]=%d\n",i+1,a[i]);
		}
	}
	// 5.	In ra màn hình các phần tử có chỉ số (key) lẻ
	printf("Cac phan tu co chi so le la:\n");
	for(i=1;i<cap;i+=2)
		printf("[%d]=%d\n",i,a[i]);
	return 0;
}
