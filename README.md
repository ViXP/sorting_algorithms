# Sorting Algorithms Ruby implementation
My Ruby implementation of different sorting algorithms. All algorithms are implemented by defining the additional methods of the `Array` class (monkey patch). Watch samples of use to find out how to use them.

## Support
If you have any comments, or suggestions, please mail me: cyrilvixp@gmail.com or use the mechanisms of Forks & Pull Requests. Thank you! ;)

# Theoretical summary
## Quicksort (partition exchange sort)
### Best performance
`Ω(n)`
### Worst performance
`O(n^2)`
### Average performance
`Θ(n * log(n))`
### Algorithm
The random element of array is taken as a sample, then every element from the array (from beginning to end) compares to this sample. If current element is greater than sample, it moves to the end of an array, if it is less than sample - it moves to the beginning of an array. When the process is finished, the same algorithm must be recursively repeated for the part of array which stands to the left of the sample, and for the part which stands to the right of the sample. Whole process of crushing and comparison repeats until the size of remaining arrays will be 1, then the sorting process will be finished
***

## Merge sort
### Best performance
`Ω(n)`
### Worst performance
`O(n * log(n))`
### Average performance
`Θ(n * log(n))`
### Algorithm
'Divide and conquer' algorithm with a stable performance. Each element of the array moves to its own 1-element array. Then elements of the first two neighbouring arrays compares and moves to the combined array in ascending order. Then this operation repeats with all other pairs of arrays (3 & 4th, 5 & 6th etc.). After all arrays are processed, the first pair of already gotten joined arrays compares, element by element, in this order: the first element of the first array compares with the first element of the second array, then with the second element of the second array etc. until the smallest element will be found and moved to the intermediate resulting array; then the second element of the first array compares with the first element of the second array and operation repeats until all the elements from both arrays will be moved to a single array. Then this operation repeats with all other pairs of arrays and then will be recursively repeated until all the arrays will be merged to a single sorted array.
***

## Bubble sort (sinking sort)
### Best performance
`Ω(n)`
### Worst performance
`O(n^2)`
### Average performance
`Θ(n^2)`
### Algorithm
Sorting by permutations. Each element of an array compares with the next one, if element is greater than next one - they are swapping positions. The process continues until the end, and then recursively repeats from the beginning, n-times, where n - is the size of an array.
***

## Insertion sort
### Best performance
`Ω(n)`
### Worst performance
`O(n^2)`
### Average performance
`Θ(n^2)`
### Algorithm
Each element of an array compares with the next one. If it's greater than next one, their positions swaps, and than the previous pair of elements compares the same way (operation repeats recursively). If the first element is less then the second one - everything stays in place and the next elements compare.
This algorithm is effective with pre-sorted arrays.
***

## Counting sort
### Best performance
`Ω(n+k)`, where `n` - number of elements, `k` - the maximum value
### Worst performance
`O(n+k)`
### Average performance
`Θ(n+k)`
### Algorithm
The primary array must be analyzed step by step. Each step the value of intermediate array, where index - is the value of current primary array element, increments by 1. 
After the analysis is finished, the intermediate array must be updated this way: each step every current value must be changed to the sum of previous and current value.
The primary array must be analyzed once again. The value of element from intermediate array, where index is the current value of primary array element, will be the index of this current primary array element in the resulting array.
This algorithm is effective with tight ranges of integer values.
***

## Radix sort
### Best performance
`Ω(w*n)`, where `n` - number of elements, `w` - the biggest quantity of symbols in elements
### Worst performance
`O(w*n)`
### Average performance
`Θ(w*n)`
### Algorithm
First, the longest element of the array must be found (the element with biggest number of characters). All other elements must be modified by justifying them right by adding the several lowest values symbols to the beginning of them. Next will be the sorting stage.
Elements in the array sort by the last character of each symbols - each step the element with the 'lowest' value is pushed to the resulting array, until all elements will be rearanged and sorted by the last symbol. Then this process recursively repeats for the second from the end symbol of each element of already rearanged array. Then for the third from end and etc. until the first character. The result will be achieved after the final sorting by the first symbol.
The final stage is to remove extra characters from all modified elements.
This algorithm is very effective for sorting the strings and other non-number arrays.
***
