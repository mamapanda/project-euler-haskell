#include <iostream>
#include <vector>

std::vector<int> fibonacci(int limit)
{
    std::vector<int> result;
    int x = 1, y = 1, tmp;

    while (x < limit)
    {
        result.push_back(x);

        tmp = x;
        x = y;
        y += tmp;
    }

    return result;
}

int main(void)
{
    int sum = 0;

    for (int x: fibonacci(4000000))
    {
        if ((x & 1) == 0)
        {
            sum += x;
        }
    }

    std::cout << sum << std::endl;

    return 0;
}
