echo "Learning bash scripting!"
# Read value from STDIN
read INPUT

# Mark as readonly variable
readonly INPUT

SENTENCE="Input: "
echo "$SENTENCE $INPUT"

# Special variables
echo "file name: $0"
echo "total number of parameters: $#"

for TOKEN in $*
do
	echo $TOKEN
done

echo "exit status code of previous command: $?"

# An array
SENTENCE[0]="Everything"
SENTENCE[1]="can"
SENTENCE[2]="work"
SENTENCE[3]="if"
SENTENCE[4]="we"
SENTENCE[5]="try"
SENTENCE[6]="enough"
echo "My sentence: ${SENTENCE[*]}"

a=10
b=10

if [ $a == $b ]
then
	echo "a is equal to b"
elif [ $a -gt $b ]
then
	echo "a is greater than b"
elif [ $a -lt $b ]
then
	echo "a is less than b"
else
#	echo "None of the condition met"
fi