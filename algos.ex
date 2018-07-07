defmodule Utils do

	@moduledoc """
	Very Vasic algorithms implemented in Elixir

	EXAMPLE:
		iex:> Utils.reverse_a_string("hello")
		olleh
	"""

	@doc """
	challenge: # Write a method that will take a string as input, and return a new
# string with the same letters in reverse order.
#
#
# Difficulty: easy.

	usage: Utils.reverse_a_string("string here")
	"""
	def reverse_a_string(str) when is_binary(str) do
		reverse_a_string(List.to_tuple(String.codepoints(str)), String.length(str) - 1, {})
	end

	def reverse_a_string(str_tple, ele, rev \\ {}) when ele >= 0 do
		reverse_a_string(str_tple, ele - 1, Tuple.append(rev, elem(str_tple, ele)))
	end

	def reverse_a_string(_str_list, _ele, rev) do
		List.to_string(Tuple.to_list(rev))
	end

	@doc """
	Challenge:
	# Write a method that takes an integer `n` in; it should return
# n*(n-1)*(n-2)*...*2*1. Assume n >= 0.
#
# As a special case, `factorial(0) == 1`.
#
# Difficulty: easy.

	Usage Utils.factorial(7)
	"""
	def factorial(fin, 0) do
		fin
	end

	def factorial(fin, cur) when cur > 0 do
		factorial(fin * cur, cur - 1)
	end

	def factorial(n) when n > 0 do
		factorial(1, n)
	end

	@doc """
	challenge:
	# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.

usage: Utils.longest_word("a sentence of words")
	"""
	def longest_word(str) when is_binary(str) do
		tpl_strs = String.split(str) |> List.to_tuple
		longest_word(tpl_strs, tuple_size(tpl_strs) - 1, "")

	end

	def longest_word(tpl, cur, longest \\ "")  when cur > -1 do
		next = elem(tpl, cur)
		cond do
			(String.length(next) >= String.length(longest)) ->
				longest_word(tpl, cur - 1, next)
			true ->
				longest_word(tpl, cur - 1, longest)
			end

	end

	def longest_word(_tpl, _cur, longest) do
		longest
	end

	@doc """
	Challenge:
	# Write a method that takes in an integer `num` and returns the sum of
# all integers between zero and num, up to and including `num`.
#
# Difficulty: easy.
usage: Utils.sum_nums(7)
	"""
	def sum_nums(num, cur, total) when cur == num do
		total + num
	end

	def sum_nums(num) do
		sum_nums(num, 0, 0)
	end

	def sum_nums(num, cur \\ 0, total \\ 0) do
		tot = total + cur
		sum_nums(num, cur + 1, tot)
	end

	@doc """
	Challenge # Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.

usage: Utils.time_conversion(99)
	"""
	def time_conversion(mins) do
		if (mins >= 60) do
			time_conversion(mins - 60, 1)
		else
			mins
		end
	end

	def time_conversion(mins, hrs \\ 0) do
			if (mins >= 60) do
			time_conversion(mins - 60, hrs + 1)
		else
			"#{hrs}:#{mins}"
		end
	end

	@doc """
	Challenge: # Write a method that takes a string and returns the number of vowels
# in the string. You may assume that all the letters are lower cased.
# You can treat "y" as a consonant.
#
# Difficulty: easy.

usage: Utils.count_vowels("hello mundo")
	"""
	def count_vowels(str) when is_binary(str) do
		tpl = String.split(String.upcase(str), "", trim: true) |> List.to_tuple
		count_vowels(tpl, tuple_size(tpl) - 1)
	end

	def count_vowels(_tpl, cur, cnt) when cur <= 0 do
		cnt
	end

	def count_vowels(tpl, cur, cnt \\ 0) when is_tuple(tpl) do
		pos = elem(tpl, cur)
		case pos do
			"A" ->

				count_vowels(tpl, cur - 1, cnt + 1)
			"E" ->
				count_vowels(tpl, cur - 1, cnt + 1)
			"I" ->
				count_vowels(tpl, cur - 1, cnt + 1)
			"O" ->
				count_vowels(tpl, cur - 1, cnt + 1)
			"U" ->
				count_vowels(tpl, cur - 1, cnt + 1)
			_ ->
				count_vowels(tpl, cur - 1, cnt)
		end
	end

	@doc """
	challenge: # Write a method that takes a string and returns true if it is a
# palindrome. A palindrome is a string that is the same whether written
# backward or forward. Assume that there are no spaces; only lowercase
# letters will be given.
#
# Difficulty: easy.

usage: Utils.palindrome?("hello mundo")
	"""

	def palindrome?(str) when is_binary(str) do
		if (reverse_a_string(str) == str) do
			:true
		else
			:false
		end
	end

	@doc """
	challenge:
	 # Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

usage: Utils.nearby_az("abz")
	"""

	def nearby_az(str) when is_binary(str) do
		tpl = String.split(String.upcase(str), "", trim: true) |> List.to_tuple
		nearby_az(tpl, tuple_size(tpl) -1)
	end

	def nearby_az(tpl, size, cur \\ 0) when is_tuple(tpl) do
		if (elem(tpl, cur) == "A") do
			cond do
				(elem(tpl, cur + 1) == "Z") ->
						true
				(elem(tpl, cur + 2) == "Z") ->
						true
				(elem(tpl, cur + 3) == "Z") ->
						true
				true ->
					if ((cur + 1) <= size) do
						nearby_az(tpl, size, cur + 1)
					else
						false
					end
			end
		else
			if ((cur + 1) <= size) do
				nearby_az(tpl, size, cur + 1)
			else
				false
			end

		end
	end

	@doc """
	challenge
	# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `nil`.
#
# Difficulty: medium.

usage: Utils.two_sum_zero({1, 3, 5})
	"""

	def two_sum_zero(tpl) when is_tuple(tpl) do
		two_sum_zero(tpl, tuple_size(tpl))
	end



	defp sum_zero(one, two) do
		if ((one + two) == 0) do
			:true
		end
	end

	def two_sum_zero(tpl, _size, cur \\ 0) do
		e = elem(tpl, cur)
		if (Enum.any?(Tuple.to_list(tpl), fn(x) -> (x + e) == 0 end)) do
			IO.puts("match found")
			true
		else
			if ((cur + 1) <= (tuple_size(tpl) -1)) do
				two_sum_zero(tpl, tuple_size(tpl), cur + 1)
			else
				false
			end

		end
	end

	@doc """
	challenge
	# Write a method that takes in a number and returns true if it is a
# power of 2. Otherwise, return false.
#
# You may want to use the `%` modulo operation. `5 % 2` returns the
# remainder when dividing 5 by 2; therefore, `5 % 2 == 1`. In the case
# of `6 % 2`, since 2 evenly divides 6 with no remainder, `6 % 2 == 0`.
#
# Difficulty: medium.

usage: Utils.power_of_two(5)
	"""

	def power_of_two(num) do
		cond do
			num < 1 ->
				false
			num == 1 ->
				true
			rem(num, 2) == 0 ->
				true
			true ->
				false
		end

	end


	@doc """
	challenge:
	# Write a method that takes an array of numbers in. Your method should
# return the third greatest number in the array. You may assume that
# the array has at least three numbers in it.
#
# Difficulty: medium.

usage: Utils.third_greatest({1, 2, 3})
	"""
	def third_greatest(tpl) when tuple_size(tpl) >= 3 do
		third_greatest(tpl, tuple_size(tpl) - 1)
	end

	def third_greatest(tpl, cur, first \\ 0, second \\ 0, third \\ 0) when cur > -1 do

		e = elem(tpl, cur)
		cond do
			e > first ->
				third_greatest(tpl, cur - 1, e, first, second)
			e > second ->
				third_greatest(tpl, cur - 1, first, e, second)
			e > third ->
				third_greatest(tpl, cur - 1, first, second, e)
			true ->
				third_greatest(tpl, cur - 1, first, second, third)
		end
	end

	def third_greatest(_tpl, _cur, _first, _second, third) do
		third
	end

end
