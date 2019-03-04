#!/bin/bash

# For each file in the given file path:
for file in $1/*; do
	# Instantiate two variables, total and i, and set them both to 0 at each iteration.
	total=0
	i=0
	# For each rating, i.e. the number found after the <Overall> tag, which is retrieved by
	# means of piping the output of grep <Overall> into a sed command that removes
	# the actual <Overall> tag as well as the return character that suceeds it:
	for rating in $(grep "<Overall>" $file | sed 's/^.*<Overall>//; s/\r$//'); do
		# Sum the rating values to get the total.
		total=$((total + rating))
		# Increment the i variable up by one.
		i=$((i + 1));
	done
	# Output the basename of the file followed by the total variable divided by the i
	# variable by means of piping these values into an awk command that formats them
	# to two decimal places.
	echo "$(basename $file .dat) $(echo $total $i | awk '{printf("%.2f\n", $1/$2)}')";
# Once the loop is completed, feed the output via a pipeline to a sort command, which sorts
# numerically (-n), in reverse order/highest to lowest (-r) and the field which needs to be
# sorted (-k 2).
done | sort -n -r -k 2
