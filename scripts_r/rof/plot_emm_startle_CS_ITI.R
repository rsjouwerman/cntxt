# Plot estimates STARTLE
# run context_startle_1_model markdown
# or load fitted model from BouCon_All/RfittedModels/
load('RfittedModels/fit_fps_wAAAA.Rdata')
out_measure <- 'startle'
source('R_scripts/model_building/analysis/contrasts_to_load_wAAAA.R')
fitB5 <- fit_fps_wAAAA
rm(fit_fps_wAAAA)

# load libraries
library(emmeans)
library(ggplot2)
library(dplyr)

# define width and height for plotting, in inches
# specifics for plotting
context_colors <- c('gray25','slateblue4','slateblue')
context_colors <- c('gray25','turquoise1','#E200FD')
context_colors <- c("#383838", "#FF00F2", "#55BDE0")
context_colors <- c("#55BDE0", "#FF00F2", "#383838")
context_colors <- viridis::viridis(n = 4, option = 'inferno', begin = 0.15, end = 0.85)

col_zero_line <- 'red'
col_zero_line <- 'black'

type_zero_line <- 'solid'
type_zero_line <- 'dotted'

size_zero_line <- 2
size_zero_line <- 1
 
h <- 4
w <- 4

eval_fit <- fitB5

# extract contrast for generalized ROF
c_trial_GEN <- pairs(emmeans(eval_fit, ~ trial * context * numShockRi))

con_index_GEN <- c_trial_GEN@levels[["contrast"]] %in% contrasts_of_interest_1

lab_names_pos <- c("ext6,AAAB,1 - tst1,AAAB,1" = "rAAAB",
                   "ext6,AABB,1 - tst1,AABB,1" = "rAABB",
                   "ext6,AABA,1 - tst1,AABA,1" = "rAABA",
                   "ext6,AAAA,1 - tst1,AAAA,1" = "rAAAA",
                   "ext6,AAAB,0 - tst1,AAAB,0" = "cAAAB",      
                   "ext6,AABB,0 - tst1,AABB,0" = "cAABB",      
                   "ext6,AABA,0 - tst1,AABA,0" = "cAABA",
                   "ext6,AAAA,0 - tst1,AAAA,0" = "cAAAA")

# convert to dataframe
dat <- data.frame(c_trial_GEN[con_index_GEN]) %>%
  droplevels()
# change order of factor levels for plotting
# reinstatement groups first, than control groups
dat$contrast <- factor(dat$contrast, levels = rev(contrasts_of_interest_1))

# add grouping vars
## context
dat[grep('AAAB', dat$contrast), 'context'] <- 'AAAB'
dat[grep('AABB', dat$contrast), 'context'] <- 'AABB'
dat[grep('AABA', dat$contrast), 'context'] <- 'AABA'
dat[grep('AAAA', dat$contrast), 'context'] <- 'AAAA'

dat$context <- factor(dat$context, levels = c('AAAB','AABB','AABA','AAAA'))
## reinstatement / control
dat[grep(',1', dat$contrast), 'ri_group'] <- 'reinstatement'
dat[grep(',0', dat$contrast), 'ri_group'] <- 'control'



# plot
plotGEN <- ggplot(dat, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, 
                     color = context, alpha = ri_group), size = 4, height = 0) +
  scale_alpha_discrete(range = c(0.35, 1)) +
  
  geom_point(data = dat %>% filter(context == 'AAAB' & ri_group == 'reinstatement'), shape = 'I', size = 8, color = 'white') +
  geom_point(shape = 'I', size = 3) +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0('ext vs test in ', out_measure),
                   labels = lab_names_pos) +
  theme_classic() +
  theme(axis.text = element_text(size =16),
        axis.title = element_text(size = 18),
        axis.ticks.y = element_blank(),
        legend.position = 'none') +
  scale_color_manual(values = context_colors)

#scale_color_brewer(palette = 'Purples')

# put name of outcome measure left, remove group names
plotGEN <- plotGEN + theme(axis.text.y = element_blank())
# 
#windows(width = w, height = h)
plotGEN

if (save_plot_ind == 1){
  file_nam <- paste0('figures/',out_measure, '_emm_GEN_wAAAA.tiff')
  ggsave(filename = file_nam, plot = plotGEN, width = w, height = h, units = 'in')
  
}










############## DIFFERENTIAL ROF

# extract contrast DIFF rof
c_trial_DIFF <- pairs(emmeans(eval_fit, ~ trial * stimType * context * numShockRi))

con_index_DIFF <- c_trial_DIFF@levels[["contrast"]] %in% contrasts_of_interest_2

