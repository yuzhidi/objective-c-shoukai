/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#include <iostream>
using namespace std;

double maxValue(double a, double b) {
    return (a > b) ? a : b;
}
double maxValue(double a, double b, double c) {
    double t = (a > b) ? a : b;
    return (t > c) ? t : c;
}
double maxValue(int length, double arr[]) {
    double mx = arr[0];
    for (int i = 1; i < length; i++)
        if (arr[i] > mx)
            mx = arr[i];
    return mx;
}

int main(void)
{
    double a = 1.0;
    double b = 1.1;
    double vals[] = { 9.8, 1.2, 4.9, 11.2, 4.4 };

    cout << maxValue(a, b) << endl;
    cout << maxValue(a, b, 10.1) << endl;
    cout << maxValue(5, vals) << endl;

    return 0;
}
