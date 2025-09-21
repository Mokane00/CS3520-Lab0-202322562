#include <iostream>
using namespace std;

int main() {
    int n;
    cout << "Enter a positive integer: ";
    cin >> n;

    if (n < 0) {
        cout << "Error: Please enter a non-negative integer." << endl;
    } else {
        long long factorial = 1; // Use long long for larger factorials
        for (int i = 1; i <= n; i++) {
            factorial *= i;
        }
        cout << "The factorial is: " << factorial << endl;
    }
    return 0;
}
