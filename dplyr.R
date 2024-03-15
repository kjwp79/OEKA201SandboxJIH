library(dplyr)

data <- data.frame(
  id = c(1, 2, 3, 4, 5),
  name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  age = c(25, 30, 35, 40, 45),
  salary = c(50000, 60000, 70000, 80000, 90000)
)

result <- data %>%
  filter(age > 30) %>%
  select(name, salary) %>%
  mutate(salary = salary * 1.1) %>%
  arrange(desc(salary)) %>%
  slice(1:3)

print(result)
