# load packages
library(tidyverse)
library(gganimate)

# load data
lebron <- read.csv("/Users/mgillis/Desktop/Projects/nba-scoring/data/Lebron.csv")

# build plot
points <- ggplot(lebron, aes(x = Game, y = CUMPTS, group = Tm)) +
  geom_line(linewidth = 1, color = "#EAEAEA") +
  geom_hline(yintercept = 38387, linewidth = 1, color = "#EAEAEA") +
  geom_point(size = 2, color = "#EAEAEA") + 
  annotate("text", x = 1150, y = 2500, label = lebron$Date[30], family = "Rockwell", size = 10, color = "#EAEAEA") +
  labs(
    title = "Lebron James: Journey to Career Points Record",
    subtitle = "An animation of Lebron's total career points, as he breaks Kareem Abdul-Jabbar's record for most career points.",
    x = "Games (Career)",
    y = "Points (Total)"
    ) +
  theme(
    text = element_text(family = "Rockwell", color = "#EAEAEA"),
    plot.title = element_text(face = "bold", size = 33),
    plot.subtitle = element_text(size = 15),
    axis.title = element_text(face = "bold", size = 15),
    plot.background = element_rect(fill = "#636363"),
    panel.background = element_rect(fill = "#484848"),
    panel.grid = element_blank(),
    axis.text = element_text(color = "#EAEAEA"),
    panel.grid.minor = element_blank()
  )

# display plot
points

# create the animation
points_anim <- points +
 transition_reveal(Game)

# display animation
points_anim

# save the animation to a .mp4 file
anim_save(file = "lebron.gif", animation = points_anim, path = "/Users/mgillis/Desktop/projects/nba-scoring")
