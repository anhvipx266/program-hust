#include<stdio.h>
#include<conio.h>
int main(){
	int n,i;
	int sum = 0;
	int lsum = 0;
	int usum = 1;
	int max_uoc_le = 1;
	bool nt = true;
	// nhap du lieu n
	do{
		printf("Nhap vao so n:");
	scanf("%d",&n);
	} while(n<=0);
	// in ra day chan 100 98 ..2 
	for( i=100;i>=2;i-=2)
		printf("%d\n",i);
		
	//tong day nho hon n
	for(i = 1;i<=n;i++)
		sum+=i;
	printf("\nTong day nho hon %d la: %d",n,sum);
	// in ra cac uoc so chan
	printf("\nDay cac uoc chan cua %d:\n",n);
	for(i=2;i<=n;i+=2){
		if(n%i==0)
			printf("%d\n",i);
	}	
	// tong cac uoc le
	for(i=1;i<=n;i+=2){
		if(n%i==0){
			lsum+=i;
			max_uoc_le = i;
		}	
	}
	printf("\nTong cac uoc so le cua n la: %d",lsum);
	// tong cac uoc nho hon n
	for(i=2;i<n;i++){
		if(n%i==0){
			usum+=i;
			nt = false;
		}
			
	}
	printf("\nTong cac uoc so nho hon n la: %d",usum);
	printf("\nUoc le lon nhat cua n la: %d",max_uoc_le);
	if(nt)
		printf("\nSo %d la so nguyen to!",n);
	else
		printf("\nSo %d khong la so nguyen to!",n);
	getch();
}