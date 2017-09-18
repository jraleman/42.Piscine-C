# Creates 18 directories with correct names
mkdir ex\{00..17\}

# Create your ft_list.h file, and put it in the same directory the folders
# are in. puts ft_list.h into all subdirectories
for d in */; do cp ft_list.h "$d"; done
