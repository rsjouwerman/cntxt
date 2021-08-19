# should plots from sourced scripts be saved as well?

# prepare to combine all plots
save_plot_ind <-  0
source('R_scripts/plot_emm/wAAAA/plot_emm_ratings_version3.R')
plotDIFF_rat <- plotDIFF
plotGEN_rat <- plotGEN
rm(list = setdiff(ls(), c('plotDIFF_rat','plotGEN_rat','plotDIFF_scr','plotGEN_scr','plotDIFF_fps','plotGEN_fps')))

save_plot_ind <-  0
source('R_scripts/plot_emm/wAAAA/plot_emm_scr_version3.R')
plotDIFF_scr <- plotDIFF
plotGEN_scr <- plotGEN
rm(list = setdiff(ls(), c('plotDIFF_rat','plotGEN_rat','plotDIFF_scr','plotGEN_scr','plotDIFF_fps','plotGEN_fps')))

save_plot_ind <-  0
source('R_scripts/plot_emm/wAAAA/plot_emm_startle_version3.R')
plotDIFF_fps <- plotDIFF
plotGEN_fps <- plotGEN

rm(list = setdiff(ls(), c('plotDIFF_rat','plotGEN_rat','plotDIFF_scr','plotGEN_scr','plotDIFF_fps','plotGEN_fps')))

save_plot_ind <-  0
source('R_scripts/plot_emm/wAAAA/plot_emm_startle_CSonly_version3.R')
plotDIFF_fps_CS <- plotDIFF
plotGEN_fps_CS <- plotGEN

rm(list = setdiff(ls(), c('plotDIFF_rat','plotGEN_rat','plotDIFF_scr','plotGEN_scr','plotDIFF_fps','plotGEN_fps','plotDIFF_fps_CS','plotGEN_fps_CS')))



library(ggExtra)
library(cowplot)
plotALL2 <- plot_grid(plotGEN_rat, plotDIFF_rat,
                     plotGEN_scr, plotDIFF_scr,
                     plotGEN_fps, plotDIFF_fps,
                     nrow = 3,
                     labels = LETTERS[1:6])

# + startle CSs only
plotALL2 <- plot_grid(plotGEN_rat, plotDIFF_rat,
                      plotGEN_scr, plotDIFF_scr,
                      plotGEN_fps_CS, plotDIFF_fps_CS,
                      NULL, plotDIFF_fps,
                      nrow = 4,
                      labels = c(LETTERS[1:6],NA,LETTERS[7]))

# Add legend
plotDIFF_fps2 <- plotDIFF_fps + 
  guides(alpha = F) + 
  guides(shape = guide_legend(override.aes = list(size = 5))) +
  scale_shape(labels = c('CS +', 'CS -', 'ITI')) +
  theme(legend.position = 'left', legend.title = element_blank(), 
        legend.text = element_text(size = 22),
        legend.key.width = unit(2, 'cm'))

legend_for_plot <- get_legend(plotDIFF_fps2)

plotALL3 <- plot_grid(plotGEN_rat, plotDIFF_rat,
                      plotGEN_scr, plotDIFF_scr,
                      plotGEN_fps_CS, plotDIFF_fps_CS,
                      legend_for_plot, plotDIFF_fps,
                      nrow = 4,
                      labels = c(LETTERS[1:6],NA,LETTERS[7]))


# BUILD TITLE
title1 <- ggdraw() +
  draw_label("Generalized", fontface = 'bold', size = 32, x = 0,
             hjust = 0) +
  theme(
    # add margin on the left of the drawing canvas,
    # so title is aligned to center
    plot.margin = margin(0, 0, 0, 140)
  )

title2 <- ggdraw() +
  draw_label("Differential", fontface = 'bold', size = 32, x = 0,
             hjust = 0) +
  theme(
    # add margin on the left of the drawing canvas,
    # so title is aligned to center
    plot.margin = margin(0, 0, 0, 140)
  )

title_plot <- plot_grid(title1, title2,
                        ncol = 2,
                        rel_widths = c(1,1))

# COMBINE TITLE AND PLOT
plot_all_wTitle <- plot_grid(
  title_plot, plotALL3,
  ncol = 1,
  # rel_heights values control vertical title margins
  rel_heights = c(0.1, 1)
)
#windows(height = 16, width = 12)

w <- 13
h <- 16
save_plot_ind <- 1
if (save_plot_ind == 1){
  file_nam <- paste0('figures/','ALL', '_emm_wAAAA.tiff')
  ggsave(filename = file_nam, plot = plot_all_wTitle, width = w, height = h, units = 'in')
  
}


# I changed the size of the bars and symbols
# from -- to
# bars: 4 to 5
# symbols bg: from 3 to 5
# symbols   : from 2 to 4
## GEN: I from 8? to 10 and 4? to 5



# OLD VERSION
# plotALL_wLegend <- gridExtra::grid.arrange(legend_for_plot, plotALL2,
#                         nrow = 2,
#                         layout_matrix = rbind(c(1,1),c(3,3)),
#                         widths = c(9,9), heights = c(.5,9))
# 
# w <- 13
# h <- 17 #h <- 13
# windows(width = w, height = h)
# plot(plotALL_wLegend)
# 
# ggsave('figures/emm_ALL_wLegend_4x2.tiff',plotALL_wLegend,
#        dpi = 300,
#        width = w, height = h, units = 'in')
