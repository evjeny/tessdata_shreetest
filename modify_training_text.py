from collections import Counter
import random

with open("eng.digits.training_text") as f:
    content = f.read()
stats = Counter(content.replace("\n", ""))

digits = [str(i) for i in range(10)]
mean_count = sum(stats[digit] for digit in digits) // len(digits)
print(stats)
print("mean count:", mean_count)

adds = "■+Δ"
adds_stats = {add: 0 for add in adds}
print(adds_stats)
new_content = []
for line in content.split("\n"):
    for add in adds:
        index = random.randint(0, len(line))
        if adds_stats[add] <= mean_count:
            new_line = line[:index] + add + line[index:]
            adds_stats[add] += 1
            new_content.append(new_line)
    new_content.append(line)

with open("eng.perimetry.training_text", "w+") as f:
    f.write("\n".join(new_content))

