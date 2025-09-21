#include <iostream>
using namespace std;

int main() {
    int day;
    cout << "Enter a number 1-7: ";
    cin >> day;

    if (day < 1 || day > 7) {
        cout << "Error: Invalid input." << endl;
    } else {
        const char* days[] = {"Sontaha", "Mantaha", "Labobeli", "Laboraro", "Labone", "Labohlano", "Moqebelo"};
        cout << days[day - 1] << endl;
    }
    return 0;
}
