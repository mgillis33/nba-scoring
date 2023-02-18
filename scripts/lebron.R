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
points <- ggplot(lebron, aes(x = Game, y = CUMPTS)) +
  geom_area(aes(fill = factor(Tm))) +
  scale_fill_manual(values = c("#041E42","#860038","#552583","#98002E")) +
  scale_x_continuous(expand = expansion(add = c(10,0))) +
  scale_y_continuous(expand = expansion(mult = c(0,0.06))) +
  guides(fill = FALSE) +
  geom_line(linewidth = 1, color = "#EAEAEA") +
  geom_hline(yintercept = 38387, linewidth = 1, color = "#EAEAEA") +
  geom_point(size = 2, color = "#EAEAEA") + 
  annotate("text", x = 1250, y = 1900, label = lebron$Date[30], family = "Rockwell", face = "bold", size = 15, color = "#EAEAEA") +
  labs(
    title = "Lebron James: Journey to Career Points Record",
    subtitle = "An animation of Lebron's total points, as he breaks \n Kareem Abdul-Jabbar's record for most career points.",
    x = "Games (Career)",
    y = "Points (Total)"
  ) +
  theme(
    text = element_text(family = "Trebuchet MS", color = "#EAEAEA"),
    plot.title = element_text(face = "bold", size = 40, hjust = 0.5, margin = margin(1, 1, b = 12.5, 1, "pt")),
    plot.subtitle = element_text(size = 22, hjust = 0.5, margin = margin(1, 1, b = 15, 1, "pt")),
    axis.title.x = element_text(face = "bold", size = 20, margin = margin(t = 15, 1, 1, 1, "pt")),
    axis.title.y = element_text(face = "bold", size = 20, margin = margin(1, r = 15, 1, 1, "pt")),
    plot.background = element_rect(fill = "#636363"),
    panel.background = element_rect(fill = "#484848"),
    panel.grid = element_blank(),
    axis.text = element_text(color = "#EAEAEA", size = 15),
    axis.ticks = element_line(color = "#EAEAEA", size = 2),
    panel.grid.minor = element_blank(),
    plot.margin = margin(25,75,25,35, "pt")
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