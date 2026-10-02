
dna_sequence = input("Enter your DNA sequence: ").strip().upper()

sequence_length = len(dna_sequence)

nucleotide_counts = {"A": 0, "T": 0, "G": 0, "C": 0}

valid_bases = ["A", "T", "G", "C"]

print("\nDNA Sequence:", dna_sequence)
print("Sequence Length:", sequence_length)

for nucleotide in dna_sequence:
    if nucleotide in valid_bases:
        nucleotide_counts[nucleotide] += 1
    else:
        print("Invalid base found:", nucleotide)

print("\nNucleotide Counts:")

bases = list(nucleotide_counts.keys())
index = 0

while index < len(bases):
    base = bases[index]
    print(base, ":", nucleotide_counts[base])
    index += 1

def calculate_gc_content(sequence):
    if len(sequence) == 0:
        return 0

    gc_count = sequence.count("G") + sequence.count("C")
    return (gc_count / len(sequence)) * 100

gc_content = calculate_gc_content(dna_sequence)

print("\nGC Content:", round(gc_content, 2), "%")