lab_names_pos <- c("ext6,csp,AAAB,1 - tst1,csp,AAAB,1" = '',#"reinstatement AAAB",
                   "ext6,csm,AAAB,1 - tst1,csm,AAAB,1" = "rAAAB",
                   "ext6,iti,AAAB,1 - tst1,iti,AAAB,1" = '',#"reinstatement AAAB",
                   
                   "ext6,csp,AABB,1 - tst1,csp,AABB,1" = '',#"reinstatement AABB",
                   "ext6,csm,AABB,1 - tst1,csm,AABB,1" = "rAABB",
                   "ext6,iti,AABB,1 - tst1,iti,AABB,1" = '',#"reinstatement AABB",
                   
                   "ext6,csp,AABA,1 - tst1,csp,AABA,1" = '',#"reinstatement AABA",
                   "ext6,csm,AABA,1 - tst1,csm,AABA,1" = "rAABA",
                   "ext6,iti,AABA,1 - tst1,iti,AABA,1" = '',#"reinstatement AABA",
                   
                   "ext6,csp,AAAA,1 - tst1,csp,AAAA,1" = '',#"reinstatement AABA",
                   "ext6,csm,AAAA,1 - tst1,csm,AAAA,1" = "rAAAA",
                   "ext6,iti,AAAA,1 - tst1,iti,AAAA,1" = '',#"reinstatement AABA",
                   
                   "ext6,csp,AAAB,0 - tst1,csp,AAAB,0" = '',#"control AAAB",      
                   "ext6,csm,AAAB,0 - tst1,csm,AAAB,0" = "cAAAB",    
                   "ext6,iti,AAAB,0 - tst1,iti,AAAB,0" = '',#"control AAAB",  
                   
                   "ext6,csp,AABB,0 - tst1,csp,AABB,0" = '',#"control AABB",     
                   "ext6,csm,AABB,0 - tst1,csm,AABB,0" = "cAABB", 
                   "ext6,iti,AABB,0 - tst1,iti,AABB,0" = '',#"control AABB", 
                   
                   "ext6,csp,AABA,0 - tst1,csp,AABA,0" = '',#"control AABA",
                   "ext6,csm,AABA,0 - tst1,csm,AABA,0" = "cAABA",
                   "ext6,iti,AABA,0 - tst1,iti,AABA,0" = '',#"control AABA" )

                   "ext6,csp,AAAA,0 - tst1,csp,AAAA,0" = '',#"control AABA",
                   "ext6,csm,AAAA,0 - tst1,csm,AAAA,0" = "cAAAA",
                   "ext6,iti,AAAA,0 - tst1,iti,AAAA,0" = '')
# convert to dataframe
dat <- data.frame(c_trial_DIFF[con_index_DIFF]) %>%
  droplevels()
# change order of factor levels for plotting
# reinstatement groups first, than control groups
dat$contrast <- factor(dat$contrast, levels = rev(contrasts_of_interest_2))

# add grouping vars
## context
dat[grep('AAAB', dat$contrast), 'context'] <- 'AAAB'
dat[grep('AABB', dat$contrast), 'context'] <- 'AABB'
dat[grep('AABA', dat$contrast), 'context'] <- 'AABA'
dat[grep('AAAA', dat$contrast), 'context'] <- 'AAAA'

dat$context <- factor(dat$context, levels = c('AAAB','AABB','AABA','AAAA'))
## reinstatement / control
dat[grep(',1', dat$contrast), 'ri_group'] <- 'reinstatement'
dat[grep(',0', dat$contrast), 'ri_group'] <- 'control'

## stimulus type
dat[grep('csm', dat$contrast), 'stimType'] <- 'csm'
dat[grep('csp', dat$contrast), 'stimType'] <- 'csp'
dat[grep('iti', dat$contrast), 'stimType'] <- 'iti'

dat$stimType <- factor(dat$stimType, levels = c('csp','csm','iti'))

# plot
plotDIFF <- ggplot(dat, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, 
                     color = context, alpha = ri_group), size = 6, height = 0) +
  scale_alpha_discrete(range = c(0.35, 1)) +
  
  geom_point(data = dat %>% filter(context == 'AAAB' & ri_group == 'reinstatement'),aes(shape = stimType), size = 5, color = 'white') +
  geom_point(aes(shape = stimType),size = 4) +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0('ext vs test in ', out_measure,'\n for CS+, CS-, ITI'),
                   labels = lab_names_pos) +
  theme_classic() +
  theme(axis.text = element_text(size =16),
        axis.title = element_text(size = 18),
        axis.ticks.y = element_blank(),
        legend.position = 'none') +
  scale_color_manual(values = context_colors)


# add group names to the right
plotDIFFTEST <- plotDIFF + 
  scale_y_discrete(name = paste0('ext vs test in ', out_measure,'\n for CS+, CS-, ITI'),
                   labels = lab_names_pos) 

# groups right
plotDIFF <- plotDIFF + theme(axis.title.y = element_blank(),
                             axis.line.y = element_blank()) +
  scale_y_discrete(labels = lab_names_pos, position = 'right') 

# y label left
#plotDIFF_Y <- plotDIFF + theme(axis.text.y = element_blank()) 











#windows(width = w, height = h)
plotDIFF

if (save_plot_ind == 1){
  file_nam <- paste0('figures/',out_measure, '_emm_DIFF_wAAAA.tiff')
  ggsave(filename = file_nam, plot = plotDIFF, width = w, height = h, units = 'in')
  
}
