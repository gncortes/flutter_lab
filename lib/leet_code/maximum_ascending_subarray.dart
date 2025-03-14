class Solution {
  int maxAscendingSum(List<int> nums) {
    int sum = 0;
    List<int> allSum = [];
    while (nums.isNotEmpty) {
      if (nums.length >= 2) {
        if (nums[0] < nums[1]) {
          sum += nums[0];
          nums.removeAt(0);
        } else if (nums[0] > nums[1]) {
          if (sum > 0) allSum.add(sum);
          sum = nums[0];
          nums.removeAt(0);
        }
      } else {
        sum += nums[0];
        nums.removeAt(0);
      }
    }

    if (sum > 0) allSum.add(sum);

    allSum.sort((a, b) => a.compareTo(b));

    return allSum.last;
  }
}
