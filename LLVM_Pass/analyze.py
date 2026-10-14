import sys
from collections import Counter
from itertools import islice

TOP = 10

trace = [
    sys.intern(line.split(": ", 1)[1].rsplit(" {", 1)[0])
    for line in open(sys.argv[1])
]
print("# Use patterns\n")
for n in range(1, 6):
    windows = Counter(zip(*(islice(trace, i, None) for i in range(n))))
    total = len(trace) - n + 1
    print(f"## Window {n}\n")
    print("| # | Count | % | Pattern |")
    print("|--:|------:|--:|---------|")
    for rank, (pattern, count) in enumerate(windows.most_common(TOP), 1):
        text = "; ".join(f"`{use}`" for use in pattern)
        print(f"| {rank} | {count:,} | {100 * count / total:.2f} | {text} |")
    print()
