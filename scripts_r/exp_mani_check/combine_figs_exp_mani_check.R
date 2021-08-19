# combine outcome measures EXP MANIPULATION CHCK

load('figures/exp_mani_check/all_ratings.R')
p_rat <- p_all
load('figures/exp_mani_check/all_scr.R')
p_scr <- p_all
load('figures/exp_mani_check/all_startle.R')
p_fps <- p_all


library(ggExtra)
library(cowplot)
plot_all <- plot_grid(p_rat, p_scr, p_fps,
                      nrow = 1,
                      labels = LETTERS[1:3])
colors_conditions <- c('blue', 'red','grey50','grey5')
# Add legend
plot_all_legend_contrast <- p_rat +
  scale_color_manual(values = colors_conditions,
                     labels = c('CS-: acq vs ext','CS+: acq vs ext','ext: CS+ vs CS-','acq: CS+ vs CS-'), 
                     guide_legend(reverse = TRUE)) +
  scale_shape_manual(values = c(17,16,23), guide = F)+
  guides(color = guide_legend(reverse = TRUE)) +
  
  theme(legend.position = 'right',
        legend.title = element_blank(),
        legend.text = element_text(size = 24),
        legend.key.size = unit(1.8, "cm"))


legend_for_plot <- get_legend(plot_all_legend_contrast)

#plot_all_wLegend <- ggpubr::ggarrange(plot_all, NA, legend_for_plot, widths = c(6,1,1), nrow = 1)
#colors_conditions <- c('blue', 'red','grey50','grey5')
p_rat <-   p_rat + scale_color_manual(values = colors_conditions,
                                      labels = c('CS-: acq vs ext','CS+: acq vs ext','ext: CS+ vs CS-','acq: CS+ vs CS-'), 
                                      guide_legend(reverse = TRUE)) +
  theme(axis.text.x = element_text(size =20),
        axis.title = element_text(size = 26)) 
p_scr <-   p_scr + scale_color_manual(values = colors_conditions,
                                      labels = c('CS-: acq vs ext','CS+: acq vs ext','ext: CS+ vs CS-','acq: CS+ vs CS-'), 
                                      guide_legend(reverse = TRUE)) +
  theme(axis.text.x = element_text(size =20),
        axis.title = element_text(size = 26)) 
p_fps <-   p_fps + scale_color_manual(values = colors_conditions,
                                      labels = c('CS-: acq vs ext','CS+: acq vs ext','ext: CS+ vs CS-','acq: CS+ vs CS-'), 
                                      guide_legend(reverse = TRUE)) +
  theme(axis.text.x = element_text(size =20),
        axis.title = element_text(size = 26)) 


plot_wLegend <- ggpubr::ggarrange(p_rat, p_scr, p_fps, legend_for_plot, 
                                  ncol = 4, nrow = 1, 
                                  labels = LETTERS[1:3])

h <- 4
w <- 16
windows(width = w, height = h)
plot_wLegend 

ggsave('figures/exp_mani_check/plot_all.tiff',plot_wLegend,
       dpi = 300,
       width = w, height = h, units = 'in')
