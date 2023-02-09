# load packages
library(tidyverse)
library(gganimate)
library(scales)
library(cowplot)
library(magick)

# load data
lebron <- read.csv("/Users/mgillis/Desktop/Projects/nba-scoring/data/Lebron.csv")

# load images
crown <- image_read("/Users/mgillis/Desktop/Projects/nba-scoring/images/Crown_of_England_Old.png")

# build plot
points <- ggplot(lebron, aes(x = Game, y = CUMPTS, group = Tm)) +
  geom_line(linewidth = 1, color = "#EAEAEA") +
  geom_hline(yintercept = 38387, linewidth = 1, color = "#EAEAEA") +
  geom_point(size = 2, color = "#EAEAEA") + 
  annotate("text", x = 1150, y = 2500, label = lebron$Date[30], family = "Rockwell", size = 10, color = "#EAEAEA") +
  scale_y_continuous(labels = label_number(suffix = "K", scale = 1e-3)) +
  labs(
    title = "Lebron James: Journey to Career Points Record",
    subtitle = "An animation of Lebron's total career points, as he breaks Kareem Abdul-Jabbar's \n record for most career points.",
    x = "Games (Career)",
    y = "Points (Total)"
    ) +
  theme(
    text = element_text(family = "Trebuchet MS", color = "#EAEAEA"),
    plot.title = element_text(face = "bold", size = 24, hjust = 0.5),
    plot.subtitle = element_text(size = 15, hjust = 0.5),
    axis.title = element_text(face = "bold", size = 20),
    plot.background = element_rect(fill = "#636363"),
    panel.background = element_rect(fill = "#484848"),
    panel.grid = element_blank(),
    axis.text = element_text(color = "#EAEAEA", size = 15),
    axis.ticks = element_line(color = "#EAEAEA", size = 2),
    panel.grid.minor = element_blank()
  )

# image annotations
final <- ggdraw(points) +
  draw_image(crown, scale = 0.05, x = -0.4, y = 0.48)

# display plot
final

# create the animation
#points_anim <- points +
 #transition_reveal(Game)

# display animation
#points_anim

# save the animation to a .mp4 file
#anim_save(file = "lebron.gif", animation = points_anim, path = "/Users/mgillis/Desktop/projects/nba-scoring")
