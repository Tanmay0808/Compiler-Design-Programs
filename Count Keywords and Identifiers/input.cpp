#include<iostream>
using namespace std;

template <typename T>
constexpr bool is_lvalue(T&&) {
  return std::is_lvalue_reference<T>{};
}

int main(int argc, char const *argv[])
{
    int bcd=9;
    cout<<is_lvalue(bcd)<<endl;
    return 0;
}
