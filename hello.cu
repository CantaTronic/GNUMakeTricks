
#include <iostream>

using namespace std;

__global__ void kernel(){
    //it does nothing for now
};

int main(){
    kernel<<<1,1>>>();
    cout<<"Hello, world! \n";
    return 0;
}
