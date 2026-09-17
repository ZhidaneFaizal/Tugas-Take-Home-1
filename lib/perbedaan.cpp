#include <iostream>

using namespace std;

int main() {
    double a, b, perbedaan;

    cout << "================================" << endl;
    cout << "   PROGRAM PERBEDAAN 2 BILANGAN" << endl;
    cout << "================================" << endl;

    cout << "Masukkan bilangan pertama : ";
    cin >> a;

    cout << "Masukkan bilangan kedua   : ";
    cin >> b;

    perbedaan = a - b;

    if (perbedaan < 0) {
        perbedaan = -perbedaan;
    }

    cout << endl;
    cout << "Bilangan pertama = " << a << endl;
    cout << "Bilangan kedua   = " << b << endl;
    cout << "Perbedaan        = " << perbedaan << endl;

    return 0;
}