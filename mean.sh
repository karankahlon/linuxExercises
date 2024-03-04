# usage
usage() {
    echo "Usage: $0 <column> [file.csv]" >&2
    exit 1
}

# at least 1 arg
if [ $# -lt 1 ]; then
    usage
fi

# col numb
column=$1
if [ $# -eq 2 ]; then
    input=$2
    if [ ! -f "$input" ]; then
	echo "File not found: $input" >&2 # error track
	exit 2
    fi
    exec <"$input"
else
    if [ -t 0 ]; then # if stdin is terminal
	usage
    fi
fi

{
    read
    sum=0
    count=0
    while IFS=, read -ra line; do
	value=${line[$((column-1))]}
	sum=$(echo "$sum + $value" | bc)
	count=$(echo "$count + 1" | bc)
    done
    if [ $count -gt 0 ]; then
	mean=$(echo "scale=2; $sum / $count" | bc)
	echo $mean
    else
	echo "No data to process" >&2 # for error tracking
	exit 3
    fi
} < <(tail -n +2)
