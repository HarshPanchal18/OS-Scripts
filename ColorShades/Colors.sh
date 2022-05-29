seq 0 255 | xargs -I {} printf '\033[38;2;{};{};{}m■\033[m' # white
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;0;{};{}m■\033[m' # SkyBlue
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;0;0;{}m■\033[m' # Blue
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;{};0;0m■\033[m' # Red
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;{};{};0m■\033[m' # Yellow
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;{};0;{}m■\033[m' # Pink
printf '\n'
seq 0 255 | xargs -I {} printf '\033[38;2;0;{};0m■\033[m' # Green

# Show Colors.PNG
