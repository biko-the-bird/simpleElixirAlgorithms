#i know this isn't how one really rights tests
IO.puts("expect olleh")
IO.puts(Utils.reverse_a_string("hello"))

IO.puts("expect 5040")
IO.puts(Utils.factorial(7))

IO.puts("expect sweetie")
IO.puts(Utils.longest_word("toby sweetie pie"))

IO.puts("expect 36")
IO.puts(Utils.sum_nums(8))

IO.puts("expect 1:28")
IO.puts(Utils.time_conversion(88))

IO.puts("expect 3")
IO.puts(Utils.count_vowels("tobytea"))

IO.puts("expect :true")
IO.puts(Utils.palindrome?("hannah"))

IO.puts("expect :true")
IO.puts(Utils.nearby_az("abcz"))

IO.puts("expect: true")
IO.puts(Utils.two_sum_zero({1, 2, -1}))

IO.puts("expect :true")
IO.puts(Utils.power_of_two(6))

IO.puts("expect: 2")
IO.puts(Utils.third_greatest({1, 2, 3, 4}))
