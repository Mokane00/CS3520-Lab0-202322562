#include <iostream>
using namespace std;

int main() {
    int cattle;
    cout << "Enter number of cattle: ";
    cin >> cattle;

    if (cattle < 10) {
        cout << "Not enough for bohali" << endl;
    } else if (cattle <= 50) {
        cout << "Small herd" << endl;
    } else {
        cout << "Wealthy cattle owner" << endl;
    }
    return 0;
}
