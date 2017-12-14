#include <cstdint>
#include <iostream>
#include <vector>

std::vector<bool> e_sieve(std::size_t bound)
{
    std::vector<bool> sieve(bound, true);
    unsigned int i, j;

    sieve[0] = sieve[1] = false;

    for (i = 4; i < bound; i += 2)
    {
        sieve[i] = false;
    }

    for (i = 3; i < bound; i += 2)
    {
        if (sieve[i])
        {
            for (j = i * 2; j < bound; j += i)
            {
                sieve[j] = false;
            }
        }
    }

    return sieve;
}

int main(void)
{
    std::uint64_t i, sum = 2;
    std::vector<bool> sieve(e_sieve(2000000));

    for (i = 3; i < sieve.size(); i += 2)
    {
        if (sieve[i])
            sum += i;
    }

    std::cout << sum << std::endl;

    return 0;
}
