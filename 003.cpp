#include <cstdint>
#include <iostream>

// x is odd && x >= 3
std::uint64_t largest_prime_factor(std::uint64_t x)
{
    std::uint64_t i;

    for (i = 3; i <= x; i += 2)
    {
        while (x % i == 0)
            x /= i;

        if (x == 1)
            break;
    }

    return i;
}

int main(void)
{
    std::cout << largest_prime_factor(600851475143) << std::endl;
    return 0;
}
