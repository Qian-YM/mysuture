#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int numbers[0x80] = {0};

struct mytype {
	char c[0x1000];
};
struct mytype mt;

typedef struct data {
    __int32_t a;
    char b[4];
} data;
data d;

void test01(char *p, char u){
    if(u) ((char *)p)[0] = u;
    else ((char *)p)[1000] = u;
}

void test00(data *p, char u){
    ((char *)p)[0] = u;
    test01(p, u);
}
typedef void (*test00_ptr_t)(data *p, char u);
test00_ptr_t fp;
int entry0(int cmd, char user_input) {
    test00(&d, user_input);
    d.b[0] = user_input;
    fp = test00;   // 把 test00 的地址赋给函数指针
}
int __attribute__((noinline)) bar(char *p) {
    *(p+4) += 0xf0; //Overflow site (1)
    return 0;
}
int entry1() {
    bar(numbers);
}
void test20(){
    fp = test00;
}
void test21(){
    fp(&d, 'a');
}
int entry2() {
    test20();
    test21();
}

int main(){
	
}
