#include <cstdint>
#include <iostream>

std::int64_t gcd(std::int64_t x, std::int64_t y)
{
    std::int64_t tmp;

    while (y > 0)
    {
        tmp = y;
        y = x % y;
        x = tmp;
    }

    return x;
}

std::int64_t lcm(std::int64_t x, std::int64_t y)
{
    return x * y / gcd(x, y);
}

int main(void)
{
    std::int64_t i, answer = 1;

    for (i = 1; i <= 20; ++i)
    {
        answer = lcm(answer, i);
    }

    std::cout << answer << std::endl;

    return 0;
}
