#include <iostream>

bool pythagorean(int const a, int const b, int const c)
{
    return a * a + b * b == c * c;
}

int main(void)
{
    int a, b, c;

    for (a = 1; a <= 333; ++a)
    {
        for (b = a; b < 1000; ++b)
        {
            c = 1000 - b - a;

            if (b > c)
                break;

            if (pythagorean(a, b, c))
                goto END;
        }
    }

END:
    std::cout << a * b * c << std::endl;

    return 0;
}
