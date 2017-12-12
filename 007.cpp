#include <array>
#include <iostream>

template <std::size_t bound>
std::array<bool, bound> e_sieve(void)
{
    std::array<bool, bound> sieve;
    unsigned int i, j;

    sieve.fill(true);
    sieve[0] = sieve[1] = false;

    for (i = 4; i < sieve.size(); i += 2)
    {
        sieve[i] = false;
    }

    for (i = 3; i < sieve.size(); i += 2)
    {
        if (sieve[i])
        {
            for (j = i * 2; j < sieve.size(); j += i)
            {
                sieve[j] = false;
            }
        }
    }

    return sieve;
}

int main(void)
{
    int const bound = 1000000;
    unsigned int i = 0, n_primes = 1;
    auto sieve(e_sieve<bound>());

    for (i = 3; i < sieve.size(); i += 2)
    {
        if (sieve[i])
            ++n_primes;

        if (n_primes == 10001)
            break;
    }

    std::cout << i << std::endl;

    return 0;
}
