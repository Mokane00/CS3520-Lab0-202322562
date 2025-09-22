#include <iostream>
using namespace std;

int main() {
    int litres;
    cout << "Enter quantity in litres: ";
    cin >> litres;

    int makokopo = litres / 20;
    int remainder = litres % 20;

    cout << "Makokopo: " << makokopo << " Remainder: " << remainder << endl;
    return 0;
}
