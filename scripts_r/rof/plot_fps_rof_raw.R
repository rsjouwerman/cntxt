# Plot raw data and display metrics of ROF

rm(list = ls())
out_measure <- 'startle'
load('RfittedModels/rawData_fps.Rdata')
load('RfittedModels/meanData_fps.Rdata')
# load libraries
library(ggplot2)
library(dplyr)
library(colorspace)
library(gghalves)
# width and height variables for saved plots
w = 8
h = 6
# Define limits of y-axis
y_lim_min = 20
y_lim_max = 85

df <- dr
df_means <- dr_means
df$context <- factor(df$context, levels = c('AAAB','AABB','AABA'))
df$numShockRi <- factor(df$numShockRi, levels = c(1,0))
df$stimType <- factor(df$stimType, levels = c('csp', 'csm', 'iti'))

df_means$context <- factor(df_means$context, levels = c('AAAB','AABB','AABA'))
df_means$numShockRi <- factor(df_means$numShockRi, levels = c(1,0))
df_means$stimType <- factor(df_means$stimType, levels = c('csp', 'csm','iti'))
# specify ticks for connecting means
df_means$trialn <- as.numeric(df_means$trial)
df_means$trialn[df_means$trialn == 2] <- 3


set.seed(321)
df$trialn <- as.numeric(df$trial)
df$trialn[df$trialn == 2] <- 3
df$trialj <- jitter(df$trialn, amount = 0.09)

col_csp = diverging_hcl(palette = 'Blue-Red 2', n = 2)[2]
col_csm = diverging_hcl(palette = 'Blue-Red 2',n = 2)[1]
col_csp <- 'red'
col_csm <- 'blue'
col_iti = 'black'

# labels for facets
shock_labs <- c('reinstatement', 'control')
names(shock_labs) <- c('1','0')
col_stim_types <- c(col_csm, col_csp,col_iti)
shape_stim_types <- c(17,16,15)




# Plot
f1 <- ggplot(data = df, aes(x = trialn, y = response)) +
  
  # Add geom objects
  
  # Dots
  #geom_line(data = df %>% filter(stimType == 'iti'), aes(x = trialj, group = idNum), position = position_nudge(x = -.50), color = col_iti_line, alpha = .4, linetype = 'dashed') +
  #geom_line(data = df %>% filter(stimType == 'csp'), aes(x = trialj, group = idNum), position = position_nudge(x = -.25), color = col_csp_line, alpha = .4) +
  #geom_line(data = df %>% filter(stimType == 'csm'), aes(x = trialj, group = idNum), color = col_csm_line, alpha = .4, linetype = 'dotted') +
  geom_point(data = df %>% filter(stimType == 'iti'), aes(x = trialj, shape = stimType, color = stimType),position = position_nudge(x = -.75), size = 1.5, alpha = .8) +
  geom_point(data = df %>% filter(stimType == 'csp'), aes(x = trialj, shape = stimType, color = stimType),position = position_nudge(x = -.50), size = 1.5, alpha = .8) +
  geom_point(data = df %>% filter(stimType == 'csm'), aes(x = trialj, shape = stimType, color = stimType),position = position_nudge(x = -.25), size = 1.5, alpha = .8) + 
  # Boxplot
  ## Before
  ## full boxplot
  geom_boxplot(
    data = df %>% filter(trialn == '1' & stimType == 'iti'), aes(x = trialn, y = response), position = position_nudge(x = -.75),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  
  geom_boxplot(
    data = df %>% filter(trialn == '1' & stimType == 'csp'), aes(x = trialn, y = response), position = position_nudge(x = -.50),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  ##
  
  geom_boxplot(
    data = df %>% filter(trialn == '1' & stimType == 'csm'), aes(x = trialn, y = response), position = position_nudge(x = -.25),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  
  
  ## After
  geom_boxplot(
    data = df %>% filter(trialn == '3' & stimType == 'iti'), aes(x = trialn, y = response),  position = position_nudge(x = -.75),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  
  geom_boxplot(
    data = df %>% filter(trialn == '3' & stimType == 'csp'), aes(x = trialn, y = response), position = position_nudge(x = -.50),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  
  geom_boxplot(
    data = df %>% filter(trialn == '3' & stimType == 'csm'), aes(x = trialn, y = response), position = position_nudge(x = -.25),
    outlier.shape = NA, width = .2,
    fill = NA, alpha = 0.5
  ) +
  

  
  
  # Add means

  geom_point(data = df_means %>% filter(trialn == '1'), aes(x = trialn, y = response, shape = stimType, color = stimType), size = 1) +
  geom_point(data = df_means %>% filter(trialn == '3'), aes(x = trialn, y = response, shape = stimType, color = stimType), position = position_nudge(x = -1), size = 1) +
  
  geom_errorbar(data = df_means %>% filter(trialn == '1'), aes(x = trialn, ymin = response - response_sem, ymax = response + response_sem, color = stimType), width = 0.1, size = .5, alpha = .8) +
  geom_errorbar(data = df_means %>% filter(trialn == '3'), aes(x = trialn, ymin = response - response_sem, ymax = response + response_sem, color = stimType), position = position_nudge(x = -1), width = 0.1, size = .5, alpha = .8) +
  
  geom_line(data = df_means, aes(x = as.numeric(trial), y = response, group = stimType, color = stimType), size = 1) +
  
  # Define additional settings
  scale_x_continuous(breaks = c(.5,2.5), labels = c('Extinction','Test 1'), limits = c(0,3.1)) +
 
  xlab('Trial') + ylab(out_measure) +
  scale_color_manual(values = col_stim_types, labels = c('CS -', 'CS +', 'ITI')) +
  scale_shape_manual(values = shape_stim_types, labels = c('CS -', 'CS +','ITI')) +
  theme_classic() +
  coord_cartesian(ylim = c(y_lim_min, y_lim_max)) +
  
  # Split for groups
  facet_wrap(.~ numShockRi * context, labeller = labeller(numShockRi = shock_labs )) +
  theme(strip.background = element_rect(fill = 'grey47', color = 'grey47'), 
        strip.text = element_text(color = 'white', size = 12),
        legend.position = 'top', legend.title = element_blank())

# Display plot
f1

#windows(width = w, height = h)
#f1


# save plot
#tiff(paste0('figures/raw_data/',out_measure, '_raw_rof.tiff'), width = w, height = h, units = 'in', res = 72)
#f1
#dev.off()

ggsave(paste0('figures/rof/',out_measure, '_raw_rof_no_indiv_lines.tiff'),f1,
       dpi = 300,
       width = w, height = h, units = 'in')
