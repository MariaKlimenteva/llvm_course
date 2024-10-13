import matplotlib.pyplot as plt
from collections import Counter

def main():
  """Анализирует пары инструкций в файле, 
     строит график и сохраняет статистику."""

  opcode_pairs = Counter()
  total_pairs = 0

  with open("info_simple_app.txt", "r") as file:
    for line in file:
      names = [name.strip() for name in line.strip().split("->") if "phi" not in name]
      for i in range(len(names) - 1):
        opcode_pairs[f"{names[i]} -> {names[i+1]}"] += 1
        total_pairs += 1
        
  with open("simple_app_statistics.txt", "w") as f:
    for pair, count in opcode_pairs.items():
      f.write(f"{pair}: {(count / total_pairs) * 100:.2f}%\n")
  plt.clf()
  colors = plt.cm.viridis([i / len(opcode_pairs) for i in range(len(opcode_pairs))])
  
  plt.figure(figsize=(10, 5))
  plt.bar(opcode_pairs.keys(), [(count / total_pairs) * 100 for count in opcode_pairs.values()], color=colors)
  plt.xlabel("Пары инструкций")
  plt.ylabel("Процентное соотношение (%)")
  plt.title("Статистика пар инструкций")
  plt.xticks(rotation=45, ha="right")
  plt.tight_layout()
  plt.savefig("simple_app_statistics.png")

if __name__ == "__main__":
  main()