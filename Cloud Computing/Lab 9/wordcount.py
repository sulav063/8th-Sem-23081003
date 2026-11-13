from collections import defaultdict

# Sample input
text = """
Cloud computing provides scalable computing resources.
Cloud services support storage, networking, and applications.
Cloud computing reduces infrastructure cost and improves flexibility.
"""

# Step 1: Map Function
def map_function(text):
    words = text.strip().split()

    for word in words:
        cleaned = word.strip().lower().strip(".,;!?:\"'")
        if cleaned:
            yield (cleaned, 1)

# Step 2: Shuffle and Sort
def shuffle(mapped_data):
    grouped = defaultdict(list)

    for key, value in mapped_data:
        grouped[key].append(value)

    return grouped

# Step 3: Reduce Function
def reduce_function(grouped_data):
    reduced = {}

    for key, values in grouped_data.items():
        reduced[key] = sum(values)

    return reduced

# Execution
mapped = list(map_function(text))
grouped = shuffle(mapped)
reduced = reduce_function(grouped)

# Display Output
print("Word Count Output:\\n")

for word, count in sorted(reduced.items()):
    print(f"{word}: {count}")