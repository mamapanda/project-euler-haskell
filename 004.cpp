#include <algorithm>
#include <iostream>

int reverse(int x)
{
    int reversed = 0;

    while (x != 0)
    {
        reversed = reversed * 10 + x % 10;
        x /= 10;
    }

    return reversed;
}

bool palindrome(int const x)
{
    return x == reverse(x);
}

int main(void)
{
    int i, j, product, answer = 1;

    for (i = 999; i >= 100; --i)
    {
        for (j = i; j >= std::max(100, answer / i); --j)
        {
            product = i * j;

            if (palindrome(product) && product > answer)
            {
                answer = product;
            }
        }
    }

    std::cout << answer << std::endl;

    return 0;
}
