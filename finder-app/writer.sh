#	This script:

#	Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr

#   Exits with value 1 error and print statements if any of the arguments above were not specified

#   Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

WRITE_FILE="$1"
WRITE_STR="$2"

if [ "$#" -ne 2 ]; then
	echo "Error: You must provide exactly 2 arguments."
	exit 1
fi

directory_name="$(dirname -- "$WRITE_FILE")" 

if ! mkdir -p "$directory_name"; then
	echo "Error: Unable to create directory: $directory_name"
	exit 1
fi

if ! echo "$WRITE_STR" > "$WRITE_FILE"; then
	echo "Error: Failed to write to file: $WRITE_FILE"
	exit 1
fi

echo "Successfully wrote the following to $WRITE_FILE:"
echo "$WRITE_STR"
