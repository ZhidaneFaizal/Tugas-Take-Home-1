#include <iostream>
#include <cmath>

using namespace std;

int main() {
    double x;

    cout << "=============================" << endl;
    cout << "       PROGRAM HARGA MUTLAK   " << endl;
    cout << "=============================" << endl;

    cout << "Masukkan nilai x: ";
    cin >> x;

    cout << endl;
    cout << "Nilai x       = " << x << endl;
    cout << "Harga mutlak  = " << abs(x) << endl;

    return 0;
}