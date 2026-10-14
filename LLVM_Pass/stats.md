# Use patterns

## Window 1

| # | Count | % | Pattern |
|--:|------:|--:|---------|
| 1 | 1,176,576 | 10.33 | `load <- getelementptr` |
| 2 | 1,175,812 | 10.32 | `getelementptr <- getelementptr` |
| 3 | 913,416 | 8.02 | `getelementptr <- phi` |
| 4 | 785,920 | 6.90 | `add <- phi` |
| 5 | 784,897 | 6.89 | `br <- icmp` |
| 6 | 653,822 | 5.74 | `add <- load` |
| 7 | 392,194 | 3.44 | `add <- add` |
| 8 | 262,908 | 2.31 | `getelementptr <- add` |
| 9 | 262,656 | 2.31 | `add <- shl` |
| 10 | 262,144 | 2.30 | `icmp <- add` |

## Window 2

| # | Count | % | Pattern |
|--:|------:|--:|---------|
| 1 | 911,880 | 8.00 | `getelementptr <- getelementptr`; `getelementptr <- phi` |
| 2 | 911,880 | 8.00 | `getelementptr <- phi`; `load <- getelementptr` |
| 3 | 782,340 | 6.87 | `br <- icmp`; `getelementptr <- getelementptr` |
| 4 | 391,680 | 3.44 | `load <- getelementptr`; `add <- phi` |
| 5 | 391,680 | 3.44 | `load <- getelementptr`; `add <- load` |
| 6 | 262,396 | 2.30 | `getelementptr <- add`; `load <- getelementptr` |
| 7 | 262,144 | 2.30 | `load <- getelementptr`; `br <- icmp` |
| 8 | 262,144 | 2.30 | `add <- add`; `add <- shl` |
| 9 | 261,886 | 2.30 | `getelementptr <- getelementptr`; `getelementptr <- add` |
| 10 | 261,632 | 2.30 | `icmp <- add`; `br <- icmp` |

## Window 3

| # | Count | % | Pattern |
|--:|------:|--:|---------|
| 1 | 911,880 | 8.00 | `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr` |
| 2 | 780,808 | 6.85 | `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi` |
| 3 | 391,170 | 3.43 | `getelementptr <- phi`; `load <- getelementptr`; `add <- phi` |
| 4 | 261,886 | 2.30 | `getelementptr <- getelementptr`; `getelementptr <- add`; `load <- getelementptr` |
| 5 | 261,120 | 2.29 | `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr` |
| 6 | 261,120 | 2.29 | `add <- phi`; `getelementptr <- getelementptr`; `getelementptr <- add` |
| 7 | 261,120 | 2.29 | `icmp <- add`; `br <- icmp`; `getelementptr <- getelementptr` |
| 8 | 260,866 | 2.29 | `load <- getelementptr`; `br <- icmp`; `getelementptr <- getelementptr` |
| 9 | 260,100 | 2.28 | `getelementptr <- phi`; `load <- getelementptr`; `add <- load` |
| 10 | 131,072 | 1.15 | `add <- phi`; `add <- phi`; `ashr <- add` |

## Window 4

| # | Count | % | Pattern |
|--:|------:|--:|---------|
| 1 | 780,808 | 6.85 | `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr` |
| 2 | 391,170 | 3.43 | `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr`; `add <- phi` |
| 3 | 261,120 | 2.29 | `getelementptr <- phi`; `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr` |
| 4 | 261,120 | 2.29 | `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr`; `getelementptr <- add` |
| 5 | 261,120 | 2.29 | `add <- phi`; `getelementptr <- getelementptr`; `getelementptr <- add`; `load <- getelementptr` |
| 6 | 260,608 | 2.29 | `icmp <- add`; `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi` |
| 7 | 260,100 | 2.28 | `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr`; `add <- load` |
| 8 | 260,100 | 2.28 | `load <- getelementptr`; `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi` |
| 9 | 131,072 | 1.15 | `load <- getelementptr`; `sub <- ashr`; `sub <- load`; `ashr <- sub` |
| 10 | 131,072 | 1.15 | `sub <- ashr`; `sub <- load`; `ashr <- sub`; `sub <- sub` |

## Window 5

| # | Count | % | Pattern |
|--:|------:|--:|---------|
| 1 | 390,658 | 3.43 | `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr`; `add <- phi` |
| 2 | 261,120 | 2.29 | `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr` |
| 3 | 261,120 | 2.29 | `getelementptr <- phi`; `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr`; `getelementptr <- add` |
| 4 | 261,120 | 2.29 | `load <- getelementptr`; `add <- phi`; `getelementptr <- getelementptr`; `getelementptr <- add`; `load <- getelementptr` |
| 5 | 260,608 | 2.29 | `icmp <- add`; `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr` |
| 6 | 260,100 | 2.28 | `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr`; `add <- load` |
| 7 | 260,100 | 2.28 | `load <- getelementptr`; `br <- icmp`; `getelementptr <- getelementptr`; `getelementptr <- phi`; `load <- getelementptr` |
| 8 | 131,072 | 1.15 | `load <- getelementptr`; `sub <- ashr`; `sub <- load`; `ashr <- sub`; `sub <- sub` |
| 9 | 131,072 | 1.15 | `sub <- ashr`; `sub <- load`; `ashr <- sub`; `sub <- sub`; `sub <- ashr` |
| 10 | 131,072 | 1.15 | `sub <- load`; `ashr <- sub`; `sub <- sub`; `sub <- ashr`; `store <- sub` |

