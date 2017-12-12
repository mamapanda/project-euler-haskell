#include <cstdint>
#include <iostream>

int main(void)
{
    std::uint64_t i, sum = 0, sum_squares = 0;

    for (i = 1; i <= 100; ++i)
    {
        sum += i;
        sum_squares += i * i;
    }

    std::cout << sum * sum - sum_squares << std::endl;

    return 0;
}
