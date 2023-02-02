# load packages
library(tidyverse)
library(gganimate)

# load data
lebron <- read.csv("/Users/mgillis/Desktop/Projects/nba-scoring/data/Lebron.csv")

# build plot
points <- ggplot(lebron, aes(x = Game, y = CUMPTS)) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 38387, linewidth = 1) +
  labs(
    title = "Lebron James: Journey to Career Points Record",
    subtitle = "An animation of Lebron's total career points, as he breaks Kareem Abdul-Jabbar's record for most career points.",
    x = "Games (Career)",
    y = "Points (Total)"
    ) +
  theme(
    text = element_text(family = "Rockwell"),
    plot.title = element_text(face = "bold"),
    axis.title = element_text(face = "bold")
  )


# display plot
points