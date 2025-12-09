#include <iostream>
#include <vector>
#include <algorithm>

int main()
{
    std::vector<int> numbers = {5, 2, 8, 1, 9};
    std::sort(numbers.begin(), numbers.end());

    for (int num : numbers)
    {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    return 0;
}